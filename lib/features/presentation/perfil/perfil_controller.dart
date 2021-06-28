import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/business/get_current_persona_service.dart';
import 'package:plataforma_app/features/domain/business/get_current_usuario_service.dart';
import 'package:plataforma_app/features/domain/entities/pais.dart';
import 'package:plataforma_app/features/domain/entities/usuario.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/business/get_pais_service.dart';
import 'package:plataforma_app/features/presentation/perfil/perfil_states.dart';
import 'package:plataforma_app/injection.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final perfilControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => PerfilController(getIt<GetCurrentUsuarioService>(), getIt<GetCurrentPersonaService>(), getIt<GetPaisService>()),
);

class PerfilController extends StateNotifier<PerfilState> {
  final GetCurrentUsuarioService _getCurrentUsuarioService;
  final GetCurrentPersonaService _getCurrentPersonaService;
  final GetPaisService _paisService;
  Usuario usuario;
  Persona persona;
  Pais pais;

  PerfilController(this._getCurrentUsuarioService, this._getCurrentPersonaService, this._paisService) : super(const PerfilInitial()) {
    _getCurrentUserData();
  }

  Future<void> _getCurrentUserData() async {
    state = const PerfilLoading();
    try {
      usuario = await _getCurrentUsuarioService.call(NoParams());
      persona = await _getCurrentPersonaService.call(NoParams());
      pais = await _paisService.call(persona.paisId);
      state = const PerfilLoaded();
    } catch (error) {
      state = PerfilError(ErrorHandler.errorMessage(error));
    }
  }
}
