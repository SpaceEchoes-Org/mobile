//sojourner rover screen 
import 'package:flutter/material.dart';
import 'package:mobile/core/utils/app_colors.dart';

const _peach = Color(0xFFF0C48F);
const _pink = Color(0xFFF0A090);
const _purple = Color(0xFF5B4FA8);
const _label = Color(0xFF8478C8);

class OpportunityScreen extends StatelessWidget {
  const OpportunityScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.primary,
    ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2E2858), Color(0xFF1C1838)],
            ),
          ),
          child: SafeArea(
            child: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                const _Hero(),
                _Section(Icons.rocket_launch_outlined, 'Who Am I?', [
                  const Text('Opportunity',
                      style: TextStyle(color: _peach, fontSize: 19, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 6),
                  const Text('The marathon rover',
                      style: TextStyle(color: Colors.white60, fontSize: 15)),
                ]),
                _Section(Icons.track_changes, 'My Mission', [
                  for (final t in [
                    'I was part of NASA\'s Mars Exploration Rover mission.',
                    'I explored Meridiani Planum, searching for evidence of past water on Mars.',
                    'I studied Martian rocks and soil to understand the planet\'s ancient environment.',
                  ])
                    _Bullet(t),
                ]),
                _Section(Icons.location_on_outlined, 'My Journey', [
                  const _Timeline([
                    ('LAUNCHED FROM', 'Florida, USA'),
                    ('LANDED ON', 'Meridiani Planum, Mars'),
                    ('MISSION DURATION', ' Almost 15 years'),
                    ('WHERE AM I NOW?',
                        'A severe Mars-wide dust storm covered my location, blocking sunlight\nfrom reaching my solar panels and reducing my power.'),
                  ]),
                ]),
                _Section(Icons.monitor_heart_outlined, 'My Current Status', [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 9),
                    decoration: BoxDecoration(color: _peach, borderRadius: BorderRadius.circular(30)),
                    child: const Text('No longer operational',
                        style: TextStyle(color: Color(0xFF2A2448), fontWeight: FontWeight.w600)),
                  ),
                  const SizedBox(height: 14),
                  const Text('My link to Earth, was lost.\nWant to watch? Please copy this link\nhttps://drive.google.com/drive/folders/1_i8hWZglRBEMn_-4dV5AQq3_G9XVoiFL',
                      style: TextStyle(color: Colors.white60, fontSize: 15, height: 1.5)),
                ]),
              
              SizedBox(height: 30),

               //quize bottom 
               Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: const LinearGradient(
                      colors: [
                       AppColors.salmonpink,
                        AppColors.accent,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFB6A6)
                            .withOpacity(0.18),
                        blurRadius: 25,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    child: const Text(
                      'Take the Quiz',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),







              ],
            ),
          ),
        ),
      );
}

class _Hero extends StatelessWidget {
  const _Hero();

  @override
  Widget build(BuildContext context) => Container(
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFF4B4272),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Positioned(top: -71, right: -71, child: _Moon()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 82,
                  height: 82,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFF5D6A0), Color(0xFFF0AE9C)],
                    ),
                  ),
                  child: const Text('🤖', style: TextStyle(fontSize: 44)),
                ),
                const SizedBox(height: 26),
                const Text(
                  '“Hello, Explorer! I\'m Sojourner, the first rover to drive on Mars.”',
                  style: TextStyle(
                      color: Colors.white, fontSize: 29, fontWeight: FontWeight.w800, height: 1.3),
                ),
                const SizedBox(height: 8), 

               

              ],
            ),
          ],
        ),
      );
}

class _Moon extends StatelessWidget {
  const _Moon();

  @override
  Widget build(BuildContext context) => Container(
        width: 190,
        height: 190,
        padding: const EdgeInsets.only(right: 70, top: 70, left: 30, bottom: 30),
        decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFF2D2650)),
        child: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              center: Alignment(-0.3, -0.3),
              colors: [Color(0xFFB9A8B8), Color(0xFF6B5A7C), Color(0xFF3F3558)],
            ),
          ),
        ),
      );
}

class _Section extends StatelessWidget {
  final IconData icon;
  final String title;
  final List<Widget> children;
  const _Section(this.icon, this.title, this.children);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 17),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFF2A2548),
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.white12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              CircleAvatar(radius: 17, backgroundColor: _purple, child: Icon(icon, size: 18, color: _peach)),
              const SizedBox(width: 12),
              Text(title,
                  style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)),
            ]),
            const SizedBox(height: 18),
            ...children,
          ],
        ),
      );
}

class _Bullet extends StatelessWidget {
  final String text;
  const _Bullet(this.text);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 9,
            height: 9,
            decoration: const BoxDecoration(color: _pink, shape: BoxShape.circle),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(text, style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.5)),
          ),
        ]),
      );
}

class _Timeline extends StatelessWidget {
  final List<(String, String)> items;
  const _Timeline(this.items);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 6),
        padding: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(border: Border(left: BorderSide(color: _purple, width: 3))),
        child: Column(
          children: [
            for (final (label, value) in items)
              Stack(clipBehavior: Clip.none, children: [
                Positioned(
                  left: -29,
                  top: 0,
                  child: Container(
                    width: 13,
                    height: 13,
                    decoration: const BoxDecoration(color: _peach, shape: BoxShape.circle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 18),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(label,
                          style: const TextStyle(
                              color: _label, fontSize: 12, letterSpacing: 1.5, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 4),
                      Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, height: 1.45)),
                    ]),
                  ),
                ),
              ]),
          ],
        ),
      );
}
