import 'package:plataforma_app/features/domain/entities/social_usuario.dart';
import 'package:plataforma_app/features/presentation/confirm_user/confirm_user_states.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/features/domain/business/create_usuario_service.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';

final confirmUserControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => ConfirmUserController(getIt<CreateUsuarioService>()),
);

class ConfirmUserController extends StateNotifier<ConfirmUserState> {
  final CreateUsuarioService _createUsuarioService;
  Usuario insertedUsuario;

  ConfirmUserController(this._createUsuarioService) : super(const ConfirmUserInitial());

  Future<void> registerUser(SocialUsuario newSocialUsuario) async {
    state = const ConfirmUserLoading();
    final String validateError = _validarCamposFormulario(newSocialUsuario);
    if (validateError != null && validateError.isNotEmpty) {
      state = ConfirmUserError(validateError);
    } else {
      return _ejecutarRegistroUsuario(newSocialUsuario);
    }
  }

  Future<void> _ejecutarRegistroUsuario(SocialUsuario newSocialUsuario) async {
    try {
      insertedUsuario = await _createUsuarioService.call(newSocialUsuario);

      if (insertedUsuario != null) {
        state = const ConfirmUserSucess();
      } else {
        //TODO internacionalizar
        state = const ConfirmUserError('No fue posible crear el usuario');
      }
    } catch (e) {
      state = ConfirmUserError(ErrorHandler.errorMessage(e));
    }
  }

  String _validarCamposFormulario(SocialUsuario newSocialUsuario) {
    if (newSocialUsuario.firstName.isEmpty || newSocialUsuario.lastName.isEmpty || newSocialUsuario.email.isEmpty) {
      return S.current.form_validation_fields;
    }
    return '';
  }
}
