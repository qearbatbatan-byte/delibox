import 'package:flutter/material.dart';

import '../main.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/custom_button.dart';

class MonitoringScreen extends StatelessWidget {
  const MonitoringScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monitoring'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.person_outline_rounded),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.deliveryForm);
        },
        child: const Icon(Icons.add_rounded, size: 30),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: const Color(0xFF9E6C45),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF9E2F24),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'No active delivery',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Center(child: _LockerIllustration()),
                    const SizedBox(height: 18),
                    Text(
                      'Create a delivery request to grant temporary locker access.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            label: 'View Logs',
                            isOutlined: true,
                            foregroundColor: Colors.white,
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.activityLogs);
                            },
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: CustomButton(
                            label: 'Add Delivery',
                            backgroundColor: AppTheme.accent,
                            foregroundColor: AppTheme.dark,
                            onPressed: () {
                              Navigator.pushNamed(context, AppRoutes.deliveryForm);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onDestinationSelected: (index) {
          const routes = [
            AppRoutes.home,
            AppRoutes.monitoring,
            AppRoutes.activityLogs,
          ];
          Navigator.pushReplacementNamed(context, routes[index]);
        },
      ),
    );
  }
}

class _LockerIllustration extends StatelessWidget {
  const _LockerIllustration();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      height: 180,
      child: CustomPaint(
        painter: _LockerPainter(),
      ),
    );
  }
}

class _LockerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final front = Path()
      ..moveTo(size.width * 0.28, size.height * 0.35)
      ..lineTo(size.width * 0.28, size.height * 0.7)
      ..lineTo(size.width * 0.5, size.height * 0.85)
      ..lineTo(size.width * 0.5, size.height * 0.5)
      ..close();

    final side = Path()
      ..moveTo(size.width * 0.5, size.height * 0.5)
      ..lineTo(size.width * 0.72, size.height * 0.35)
      ..lineTo(size.width * 0.72, size.height * 0.7)
      ..lineTo(size.width * 0.5, size.height * 0.85)
      ..close();

    final top = Path()
      ..moveTo(size.width * 0.28, size.height * 0.35)
      ..lineTo(size.width * 0.5, size.height * 0.2)
      ..lineTo(size.width * 0.72, size.height * 0.35)
      ..lineTo(size.width * 0.5, size.height * 0.5)
      ..close();

    canvas.drawPath(front, paint);
    canvas.drawPath(side, paint);
    canvas.drawPath(top, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
