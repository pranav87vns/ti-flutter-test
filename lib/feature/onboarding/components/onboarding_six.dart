import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class OnboardingSix extends StatefulWidget {
  const OnboardingSix({super.key, required this.onPressNext});

  final void Function() onPressNext;

  @override
  _SomeWidgetState createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<OnboardingSix> {
  double _width = 390;
  double _height = 0;
  bool _visibles = false;

  bool _cover = true;
  bool _viewAll = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 500), () => animateContainer());
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
      _width = 390;
      _height = 720;
    });
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
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 0.0),
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
                          'images/onboarding-6.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 130),
                  child: Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: _visibles,
                    child: Container(
                      width: 250,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 20),
                        child: Row(
                          children: [
                            Text(
                              "That's all for now! \nClick close to return to \nyour homepage",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.arrow_upward,
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
