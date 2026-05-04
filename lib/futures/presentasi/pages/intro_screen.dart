import 'package:flutter/material.dart';
import 'package:flutter_porto_smkid/futures/presentasi/pages/splash_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> scaleAnim;
  late Animation<double> opacityAnim;
  late Animation<double> textOpacity;

  final assets = "assets/svg/icon_megaPhone.svg";

  final curve = const Cubic(1, 0.02, 0, 0.97);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    scaleAnim = Tween(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: curve));

    opacityAnim = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: curve));

    textOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 1.0, curve: Cubic(1, 0.02, 0, 0.97)),
      ),
    );

    //Delay 500ms
    Future.delayed(const Duration(milliseconds: 500), () {
      controller.forward();
    });

    //move halaman splash screen
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(milliseconds: 3000), () {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (_, _, _) => const SplashScreen(),
              transitionDuration: const Duration(milliseconds: 900),
              transitionsBuilder: (_, animation, _, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //LOGO
                Opacity(
                  opacity: opacityAnim.value,
                  child: Transform.scale(
                    scale: scaleAnim.value,
                    child: _buildLogo(100),
                  ),
                ),

                const SizedBox(height: 20),
                //TEXT
                Opacity(
                  opacity: textOpacity.value,
                  child: Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 24,
                            color: const Color(0xffE04E4E),
                            fontWeight: FontWeight.w800,
                          ),
                          children: const [
                            TextSpan(text: "Mo"),
                            TextSpan(
                              text: "Trust",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        "Aplikasi Laporan Siswa",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xff8E8E93),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLogo(double size) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        color: Color(0xffE04E4E),
        shape: BoxShape.circle,
      ),
      child: Center(child: SvgPicture.asset(assets, width: size * 0.5)),
    );
  }
}
