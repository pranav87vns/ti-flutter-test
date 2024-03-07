import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class OnboardingFour extends StatefulWidget {
  OnboardingFour({super.key, required this.onPressNext});

  final void Function() onPressNext;

  @override
  _SomeWidgetState createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<OnboardingFour> {
  double _width = 380;
  double _height = 290;
  bool _visible = false;
  bool _visibles = false;

  bool _cover = true;
  bool _viewAll = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 500), () => animateContainer());
    });
    Future.delayed(const Duration(seconds: 1), () {
      //asynchronous delay
      if (this.mounted) {
        //checks if widget is still active and not disposed
        setState(() {
          //tells the widget builder to rebuild again because ui has updated
          _visible =
              true; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
    Future.delayed(const Duration(seconds: 2), () {
      //asynchronous delay
      if (this.mounted) {
        //checks if widget is still active and not disposed
        setState(() {
          //tells the widget builder to rebuild again because ui has updated
          _visibles =
              true; //update the variable declare this under your class so its accessible for both your widget build and initState which is located under widget build{}
        });
      }
    });
  }

  void animateContainer() {
    setState(() {
      _cover = false;
      _width = 350;
      _height = 120;
    });
  }

  void onPressNextState() {
    if (_viewAll) {
      widget.onPressNext();
    } else {
      setState(() {
        _cover = false;
        _viewAll = true;
        _width = 140;
        _height = 80;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: new EdgeInsets.only(top: 6.0),
        child: Column(
          children: [
            Padding(
              padding: new EdgeInsets.only(top: 36.0, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.close,
                      size: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: _viewAll
                  ? EdgeInsets.only(top: 56.0, left: 150)
                  : EdgeInsets.only(top: 56.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: AnimatedContainer(
                    width: _width,
                    height: _height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    duration: const Duration(seconds: 1),
                    // Provide an optional curve to make the animation feel smoother.
                    curve: Curves.fastOutSlowIn,
                    child: Image.asset(
                      'images/onboarding-4.png',
                      fit: _cover ? BoxFit.cover : BoxFit.none,
                      alignment: _viewAll
                          ? FractionalOffset.topRight
                          : FractionalOffset.bottomRight,
                    )),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 90,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 90),
                child: Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visible,
                  child: Text(
                    !_viewAll
                        ? "They are direct links to your virtual \nappointments"
                        : "You can view all your scheduled \nappointment via this link",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: _visibles,
              child: SizedBox(
                width: double.infinity,
                height: 30,
                child: Padding(
                  padding: const EdgeInsets.only(left: 90, top: 0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          'Continue',
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(
                                fontWeight: FontWeight.w800,
                              ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          onPressNextState();
                        },
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 22,
                          color: Colors.black,
                          weight: 400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
