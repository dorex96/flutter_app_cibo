import 'package:flutter/material.dart';

/// A widget that displays different images based on the current theme mode
///
/// Parameters:
///   - [themeMode]: The current theme mode (light or dark)
///   - [imagePathLight]: The asset path for the light theme image
///   - [imagePathDark]: The asset path for the dark theme image
///   - [fit]: How the image should be inscribed into the space allocated during layout
class CustomImageWidget extends StatelessWidget {
  const CustomImageWidget({
    super.key,
    required this.themeMode,
    required this.imagePathLight,
    required this.imagePathDark,
    this.fit = BoxFit.contain,
  });

  final ThemeMode themeMode;
  final String imagePathLight;
  final String imagePathDark;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(
        themeMode == ThemeMode.dark ? imagePathDark : imagePathLight,
      ),
      fit: fit,
    );
  }
}
