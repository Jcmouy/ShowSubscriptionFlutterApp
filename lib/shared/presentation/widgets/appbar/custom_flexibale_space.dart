import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plataforma_app/shared/presentation/common_app_styles.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;

class CustomFlexibaleSpace extends StatelessWidget {
  const CustomFlexibaleSpace({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        final settings = context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
        final deltaExtent = settings.maxExtent - settings.minExtent;
        final t = (1.0 - (settings.currentExtent - settings.minExtent) / deltaExtent).clamp(0.0, 1.0) as double;
        final fadeStart = math.max(0.0, 1.0 - kToolbarHeight / deltaExtent);
        const fadeEnd = 1.0;
        final opacity = 1.0 - Interval(fadeStart, fadeEnd).transform(t);

        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 40.0, left: 70.0),
              constraints: const BoxConstraints(maxWidth: 280.0),
              child: Opacity(opacity: 1 - opacity, child: getTitle(constants.GeneralConstants.appName, 20.0)),
            ),
            Opacity(
              opacity: opacity,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [getImage(), getTitle('Experience our stories', 26.0)],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget getImage() {
    const String assetName = constants.GeneralConstants.appSvgLogoWithBackground;
    final Widget svg = SvgPicture.asset(assetName, fit: BoxFit.cover);

    return SizedBox(
      width: double.infinity,
      child: svg,
    );
  }

  Widget getTitle(String text, double size) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Text(
        text,
        style: CommonAppStyles.getAppBarStyle(size),
      ),
    );
  }
}
