import 'dart:async';

import 'package:flutter/material.dart';

import '../main.dart';
import '../theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const String routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1800), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFFFF9F3), AppTheme.background],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: -80,
              right: -80,
              bottom: -180,
              child: Container(
                height: 380,
                decoration: const BoxDecoration(
                  color: Color(0xFFC99972),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(240),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  _LogoBadge(size: 118),
                  SizedBox(height: 24),
                  Text(
                    'DELIBOX',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: AppTheme.primary,
                      letterSpacing: 2.4,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Smart Locker System',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.muted,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoBadge extends StatelessWidget {
  const _LogoBadge({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: const [
          Icon(
            Icons.inventory_2_rounded,
            size: 64,
            color: AppTheme.primary,
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: AppTheme.accent,
              child: Icon(Icons.lock_rounded, size: 16, color: AppTheme.dark),
            ),
          ),
        ],
      ),
    );
  }
}
