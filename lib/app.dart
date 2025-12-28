import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/home/presentation/home_screen.dart';
import 'features/balance_game/presentation/balance_game_screen.dart';
import 'features/topic_card/presentation/topic_card_screen.dart';
import 'features/sos_tips/presentation/sos_tips_screen.dart';

class WingmanApp extends StatelessWidget {
  const WingmanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '소개팅 윙맨',
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            );
          case '/balance':
            return MaterialPageRoute(
              builder: (_) => const BalanceGameScreen(),
            );
          case '/topic':
            final level = settings.arguments as int? ?? 0;
            return MaterialPageRoute(
              builder: (_) => TopicCardScreen(level: level),
            );
          case '/sos':
            return MaterialPageRoute(
              builder: (_) => const SosTipsScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const HomeScreen(),
            );
        }
      },
    );
  }
}

