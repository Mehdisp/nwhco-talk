import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/context_extensions.dart';
import 'package:nwhco_app/core/util/extensions/num_extensions.dart';
import 'package:nwhco_app/core/values/colors.dart';
import 'package:nwhco_app/features/talk/presentation/talk_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((ts) async {
      await Future.delayed(2.sec);

      if (!mounted) return;
      context.pushReplacementPage(const TalkScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/png/splash_fullscreen.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: _FadeAnimationWidget(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/png/habib_rounded_logo.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Habib".tr(),
                      style: const TextStyle(
                        fontSize: 34,
                        fontFamily: 'SegoeuiBold',
                        height: 1,
                        letterSpacing: 0,
                        fontStyle: FontStyle.normal,
                        color: AppColors.grey6,
                      ),
                    ),
                    const SizedBox(height: 11),
                    Text(
                      "Integrated Islamic App".tr(),
                      style: const TextStyle(
                        fontSize: 16,
                        height: 1,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grey3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FadeAnimationWidget extends StatefulWidget {
  final Widget child;

  const _FadeAnimationWidget({
    required this.child,
  });

  @override
  _FadeAnimationWidgetState createState() => _FadeAnimationWidgetState();
}

class _FadeAnimationWidgetState extends State<_FadeAnimationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: 1.sec);

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
