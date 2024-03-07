import 'dart:math';

import 'package:chrconnecthpdraft/feature/onboarding/components/onboarding_six.dart';
import 'package:flutter/material.dart';
import 'components/onboarding_one.dart';
import 'components/onboarding_two.dart';
import 'components/onboarding_three.dart';
import 'components/onboarding_four.dart';
import 'components/onboarding_five.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _selectedPageIndex = 0;

  void _selectPage() {
    //log(index);
    setState(() {
      _selectedPageIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = OnboardingOne(
      onPressNext: () {
        _selectPage();
      },
    );
    log(_selectedPageIndex);
    if (_selectedPageIndex == 1) {
      activePage = OnboardingTwo(onPressNext: () {
        _selectPage();
      });
    }

    if (_selectedPageIndex == 2) {
      activePage = OnboardingThree(onPressNext: () {
        _selectPage();
      });
    }

    if (_selectedPageIndex == 3) {
      activePage = OnboardingFour(onPressNext: () {
        _selectPage();
      });
    }

    if (_selectedPageIndex == 4) {
      activePage = OnboardingFive(onPressNext: () {
        _selectPage();
      });
    }

    if (_selectedPageIndex == 5) {
      activePage = OnboardingSix(onPressNext: () {
        _selectPage();
      });
    }

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
        ),
        child: activePage,
      ),
    );
  }
}
