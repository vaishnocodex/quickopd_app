import 'package:flutter/material.dart';
import 'package:quick_opd/core/themes/app_constants.dart';

extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
  Brightness get screenBrightness => MediaQuery.of(this).platformBrightness;
  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get navigationBarHeight => MediaQuery.of(this).padding.bottom;

  ThemeData get appTheme => Theme.of(this);
  TextTheme get appTextTheme => Theme.of(this).textTheme;
  DefaultTextStyle get appDefaultTextStyle => DefaultTextStyle.of(this);

  FormState? get currentFormState => Form.of(this);
  ScaffoldState get scaffold => Scaffold.of(this);
  OverlayState? get overlay => Overlay.of(this);

  Color get primaryColor => appTheme.primaryColor;
  Color get accentColor => appTheme.colorScheme.secondary;
  Color get scaffoldBackgroundColor => appTheme.scaffoldBackgroundColor;
  Color get cardColor => appTheme.cardColor;
  Color get dividerColor => appTheme.dividerColor;
  Color get iconColor => appTheme.iconTheme.color!;
  Color get elevatedButtonColor {
    final buttonStyle = appTheme.elevatedButtonTheme.style;
    return buttonStyle?.backgroundColor?.resolve(<WidgetState>{}) ??
        cardColor;
  }

  void focus(FocusNode focusNode) {
    FocusScope.of(this).requestFocus(focusNode);
  }

  void unFocus(FocusNode focusNode) {
    focusNode.unfocus();
  }

  bool get isPhone => screenWidth < AppConstants.tabletBreakpointGlobal;
  bool get isTablet =>
      screenWidth < AppConstants.desktopBreakpointGlobal &&
      screenWidth >= AppConstants.tabletBreakpointGlobal;
  bool get isDesktop => screenWidth >= AppConstants.desktopBreakpointGlobal;
}
