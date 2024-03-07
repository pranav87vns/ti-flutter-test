import 'package:chrconnecthpdraft/feature/app/extension/context.dart';
import 'package:flutter/material.dart';

class OnboardingTwo extends StatefulWidget {
  const OnboardingTwo({super.key, required this.onPressNext});

  final void Function() onPressNext;

  @override
  _SomeWidgetState createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State<OnboardingTwo> {
  bool _visible = false;
  bool _visibles = false;

  @override
  void initState() {
    super.initState(); //when this route starts, it will execute this code
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
              padding: new EdgeInsets.only(top: 56.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                child: Container(
                  width: 380,
                  height: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Image.asset(
                        'images/onboarding-2.png',
                        fit: BoxFit.cover,
                        height: 140.0,
                        width: 140.0,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 90,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 16),
                child: Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: _visible,
                  child: Text(
                    "The first section shows your reminders. If \nthere are any tasks requiring action from \nyou, youll find them here",
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
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, top: 10),
                  child: Row(
                    children: [
                      Text(
                        'Scroll to the next section',
                        style:
                            Theme.of(context).textTheme.displaySmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.onPressNext();
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
