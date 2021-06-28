import 'dart:collection';

import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/features/domain/business/get_funciones_service.dart';
import 'package:plataforma_app/features/domain/business/get_obras_service.dart';
import 'package:plataforma_app/features/domain/business/get_subscripciones_service.dart';
import 'package:plataforma_app/features/domain/entities/funcion.dart';
import 'package:plataforma_app/features/domain/entities/subscripcion.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';
import 'package:plataforma_app/features/presentation/mensajes/mensajes_states.dart';
import 'package:plataforma_app/injection.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mensajesControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => MensajesController(getIt<GetSubscripcionesService>(), getIt<GetFuncionesService>(), getIt<GetObraByIdService>()),
);

class MensajesController extends StateNotifier<MensajesState> {
  final GetSubscripcionesService _subscripcionesService;
  final GetFuncionesService _funcionesService;
  final GetObraByIdService _getObraByIdService;
  Map<int, Obra> obras = HashMap();
  Map<int, Obra> obrasInitial = HashMap();
  List<Subscripcion> subscripciones;
  List<Funcion> _funciones;
  int countCurrentLoadedItems = 0;
  int _itemsPerPage = 10;

  MensajesController(this._subscripcionesService, this._funcionesService, this._getObraByIdService) : super(const MensajesInitial()) {
    _getSubscripciones();
  }

  Future<void> _getSubscripciones() async {
    try {
      state = const MensajesLoading();
      subscripciones = await _subscripcionesService.call(NoParams());
      _funciones = await _funcionesService.call(NoParams());
      if (subscripciones.isNotEmpty && _funciones.isNotEmpty) {
        loadNextObrasPage();
      } else {
        state = const MensajesLoaded();
      }
    } catch (error) {
      state = MensajesError(ErrorHandler.errorMessage(error));
    }
    return;
  }

  Future<void> loadNextObrasPage() async {
    if (countCurrentLoadedItems < subscripciones.length) {
      for (var i = 0; i < subscripciones.length; i++) {
        if (countCurrentLoadedItems + i < subscripciones.length) {
          final int indiceACargar = countCurrentLoadedItems + i;
          await _getObraFromSubscripcion(indiceACargar);
        }
      }
      getOrderListByDate(obrasInitial.values.toList());
    }
    state = const MensajesLoaded();
  }

  void loadNext({int nextObras}) {
    if (nextObras != null){
      _itemsPerPage += nextObras;
      getOrderListByDate(obrasInitial.values.toList());
    }
    state = const MensajesLoaded();
  }

  void getOrderListByDate(List<Obra> obrasList){
    obrasList.sort((item2, item1) => item1.fecha.compareTo(item2.fecha));
    countCurrentLoadedItems = obrasList.take(_itemsPerPage).toList().length;
    obras = obrasList.take(_itemsPerPage).toList().asMap();
  }



  Future<void> _getObraFromSubscripcion(int index) async {
    final int obraId = _getObraIdOfSubscripcion(index);
    if (!obrasInitial.containsKey(obraId)) {
      final Obra obra = await _getObraByIdService.call(obraId);
      obrasInitial.putIfAbsent(obraId, () => obra);
    }
  }

  int _getObraIdOfSubscripcion(int index) {
    final Subscripcion subscripcion = subscripciones[index];
    final Funcion funcion = _funciones.firstWhere((f) => f.id == subscripcion.funcionId);
    return funcion.obraId;
  }
}
