import 'package:plataforma_app/features/domain/business/change_user_account_password_service.dart';
import 'package:plataforma_app/features/presentation/change_password/change_password_states.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/features/domain/entities/password_usuario.dart';
import 'package:plataforma_app/injection.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final changePasswordControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => ChangePasswordController(getIt<ChangeUserAccountPasswordService>()),
);

class ChangePasswordController extends StateNotifier<ChangePasswordState> {
  final ChangeUserAccountPasswordService _changeUserAccountPasswordService;

  ChangePasswordController(this._changeUserAccountPasswordService) : super(const ChangePasswordInitial());

  Future<void> changeUserPassword(String oldPassword, String newPassword, String newPasswordConfirmation) async {
    state = const ChangePasswordLoading();
    try {
      final String validateError = _validarPassword(oldPassword, newPassword, newPasswordConfirmation);
      if (validateError != null && validateError.isNotEmpty) {
        state = ChangePasswordError(validateError);
      } else {
        _ejecutarCambioPassword(oldPassword, newPassword);
      }
    } catch (e) {
      state = ChangePasswordError(ErrorHandler.errorMessage(e));
    }
  }

  Future<void> _ejecutarCambioPassword(String oldPassword, String newPassword) async {
    try {
      final PasswordUsuario newPassUsuario = PasswordUsuario(currentPassword: oldPassword, newPassword: newPassword);
      final bool changePass = await _changeUserAccountPasswordService.call(newPassUsuario);
      if (changePass) {
        state = ChangePasswordSuccess(S.current.profile_title_change_pass, S.current.profile_successful_operation_change_pass);
      } else {
        //TODO internacionalizar
        state = const ChangePasswordError('Ocurrió un error al cambiar la contraseña');
      }
    } catch (error) {
      state = ChangePasswordError(ErrorHandler.errorMessage(error));
    }
  }

  String _validarPassword(String oldPassword, String newPassword, String newPasswordConfirmation) {
    if (oldPassword.isEmpty || newPassword.isEmpty || newPasswordConfirmation.isEmpty) {
      return S.current.form_validation_fields;
    } else if (oldPassword == newPassword || oldPassword == newPasswordConfirmation) {
      return S.current.form_validation_password_old_equal;
    } else if (newPassword != newPasswordConfirmation) {
      return S.current.form_validation_password_not_equal;
    }
    return '';
  }
}
