import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile/core/utils/app_assets.dart';
import 'package:mobile/features/home/presention/view/appolo_view.dart';


class LevelData {
  final int level;
  final String title;
  final String subtitle;
  final String? emoji;
  final bool unlocked;
  final WidgetBuilder? pageBuilder;

  const LevelData({
    required this.level,
    required this.title,
    required this.subtitle,
    this.emoji,
    this.unlocked = false,
    this.pageBuilder,
  });
}

final _levels = [
  LevelData(
    level: 1,
    title: 'Eagle (Apollo 11 Lunar Module)',
    subtitle: 'First crewed landing on the Moon',
    emoji: '🦅',
    unlocked: true,
    pageBuilder: (_) => const EagleScreen(),
  ),
  LevelData(
    level: 2,
    title: 'Lunar Roving Vehicle',
    subtitle: 'The Moon buggy',
  ),
  LevelData(
    level: 3,
    title: 'Lunar Laser Ranging Retroreflector',
    subtitle: 'A mirror that still works',
  ),
];

class MoonScreen extends StatelessWidget {
  const MoonScreen({super.key});

  static const _bgTop = Color(0xFF3B3269);
  static const _bgMid = Color(0xFF241E4A);
  static const _bgBottom = Color(0xFF15122F);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _bgBottom,
      body: Stack(
        children: [
          // Background gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [_bgTop, _bgMid, _bgBottom],
                  stops: [0.0, 0.5, 1.0],
                ),
              ),
            ),
          ),
          // Stars
          Positioned.fill(child: CustomPaint(painter: _StarsPainter())),
          // Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  const SizedBox(height: 4),
                  // Moon (asset image)
                  SizedBox(
                    width: width * 0.54,
                    height: width * 0.54,
                    child: ClipOval(
                      child: Image.asset(
                        AppImages.homemoon,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'The Moon',
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 38,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      'Our closest neighbor still holds machines left by Apollo astronauts more than 50 years ago.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 15.5,
                        height: 1.45,
                        color: const Color(0xFFC9C3E6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Levels + timeline
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Stack(
                      children: [
                        // Vertical timeline line (behind cards)
                        Positioned(
                          left: 27,
                          top: 80,
                          bottom: 28,
                          child: Container(
                            width: 4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xFFC59A7C), Color(0xFF5A4A86)],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            for (int i = 0; i < _levels.length; i++) ...[
                              LevelCard(data: _levels[i]),
                              if (i != _levels.length - 1)
                                const SizedBox(height: 19),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LevelCard extends StatelessWidget {
  final LevelData data;
  const LevelCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final unlocked = data.unlocked;
    final builder = data.pageBuilder;

    final card = Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: unlocked
            ? const Color(0xFF2B2459)
            : Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: unlocked
              ? const Color(0xFF3F3779)
              : Colors.white.withOpacity(0.08),
          width: 1.2,
        ),
        boxShadow: unlocked
            ? [
                BoxShadow(
                  color: const Color(0xFFD9A06E).withOpacity(0.22),
                  blurRadius: 24,
                  offset: const Offset(-6, 8),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (unlocked && builder != null)
                ? () => Navigator.of(context).push(
                      MaterialPageRoute(builder: builder),
                    )
                : null,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
              child: Row(
                children: [
                  // Icon box
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: unlocked
                          ? const Color(0xFF5B4BA0)
                          : Colors.white.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    alignment: Alignment.center,
                    child: unlocked
                        ? Text(data.emoji ?? '',
                            style: const TextStyle(fontSize: 26))
                        : const Icon(
                            Icons.lock_outline_rounded,
                            size: 28,
                            color: Color(0xFFB9B2DC),
                          ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'LEVEL ${data.level} · ${unlocked ? 'UNLOCKED' : 'LOCKED'}',
                          style: GoogleFonts.inter(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2,
                            color: const Color(0xFF8E85C9),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          data.title,
                          style: GoogleFonts.spaceGrotesk(
                            fontSize: 18,
                            height: 1.2,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          data.subtitle,
                          style: GoogleFonts.inter(
                            fontSize: 14.5,
                            color: const Color(0xFFC9C3E6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    return unlocked ? card : Opacity(opacity: 0.45, child: card);
  }
}

class _StarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rnd = Random(7);
    final paint = Paint();
    for (int i = 0; i < 70; i++) {
      final dx = rnd.nextDouble() * size.width;
      final dy = rnd.nextDouble() * size.height;
      final r = 0.5 + rnd.nextDouble() * 1.0;
      paint.color = Colors.white.withOpacity(0.25 + rnd.nextDouble() * 0.55);
      canvas.drawCircle(Offset(dx, dy), r, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}