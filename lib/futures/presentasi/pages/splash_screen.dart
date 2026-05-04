import 'package:flutter/material.dart';
import 'package:flutter_porto_smkid/futures/presentasi/widget/circle_style.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -101,
            left: -67,
            child: CircleStyle(size: 190, color: Color(0xffE04E4E)),
          ),
          Positioned(
            top: 145,
            right: -67,
            child: CircleStyle(size: 190, color: Color(0xffE04E4E)),
          ),
          Positioned(
            left: -75,
            bottom: -75,
            child: CircleStyle(size: 310, color: Color(0xffE04E4E)),
          ),
          Positioned(
            left: -75,
            bottom: -75,
            child: CircleStyle(size: 310, color: Color(0xffE04E4E)),
          ),
          Positioned(
            left: -31,
            top: 354,
            child: CircleStyle(
              size: 88,
              color: Color(0xffFFE0E0),
              isGlass: true,
            ),
          ),
          Positioned(
            right: -47,
            bottom: 183,
            child: CircleStyle(
              size: 133,
              color: Color(0xffFFE0E0),
              isGlass: true,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  child: Text(
                    "Selamat Datang di \n Aplikasi Laporan Siswa",
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 0.24,
                      fontStyle: FontStyle.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  onTap: (){},
                ),
                SizedBox(height: 3),
                RichText(
                  text: TextSpan(
                    style: GoogleFonts.inter(
                      fontSize: 8.87,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.089,
                      fontStyle: FontStyle.normal,
                    ),
                    children: [
                      TextSpan(text: "Sudah Memiliki Akun?",style: GoogleFonts.inter(

                        fontSize: 10.87,
                      ),),
                      TextSpan(
                        text: "*",
                        style: GoogleFonts.inter(
                          color: Colors.red,
                          fontSize: 10.87,
                        ),
                      ),
                      TextSpan(
                        text: "jika belum klik",
                        style: GoogleFonts.inter(fontSize: 10.87),
                      ),
                      WidgetSpan(child: SizedBox(width: 2)),
                      TextSpan(
                        text: "Daftar",
                        style: GoogleFonts.inter(
                          fontSize: 10.87,
                          decoration: TextDecoration.underline,
                          decorationThickness: 2.0,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffE04E4E),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        "Masuk",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 13.829,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
