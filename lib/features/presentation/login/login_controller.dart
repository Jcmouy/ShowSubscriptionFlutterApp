import 'dart:collection';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:plataforma_app/features/domain/business/login_manual_service.dart';
import 'package:plataforma_app/features/domain/entities/login_dto.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/entities/social_usuario.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/presentation/login/login_states.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/injection.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:flutter_riverpod/all.dart';

final loginControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => LoginController(getIt<LoginManualService>()),
);

class LoginController extends StateNotifier<LoginState> {
  final LoginManualService _loginManualService;
  final GoogleSignIn _googleSignInAccount = GoogleSignIn(clientId: constants.ApiConstants.googleClientId);
  final FacebookLogin _facebookSignIn = FacebookLogin();
  LinkedHashMap loginUser;

  LoginController(this._loginManualService) : super(const LoginInitial());

  Future<void> loginManual(LoginDto loginDto) async {
    state = const LoginLoading();
    final String validateError = _validarCamposFormulario(loginDto.login, loginDto.password);
    if (validateError != null && validateError.isNotEmpty) {
      state = LoginError(validateError);
    } else {
      _ejecutarLoginManual(loginDto);
    }
  }

  Future<void> _ejecutarLoginManual(LoginDto loginDto) async {
    try {
      final String token = await _loginManualService.call(loginDto);
      if (token == null || token.isEmpty) {
        throw Exception(S.current.error_manual_login);
      }
      state = const LoginSucess();
    } catch (e) {
      state = LoginError(ErrorHandler.errorMessage(e));
    }
  }

  Future<void> _probarLoginManualSocial(LoginDto loginDto, LinkedHashMap loginUser) async {
    final String token = await _loginManualService.call(loginDto);
    if (token != null && token.isNotEmpty) {
      state = const LoginSucess();
    } else {
      state = const LoginConfirmRegistration();
    }
  }

  String _validarCamposFormulario(String login, String password) {
    if (login.isEmpty || password.isEmpty) {
      return S.current.form_validation_fields;
    }
    return '';
  }

  Future<void> signInWithGoogle() async {
    try {
      state = const LoginLoading();
      final GoogleSignInAccount googleSigniIn = await _googleSignInAccount.signIn();
      await googleSigniIn.authentication.then((googleKey) async {
        loginUser = _mapUsuarioGoogleLogin(googleSigniIn, googleKey.idToken);
        try {
          final LoginDto loginDto =
              LoginDto(login: constants.GeneralConstants.googleUserPrefix + googleSigniIn.id, password: googleKey.idToken);
          await _probarLoginManualSocial(loginDto, loginUser);
        } catch (e) {
          state = LoginError(ErrorHandler.errorMessage(e));
        }
      });
      return;
    } catch (error) {
      state = LoginError(ErrorHandler.errorMessage(error));
      debugPrint('Error login Google: $error');
    }
  }

  Future<void> signInWithFacebook() async {
    try {
      state = const LoginLoading();
      final FacebookLoginResult result = await _facebookSignIn.logIn(['email']);
      final String token = result.accessToken.token;

      if (result.status == FacebookLoginStatus.loggedIn) {
        final Dio dio = getIt<Dio>();
        final response = await dio.get('${constants.ApiConstants.facebookApiBaseUrl}$token');
        final profile = jsonDecode(response.data as String);
        loginUser = await _mapUsuarioFacebookLogin(profile, token);

        //TODO implementar cuando pasa derecho a la HomePage
        state = const LoginConfirmRegistration();
      } else if (result.status == FacebookLoginStatus.cancelledByUser) {
        state = const LoginError("Login facebook: cancelado");
      } else {
        state = LoginError("Login facebook ERRO: ${result.errorMessage}");
      }
    } on DioError catch (e) {
      state = LoginError(ErrorHandler.errorMessage(e));
    } catch (error) {
      state = LoginError(ErrorHandler.errorMessage(error));
    }
  }

  LinkedHashMap _mapUsuarioGoogleLogin(GoogleSignInAccount googleSigniIn, String idToken) {
    final Usuario newUser = SocialUsuario(
        login: constants.GeneralConstants.googleUserPrefix + googleSigniIn.id,
        email: googleSigniIn.email,
        imagenPath: googleSigniIn.photoUrl,
        firstName: googleSigniIn.displayName,
        password: "placeholderParaLaContraseniaGeneradaConGoogle1234",
        socialToken: idToken);
    if (newUser != null) {
      final Persona newPersona = Persona(
          codigo: "", nombres: googleSigniIn.displayName, apellidos: "", correoElectronico: googleSigniIn.email, telefono: "", paisId: 0);
      return {'Persona': newPersona, 'Usuario': newUser} as LinkedHashMap;
    }
    return null;
  }

  Future<LinkedHashMap> _mapUsuarioFacebookLogin(dynamic profile, String token) async {
    final Usuario newUser = SocialUsuario(
        login: "${constants.GeneralConstants.facebookUserPrefix}${profile['first_name']}${profile['last_name']}",
        email: "${profile['email']}",
        imagenPath: profile['picture'] != null ? "${profile['picture']['data']['url']}" : null,
        firstName: "${profile['first_name']}",
        lastName: "${profile['last_name']}",
        password: "placeholderParaLaContraseniaGeneradaConFacebook1234");
    if (newUser != null) {
      final Persona newPersona = Persona(
          codigo: "",
          nombres: "${profile['first_name']}",
          apellidos: "${profile['last_name']}",
          correoElectronico: "${profile['email']}",
          telefono: "",
          paisId: 0);
      return {'Persona': newPersona, 'Usuario': newUser} as LinkedHashMap;
    }
    return null;
  }
}
