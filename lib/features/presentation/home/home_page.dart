import 'package:flutter/material.dart';
import 'package:plataforma_app/features/presentation/home/home_controller.dart';
import 'package:plataforma_app/features/presentation/home/app_bottom_navigation_bar.dart';
import 'package:plataforma_app/features/presentation/home/home_states.dart';
import 'package:plataforma_app/features/presentation/login/login_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/presentation/widgets/fading_animation/fading_animation.dart';

class HomePage extends StatelessWidget {
  static const defaultIndexBottomBar = 1;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: ProviderListener(
        provider: homeControllerProvider.state,
        onChange: (context, state) {
          if (state is HomeError) {
            ErrorHandler.showErrorSnackBar(context, state.message);
          }
        },
        child: Consumer(
          builder: (context, watch, child) {
            final state = watch(homeControllerProvider.state);
            if (state is HomeLoading) {
              return FadingAnimation();
            } else {
              return AppBottomNavigationBar(
                defaultIndexBottomBar: defaultIndexBottomBar,
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> _onBackPressed(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (BuildContext context) {
            return const ExitApplicationAlertDialog();
          },
        )) ??
        false;
  }
}

class ExitApplicationAlertDialog extends StatelessWidget {
  const ExitApplicationAlertDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Confirm to exit the App'),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        FlatButton(
          onPressed: () {
            handleUserExit(context).then((_) => cleanNavigationStack(context));
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }

  Future<void> handleUserExit(BuildContext context) async {
    return context.read(homeControllerProvider).executeUserLogout();
  }

  void cleanNavigationStack(BuildContext context) {
    Navigator.of(context).popUntil(ModalRoute.withName('/'));
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
