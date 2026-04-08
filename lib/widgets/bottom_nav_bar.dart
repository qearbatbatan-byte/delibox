import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 74,
      selectedIndex: currentIndex,
      backgroundColor: AppTheme.dark,
      indicatorColor: AppTheme.accent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined, color: Colors.white70),
          selectedIcon: Icon(Icons.home_rounded, color: AppTheme.primary),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.inventory_2_outlined, color: Colors.white70),
          selectedIcon:
              Icon(Icons.inventory_2_rounded, color: AppTheme.primary),
          label: 'Monitoring',
        ),
        NavigationDestination(
          icon: Icon(Icons.receipt_long_outlined, color: Colors.white70),
          selectedIcon:
              Icon(Icons.receipt_long_rounded, color: AppTheme.primary),
          label: 'History',
        ),
      ],
    );
  }
}
