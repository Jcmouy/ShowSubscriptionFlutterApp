import 'dart:collection';

import 'package:plataforma_app/features/domain/business/create_usuario_service.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/entities/social_usuario.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/presentation/register_usuario/register_usuario_states.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/injection.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerUsuarioControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => RegisterUsuarioController(getIt<CreateUsuarioService>()),
);

class RegisterUsuarioController extends StateNotifier<RegisterUsuarioState> {
  final CreateUsuarioService _createUsuarioService;
  LinkedHashMap hashMapPersona;
  Usuario insertedUsuario;

  RegisterUsuarioController(this._createUsuarioService) : super(const RegisterUsuarioInitial());

  Future<void> registerUser(SocialUsuario newUsuario, String password2) async {
    state = const RegisterUsuarioLoading();
    try {
      final String validateError = _validarCamposFormulario(newUsuario, password2);
      if (validateError != null && validateError.isNotEmpty) {
        state = RegisterUsuarioError(validateError);
      } else {
        _ejecutarRegistroUsuario(newUsuario);
      }
    } catch (e) {
      state = RegisterUsuarioError(ErrorHandler.errorMessage(e));
    }
    return;
  }

  Future<void> _ejecutarRegistroUsuario(SocialUsuario newUsuario) async {
    insertedUsuario = await _createUsuarioService.call(newUsuario);

    if (insertedUsuario != null) {
      _initHashMapPersona(insertedUsuario);
      state = const RegisterUsuarioSucess();
    } else {
      state = const RegisterUsuarioError('No fue posible crear el usuario');
    }
    return;
  }

  String _validarCamposFormulario(SocialUsuario newUsuario, String password2) {
    if (newUsuario.password.isEmpty ||
        password2.isEmpty ||
        newUsuario.login.isEmpty ||
        newUsuario.firstName.isEmpty ||
        newUsuario.lastName.isEmpty ||
        newUsuario.email.isEmpty) {
      return S.current.form_validation_fields;
    }
    if (newUsuario.password != password2) {
      return S.current.form_validation_password_not_equal;
    }
    return '';
  }

  void _initHashMapPersona(Usuario usuario) {
    final Persona newPersona = Persona(
        codigo: "", nombres: usuario.firstName, apellidos: usuario.lastName, correoElectronico: usuario.email, telefono: "", paisId: 0);
    hashMapPersona = {'Persona': newPersona} as LinkedHashMap;
  }
}
