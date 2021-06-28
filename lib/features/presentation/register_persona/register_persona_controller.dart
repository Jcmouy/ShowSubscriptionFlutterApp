import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/business/create_persona_service.dart';
import 'package:plataforma_app/features/domain/business/get_paises_service.dart';
import 'package:plataforma_app/features/domain/entities/pais.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/presentation/register_persona/register_persona_states.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/injection.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:plataforma_app/shared/constants.dart' as constants;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerPersonaControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => RegisterPersonaController(getIt<GetPaisesService>(), getIt<CreatePersonaService>()),
);

class RegisterPersonaController extends StateNotifier<RegisterPersonaState> {
  final GetPaisesService _paisService;
  final CreatePersonaService _createPersonaService;

  RegisterPersonaController(this._paisService, this._createPersonaService) : super(const RegisterPersonaInitial());

  Future<void> registerPersona(Usuario currentUser, String fechaNacimiento, String codigoTelefonicoPais, String telefono) async {
    state = const RegisterPersonaLoading();
    try {
      final String validateError = _validarCamposFormulario(fechaNacimiento);
      if (validateError != null && validateError.isNotEmpty) {
        state = RegisterPersonaError(validateError);
      } else {
        _ejecutarRegistroPersona(currentUser, fechaNacimiento, codigoTelefonicoPais, telefono);
      }
    } catch (e) {
      state = RegisterPersonaError(ErrorHandler.errorMessage(e));
    }
    return;
  }

  String _validarCamposFormulario(String fechaNacimiento) {
    if (fechaNacimiento.isEmpty) {
      return S.current.form_validation_birthday_required;
    }
    return '';
  }

  Future<void> _ejecutarRegistroPersona(Usuario currentUser, String fechaNacimiento, String codigoTelefonicoPais, String telefono) async {
    // TODO: cambiar el password, y guardar el token
    final int paisId = await _getPaisId(codigoTelefonicoPais);
    if (paisId == null) {
      //TODO internacionalizar
      state = const RegisterPersonaError('País no habilitado.');
      return;
    }
    final Persona persona = Persona(
        codigo: currentUser.login.toLowerCase(),
        usuarioId: currentUser.id,
        nombres: currentUser.firstName,
        apellidos: currentUser.lastName,
        correoElectronico: currentUser.email,
        fechaNacimiento: _getDateTimeFromString(fechaNacimiento),
        telefono: codigoTelefonicoPais + telefono,
        paisId: paisId,
        cuentaId: constants.ApiConstants.cuentaUsuarioDefecto);

    final Persona insertedPersona = await _createPersonaService.call(persona);

    if (insertedPersona != null) {
      state = const RegisterPersonaSucess();
    } else {
      //TODO internacionalizar
      state = const RegisterPersonaError('No fue posible crear la persona');
    }

    return;
  }

  DateTime _getDateTimeFromString(String fecha) {
    return DateTime.now();
  }

  Future<int> _getPaisId(String codigoTelefonicoPais) async {
    final String phoneCode = codigoTelefonicoPais;
    final List<Pais> paises = await _paisService.call(NoParams());
    for (var i = 0; i < paises.length; i++) {
      if (paises[i].codigo == phoneCode) {
        return paises[i].id;
      }
    }
    return null;
  }
}
