import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/constants/app_constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 32),
              // 앱 타이틀
              Text(
                '💕 ${AppConstants.appName}',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 8),
              Text(
                AppConstants.appTagline,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppTheme.textLight,
                    ),
              ),
              const SizedBox(height: 48),

              // 단계별 모드 선택
              Expanded(
                child: ListView(
                  children: [
                    _ModeCard(
                      level: 1,
                      color: AppTheme.level1Color,
                      onTap: () =>
                          Navigator.pushNamed(context, '/topic', arguments: 1),
                    ),
                    const SizedBox(height: 16),
                    _ModeCard(
                      level: 2,
                      color: AppTheme.level2Color,
                      onTap: () =>
                          Navigator.pushNamed(context, '/topic', arguments: 2),
                    ),
                    const SizedBox(height: 16),
                    _ModeCard(
                      level: 3,
                      color: AppTheme.level3Color,
                      onTap: () =>
                          Navigator.pushNamed(context, '/topic', arguments: 3),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 하단 기능 버튼
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _FeatureButton(
                    icon: Icons.balance,
                    label: '밸런스게임',
                    onTap: () => Navigator.pushNamed(context, '/balance'),
                  ),
                  _FeatureButton(
                    icon: Icons.casino,
                    label: '토픽 룰렛',
                    onTap: () =>
                        Navigator.pushNamed(context, '/topic', arguments: 0),
                  ),
                  _FeatureButton(
                    icon: Icons.lightbulb_outline,
                    label: 'SOS 팁',
                    onTap: () => Navigator.pushNamed(context, '/sos'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _ModeCard extends StatelessWidget {
  final int level;
  final Color color;
  final VoidCallback onTap;

  const _ModeCard({
    required this.level,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final levelInfo = AppConstants.levels[level]!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color, width: 2),
        ),
        child: Row(
          children: [
            Text(levelInfo.emoji, style: const TextStyle(fontSize: 48)),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Lv.$level',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        levelInfo.title,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    levelInfo.subtitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppTheme.textLight,
                        ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color),
          ],
        ),
      ),
    );
  }
}

class _FeatureButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _FeatureButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 28, color: AppTheme.primaryPeach),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textDark,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

