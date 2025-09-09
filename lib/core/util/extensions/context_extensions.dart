import 'dart:io';

import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nwhco_app/core/util/extensions/num_extensions.dart';

extension ContextExtensions on BuildContext {
  // Locale
  Locale? get currentLocale => EasyLocalization.of(this)?.currentLocale;

  String get languageCode => currentLocale?.languageCode ?? 'en';

  // Theme
  bool get isRtl => Directionality.of(this) == TextDirection.rtl;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  bool get isDarkMode => theme.brightness == Brightness.dark;

  MediaQueryData get mq => MediaQuery.of(this);

  Size get mqSize => mq.size;

  EdgeInsets get insets => mq.viewInsets;

  EdgeInsets get padding => mq.viewPadding;

  Future<T?> pushFullScreenDialogPage<T>(Widget page) {
    return Navigator.of(this).push(
      PageRouteBuilder(
        settings: RouteSettings(name: page.runtimeType.toString()),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
    );
  }

  void pop<T>([T? result]) => Navigator.pop(this, result);

  Future<T?> push<T>(Widget page, [String? name]) {
    return Navigator.push(
      this,
      PageRouteBuilder(
        opaque: false,
        settings: RouteSettings(name: name ?? page.runtimeType.toString()),
        pageBuilder: (_, __, ___) => page,
        transitionsBuilder: (_, a, __, c) {
          return FadeTransition(opacity: a, child: c);
        },
      ),
    );
  }

  Future<T?> pushPage<T>(Widget page, [String? name, Object? arguments]) {
    final routeName = name ?? page.runtimeType.toString();

    return Navigator.push(
      this,
      _createSlideRoute(
        page: page,
        settings: RouteSettings(
          name: routeName,
          arguments: arguments,
        ),
      ),
    );
  }

  Future<T?> replacePage<T>(Widget page, [String? name, Object? arguments]) {
    return Navigator.pushReplacement(
      this,
      _createSlideRoute(
        page: page,
        settings: RouteSettings(
          name: name ?? page.runtimeType.toString(),
          arguments: arguments,
        ),
      ),
    );
  }

  Future<T?> pushNamedPage<T>(String name) {
    return Navigator.pushNamed(this, name);
  }

  Future<T?> pushReplacementNamed<T>(String name) {
    return Navigator.pushReplacementNamed(this, name);
  }

  Future<T?> pushNamedAndRemoveUntil<T>(
      String name, bool Function(Route<dynamic>) predicate) {
    return Navigator.pushNamedAndRemoveUntil(this, name, predicate);
  }

  Future<T?> popAndPushNamedPage<T>(String name) {
    return Navigator.popAndPushNamed(this, name);
  }

  Future<T?> pushReplacementPage<T>(
    Widget page, [
    String? name,
    Object? arguments,
  ]) {
    return Navigator.pushReplacement(
      this,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => page,
        settings: RouteSettings(
          name: name ?? page.runtimeType.toString(),
          arguments: arguments,
        ),
        transitionsBuilder: (_, a, __, c) {
          return FadeTransition(opacity: a, child: c);
        },
      ),
    );
  }

  void showSnackBar(String content) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(content),
        margin: EdgeInsets.all(16),
        backgroundColor: Colors.black,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

PageRoute<T> _createSlideRoute<T>({
  required Widget page,
  required RouteSettings settings,
}) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) => page,
    );
  }

  return PageRouteBuilder<T>(
    opaque: false,
    settings: settings,
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionDuration: 350.ms,
    reverseTransitionDuration: 200.ms,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final begin = context.isRtl ? Offset(-1.0, 0.0) : Offset(1.0, 0.0);

      final tween = Tween(begin: begin, end: Offset.zero).chain(
        CurveTween(curve: Curves.easeInOut),
      );

      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
