/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Documents.svg
  String get documents => 'assets/icons/Documents.svg';

  /// File path: assets/icons/Figma_file.svg
  String get figmaFile => 'assets/icons/Figma_file.svg';

  /// File path: assets/icons/Search.svg
  String get search => 'assets/icons/Search.svg';

  /// File path: assets/icons/doc_file.svg
  String get docFile => 'assets/icons/doc_file.svg';

  /// File path: assets/icons/drop_box.svg
  String get dropBox => 'assets/icons/drop_box.svg';

  /// File path: assets/icons/excel_file.svg
  String get excelFile => 'assets/icons/excel_file.svg';

  /// File path: assets/icons/folder.svg
  String get folder => 'assets/icons/folder.svg';

  /// File path: assets/icons/google_drive.svg
  String get googleDrive => 'assets/icons/google_drive.svg';

  /// File path: assets/icons/group-svgrepo-com.svg
  String get groupSvgrepoCom => 'assets/icons/group-svgrepo-com.svg';

  /// File path: assets/icons/logo.svg
  String get logo => 'assets/icons/logo.svg';

  /// File path: assets/icons/media.svg
  String get media => 'assets/icons/media.svg';

  /// File path: assets/icons/media_file.svg
  String get mediaFile => 'assets/icons/media_file.svg';

  /// File path: assets/icons/menu_dashboard.svg
  String get menuDashboard => 'assets/icons/menu_dashboard.svg';

  /// File path: assets/icons/menu_doc.svg
  String get menuDoc => 'assets/icons/menu_doc.svg';

  /// File path: assets/icons/menu_notification.svg
  String get menuNotification => 'assets/icons/menu_notification.svg';

  /// File path: assets/icons/menu_profile.svg
  String get menuProfile => 'assets/icons/menu_profile.svg';

  /// File path: assets/icons/menu_setting.svg
  String get menuSetting => 'assets/icons/menu_setting.svg';

  /// File path: assets/icons/menu_store.svg
  String get menuStore => 'assets/icons/menu_store.svg';

  /// File path: assets/icons/menu_task.svg
  String get menuTask => 'assets/icons/menu_task.svg';

  /// File path: assets/icons/menu_tran.svg
  String get menuTran => 'assets/icons/menu_tran.svg';

  /// File path: assets/icons/one_drive.svg
  String get oneDrive => 'assets/icons/one_drive.svg';

  /// File path: assets/icons/pdf_file.svg
  String get pdfFile => 'assets/icons/pdf_file.svg';

  /// File path: assets/icons/sound_file.svg
  String get soundFile => 'assets/icons/sound_file.svg';

  /// File path: assets/icons/unknown.svg
  String get unknown => 'assets/icons/unknown.svg';

  /// File path: assets/icons/xd_file.svg
  String get xdFile => 'assets/icons/xd_file.svg';

  /// List of all assets
  List<String> get values => [
        documents,
        figmaFile,
        search,
        docFile,
        dropBox,
        excelFile,
        folder,
        googleDrive,
        groupSvgrepoCom,
        logo,
        media,
        mediaFile,
        menuDashboard,
        menuDoc,
        menuNotification,
        menuProfile,
        menuSetting,
        menuStore,
        menuTask,
        menuTran,
        oneDrive,
        pdfFile,
        soundFile,
        unknown,
        xdFile
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// File path: assets/images/profile_pic.png
  AssetGenImage get profilePic =>
      const AssetGenImage('assets/images/profile_pic.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo, profilePic];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
