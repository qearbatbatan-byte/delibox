import 'package:flutter/material.dart';

import '../main.dart';
import '../theme/app_theme.dart';
import '../widgets/bottom_nav_bar.dart';

class ActivityLogsScreen extends StatelessWidget {
  const ActivityLogsScreen({super.key});

  static const String routeName = '/activity-logs';

  @override
  Widget build(BuildContext context) {
    final logs = [
      const _LogItem(
        title: 'Unauthorized attempt',
        time: 'January 10, 2026 | 12:00 PM',
        description: 'Wrong number entered during access request.',
        color: AppTheme.danger,
        icon: Icons.warning_amber_rounded,
      ),
      const _LogItem(
        title: 'Locker opened',
        time: 'January 10, 2026 | 12:02 PM',
        description: 'Access granted successfully for delivery number 012345.',
        color: Color(0xFF685852),
        icon: Icons.lock_open_rounded,
      ),
      const _LogItem(
        title: 'Locker closed',
        time: 'January 10, 2026 | 12:03 PM',
        description: 'Locker door closed and secure state restored.',
        color: Color(0xFF83746C),
        icon: Icons.lock_rounded,
      ),
      const _LogItem(
        title: 'Delivery completed',
        time: 'January 10, 2026 | 12:05 PM',
        description: 'Package drop-off was recorded for the assigned locker.',
        color: Color(0xFFA0836D),
        icon: Icons.inventory_2_rounded,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Logs'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.history_rounded),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        itemCount: logs.length + 1,
        separatorBuilder: (_, __) => const SizedBox(height: 14),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: AppTheme.dark,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Activity Logs',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Track every open, close, and unauthorized action in the locker system.',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white70,
                        ),
                  ),
                ],
              ),
            );
          }

          final log = logs[index - 1];
          return Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: log.color,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white.withValues(alpha: 0.16),
                  child: Icon(log.icon, color: Colors.white),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        log.time,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        log.description,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 2,
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

class _LogItem {
  const _LogItem({
    required this.title,
    required this.time,
    required this.description,
    required this.color,
    required this.icon,
  });

  final String title;
  final String time;
  final String description;
  final Color color;
  final IconData icon;
}
