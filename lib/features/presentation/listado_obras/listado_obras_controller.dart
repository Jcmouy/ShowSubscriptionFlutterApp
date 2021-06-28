import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/business/get_obras_service.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/features/presentation/listado_obras/listado_obras_states.dart';
import 'package:plataforma_app/injection.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';

final listadoObrasControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => ListadoObrasController(getIt<GetObrasService>()),
);

class ListadoObrasController extends StateNotifier<ListadoObrasState> {
  List<Obra> _obras = [];

  List<Obra> get obras => _obras;

  final GetObrasService _obrasService;

  ListadoObrasController(this._obrasService) : super(const ListadoObrasInitial()) {
    getObras();
  }

  Future<void> getObras() async {
    state = const ListadoObrasLoading();
    try {
      _obras = await _obrasService(NoParams());
      _obras ??= [];
      state = const ListadoObrasLoaded();
    } catch (error) {
      state = ListadoObrasError(ErrorHandler.errorMessage(error));
    }
  }
}
