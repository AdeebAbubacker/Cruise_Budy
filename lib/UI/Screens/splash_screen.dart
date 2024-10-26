import 'package:cruise_buddy/UI/Screens/home_screen.dart';
import 'package:cruise_buddy/core/constants/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cruise_buddy/UI/Widgets/wave_clipper/first_wave_clipper.dart';
import 'package:cruise_buddy/UI/Widgets/wave_clipper/second_wave_clipper.dart';
import 'package:cruise_buddy/UI/Widgets/wave_clipper/third_wave_clipper.dart';
import 'package:cruise_buddy/UI/Widgets/wave_clipper/fourth_wave_clipper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2200),
    )..forward();

    Future.delayed(const Duration(milliseconds: 1800), () {
      if (mounted) {
        setState(() {
          _opacity = 1.0;
        });
      }
    });

    // Future.delayed(const Duration(milliseconds: 2600), () {
    //   if (mounted) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => const HomeScreen()),
    //     );
    //   }
    // });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SizedBox(
        height: screenSize.height,
        width: screenSize.width,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: [
                // Background color
                Positioned.fill(
                  child: Container(
                    color: ColorConstants.whiteFF,
                  ),
                ),

                //  Fourth wave
                Positioned.fill(
                  child: ClipPath(
                    clipper: FourthWaveClipper(_controller.value,
                        waveHeight: 25, phaseShift: pi / 2),
                    child: Container(
                      color: ColorConstants.lightblueD5,
                    ),
                  ),
                ),
                //  Third wave
                Positioned.fill(
                  child: ClipPath(
                    clipper: ThirdWaveClipper(_controller.value,
                        waveHeight: 25, phaseShift: pi / 1),
                    child: Container(
                      color: ColorConstants.lightblueDB,
                    ),
                  ),
                ),

                //  Second wave
                Positioned.fill(
                  child: ClipPath(
                    clipper: SecondWaveClipper(_controller.value,
                        waveHeight: 25, phaseShift: pi / 2),
                    child: Container(
                      color: ColorConstants.lightblueCE,
                    ),
                  ),
                ),
                // First wave
                Positioned.fill(
                  child: ClipPath(
                    clipper: FirstWaveClipper(_controller.value,
                        waveHeight: 25, phaseShift: pi / 1),
                    child: Container(
                      color: ColorConstants.darkblue86,
                    ),
                  ),
                ),

                AnimatedOpacity(
                  opacity: _opacity,
                  duration: const Duration(milliseconds: 1300),
                  child: Center(
                    child: Stack(
                      children: [
                        SizedBox.expand(
                          child: Image.asset(
                            'assets/splash_image.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Center(
                          child: Image.asset('assets/logo.png'),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
