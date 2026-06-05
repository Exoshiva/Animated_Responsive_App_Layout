import 'package:flutter/material.dart';

import '../animations.dart';
import '../destinations.dart';
import '../transitions/bottom_bar_transition.dart';

class DisappearingBottomNavigationBar extends StatelessWidget {
  const DisappearingBottomNavigationBar({
    super.key,
    required this.barAnimation,
    required this.selectedIndex,
    this.onDestinationSelected,
  });

  final BarAnimation barAnimation;
  final int selectedIndex;
  final ValueChanged<int>? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BottomBarTransition(
      animation: barAnimation,
      backgroundColor: colorScheme.surface,
      child: NavigationBar(
      elevation:0,
      backgroundColor: colorScheme.surface,
      destinations: destinations.map<NavigationDestination>((d) {
        return NavigationDestination(icon:Icon(d.icon), label: d.label);
      }).toList(),
      selectedIndex : selectedIndex,
      onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}

