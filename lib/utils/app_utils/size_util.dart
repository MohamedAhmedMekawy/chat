import 'dart:math' show min, max;
import 'dart:ui' as ui show FlutterView;

import 'package:flutter/widgets.dart';

typedef FontSizeResolver = double Function(num fontSize, SizeUtil instance);

class SizeUtil {
  static const Size defaultSize = Size(360, 690);
  static final SizeUtil _instance = SizeUtil._();

  late Size _uiSize;

  late Orientation _orientation;

  late bool _minTextAdapt;
  late MediaQueryData _data;
  late bool _splitScreenMode;
  FontSizeResolver? fontSizeResolver;

  SizeUtil._();

  factory SizeUtil() => _instance;

//******** to lisin to Screen Size when change *********** */
  static Future<void> ensureScreenSize([
    ui.FlutterView? window,
    Duration duration = const Duration(milliseconds: 10),
  ]) async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    binding.deferFirstFrame();

    await Future.doWhile(() {
      window ??= binding.platformDispatcher.implicitView;

      if (window == null || window!.physicalSize.isEmpty) {
        return Future.delayed(duration, () => true);
      }

      return false;
    });

    binding.allowFirstFrame();
  }

  Set<Element>? _elementsToRebuild;

//******** set data *********** */

  static void configure({
    MediaQueryData? data,
    Size? designSize,
    bool? splitScreenMode,
    bool? minTextAdapt,
    FontSizeResolver? fontSizeResolver,
  }) {
    try {
      if (data != null) {
        _instance._data = data;
      } else {
        data = _instance._data;
      }

      if (designSize != null) {
        _instance._uiSize = designSize;
      } else {
        designSize = _instance._uiSize;
      }
    } catch (_) {
      throw Exception(
          'You must either use SizeUtil.init or SizeUtilInit first');
    }

    final MediaQueryData? deviceData = data.nonEmptySizeOrNull();
    final Size deviceSize = deviceData?.size ?? designSize;

    final orientation = deviceData?.orientation ??
        (deviceSize.width > deviceSize.height
            ? Orientation.landscape
            : Orientation.portrait);

    _instance
      ..fontSizeResolver = fontSizeResolver ?? _instance.fontSizeResolver
      .._minTextAdapt = minTextAdapt ?? _instance._minTextAdapt
      .._splitScreenMode = splitScreenMode ?? _instance._splitScreenMode
      .._orientation = orientation;

    _instance._elementsToRebuild?.forEach((el) => el.markNeedsBuild());
  }

  //******** init screen size and context *********** */

  static void init(
    BuildContext context, {
    Size designSize = defaultSize,
    bool splitScreenMode = false,
    bool minTextAdapt = false,
    FontSizeResolver? fontSizeResolver,
  }) {
    return configure(
      data: MediaQuery.maybeOf(context),
      designSize: designSize,
      splitScreenMode: splitScreenMode,
      minTextAdapt: minTextAdapt,
      fontSizeResolver: fontSizeResolver,
    );
  }

  Orientation get orientation => _orientation;
  double get textScaleFactor => _data.textScaleFactor;
  double? get pixelRatio => _data.devicePixelRatio;
  double get screenWidth => _data.size.width;
  double get screenHeight => _data.size.height;
  double get statusBarHeight => _data.padding.top;
  double get bottomBarHeight => _data.padding.bottom;
  double get scaleWidth => screenWidth / _uiSize.width;
  double get scaleHeight =>
      (_splitScreenMode ? max(screenHeight, 700) : screenHeight) /
      _uiSize.height;

  double get scaleText =>
      _minTextAdapt ? min(scaleWidth, scaleHeight) : scaleWidth;

  double setWidth(num width) => width * scaleWidth;

  double setHeight(num height) => height * scaleHeight;

  double radius(num r) => r * min(scaleWidth, scaleHeight);

  double setSp(num fontSize) =>
      fontSizeResolver?.call(fontSize, _instance) ?? fontSize * scaleText;

  SizedBox setVerticalSpacing(num height) =>
      SizedBox(height: setHeight(height));

  SizedBox setHorizontalSpacing(num width) => SizedBox(width: setWidth(width));
}

extension on MediaQueryData? {
  MediaQueryData? nonEmptySizeOrNull() {
    if (this?.size.isEmpty ?? true) {
      return null;
    } else {
      return this;
    }
  }
}
