import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:plataforma_app/core/util/device_size.dart';
import 'package:plataforma_app/shared/presentation/widgets/clipper/wave_clipper_1.dart';
import 'package:plataforma_app/shared/presentation/widgets/clipper/wave_clipper_2.dart';
import 'package:plataforma_app/shared/presentation/widgets/clipper/wave_clipper_3.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;
import 'package:plataforma_app/shared/presentation/app_palette.dart' as palette;

class CommonPlataformaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonPlataformaAppBar({
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        constants.GeneralConstants.appName,
        style: TextStyle(
            fontSize: 20.0, fontFamily: "San Francisco", color: palette.Text.textoBarras, letterSpacing: 1.0, fontWeight: FontWeight.w600),
      ),
      backgroundColor: palette.BackGround.fondoBarras,
    );
  }
}

class ApplicationTitleWidget extends StatelessWidget {
  const ApplicationTitleWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonTitleWidget(text: S.current.sp_screen_w);
  }
}

class CommonTitleWidget extends StatelessWidget {
  final String text;

  const CommonTitleWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: CommonAppStyles.getPageNameStyle(),
      ),
    );
  }
}

class CommonSubTitleWidget extends StatelessWidget {
  final String text;

  const CommonSubTitleWidget({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: CommonAppStyles.getSubTitleStyle(),
      ),
    );
  }
}

class ApplicationBackgroundContainer extends StatelessWidget {
  final DeviceSize deviceSize;
  const ApplicationBackgroundContainer({Key key, this.deviceSize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/fondo_teatro_logo2.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class ApplicationLogoBackgroundContainer extends StatelessWidget {
  const ApplicationLogoBackgroundContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size deviceSize = MediaQuery.of(context).size;

    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            width: double.infinity,
            height: deviceSize.height / 2.4,
            decoration: const BoxDecoration(
              color: palette.BackGround.secundario,
            ),
            child: Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            width: double.infinity,
            height: deviceSize.height / 2.4,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              palette.ThemeNegroAzul.waveClipperGradienteClaraInicial,
              palette.ThemeNegroAzul.waveClipperGradienteClaraFinal
            ])),
            child: Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: ApplicationLogoContainer(height: deviceSize.height / 2.4),
        ),
      ],
    );
  }
}

class ApplicationLogoContainer extends StatelessWidget {
  final double height;
  const ApplicationLogoContainer({Key key, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: const BoxDecoration(
          color: palette.BackGround.primario,
          image: DecorationImage(
            image: Svg(
              constants.GeneralConstants.appSvgLogoWithoutBackground,
            ),
            fit: BoxFit.cover,
          )),
    );
  }
}

class ApplicationPerfilBackgroundBuildContainer extends StatelessWidget {
  const ApplicationPerfilBackgroundBuildContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            height: 380,
            decoration: const BoxDecoration(
              color: palette.BackGround.terciario,
            ),
          ),
        ),
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: 380,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/stage_profileN.jpg'), fit: BoxFit.cover),
            ),
            foregroundDecoration: BoxDecoration(color: palette.BackGround.secundario.withOpacity(0.8)),
          ),
        ),
      ],
    );
  }
}

class PageComponentsSeparator extends StatelessWidget {
  const PageComponentsSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class PageTextSeparatorWidget extends StatelessWidget {
  const PageTextSeparatorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

class LineDivider extends StatelessWidget {
  const LineDivider({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}

class BigDataSeparatorWidget extends StatelessWidget {
  const BigDataSeparatorWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
    );
  }
}

class TopMarginWidget extends StatelessWidget {
  const TopMarginWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 10,
    );
  }
}

Text buildTitle(BuildContext buildContext, String text) {
  return Text(
    text,
    style: CommonAppStyles.getTitleStyle(),
  );
}

Text buildSubTitle(BuildContext buildContext, String text) {
  return Text(
    text,
    style: CommonAppStyles.getSubTitleStyle(),
  );
}

Text buildTitleProfile(BuildContext buildContext, String text) {
  return Text(
    text,
    style: CommonAppStyles.getTitleProfileStyle(buildContext),
    textAlign: TextAlign.center,
  );
}

Text buildSubTitleProfile(BuildContext buildContext, String text) {
  return Text(
    text,
    style: CommonAppStyles.getSubTitleProfileStyle(buildContext),
    textAlign: TextAlign.center,
  );
}

class CommonAppStyles {
  static TextStyle getSubTitleStyle() {
    return const TextStyle(
        fontSize: 18.0, fontFamily: "San Francisco", color: palette.Text.titleColor, letterSpacing: 2.0, fontWeight: FontWeight.w600);
  }

  static TextStyle getTitleStyle() {
    return const TextStyle(
        fontSize: 25.0, fontFamily: "San Francisco", color: palette.Text.titleColor, letterSpacing: 2.0, fontWeight: FontWeight.w600);
  }

  static TextStyle getTitleProfileStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline6.copyWith(color: Colors.white);
  }

  static TextStyle getSubTitleProfileStyle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1.copyWith(color: Colors.white);
  }

  static TextStyle getAppBarStyle(double size) {
    return TextStyle(
        fontSize: size, fontFamily: "San Francisco", color: palette.Text.textoBarras, letterSpacing: 1.0, fontWeight: FontWeight.w600);
  }

  static TextStyle getCardFuncionStyle() {
    return const TextStyle(
      fontSize: 13,
      fontFamily: "San Francisco",
      fontWeight: FontWeight.w600,
      color: palette.Text.primaryColor,
    );
  }

  static TextStyle getPageNameStyle() {
    return const TextStyle(
      fontSize: 40,
      fontFamily: "San Francisco",
      fontWeight: FontWeight.w600,
      color: palette.Text.secondaryColor,
    );
  }
}
