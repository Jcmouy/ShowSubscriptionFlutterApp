import 'dart:collection';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:plataforma_app/core/usecases/usecase.dart';
import 'package:plataforma_app/core/util/image_utils.dart';
import 'package:plataforma_app/features/domain/business/create_pago_service.dart';
import 'package:plataforma_app/features/domain/business/create_subscripcion_service.dart';
import 'package:plataforma_app/features/domain/business/get_current_persona_service.dart';
import 'package:plataforma_app/features/domain/business/get_funciones_service.dart';
import 'package:plataforma_app/features/domain/business/get_obras_service.dart';
import 'package:plataforma_app/features/domain/entities/funcion.dart';
import 'package:plataforma_app/features/domain/entities/obra.dart';
import 'package:plataforma_app/features/domain/entities/etiqueta.dart';
import 'package:plataforma_app/features/domain/entities/pago.dart';
import 'package:plataforma_app/features/domain/entities/persona.dart';
import 'package:plataforma_app/features/domain/entities/subscripcion.dart';
import 'package:plataforma_app/features/domain/enums/enum_metodo_pago.dart';
import 'package:plataforma_app/features/presentation/cartelera/cartelera_states.dart';
import 'package:plataforma_app/generated/l10n.dart';
import 'package:plataforma_app/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';

final carteleraControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => CarteleraController(
      getIt<GetFuncionesService>(), getIt<GetObraByIdService>(), getIt<GetCurrentPersonaService>(), getIt<CreatePagoService>()),
);

class CarteleraController extends StateNotifier<CarteleraState> {
  final GetFuncionesService _funcionesService;
  final GetObraByIdService _getObraByIdService;
  final GetCurrentPersonaService _getCurrentPersonaService;
  final CreatePagoService _createPagoService;
  Map<int, Obra> obras = HashMap();
  List<Funcion> funciones;
  int countCurrentLoadedItems = 0;
  final int _itemsPerPage = 4;

  CarteleraController(this._funcionesService, this._getObraByIdService, this._getCurrentPersonaService, this._createPagoService)
      : super(const CarteleraInitial()) {
    _getFunciones();
  }

  Future<void> _getFunciones() async {
    state = const CarteleraLoading();
    try {
      funciones = await _funcionesService.call(NoParams());
      if (funciones.isNotEmpty) {
        loadNextObrasPage();
      } else {
        state = const CarteleraLoaded();
      }
    } catch (error) {
      state = CarteleraError(ErrorHandler.errorMessage(error));
    }
    return;
  }

  Future<bool> _getObraFromFuncion(int index) async {
    final int obraId = getObraIdOfFuncion(index);
    if (obras.containsKey(obraId)) {
      return true;
    } else {
      final Obra obra = await _getObraByIdService.call(obraId);
      obras.putIfAbsent(obraId, () => obra);
      return true;
    }
  }

  int getObraIdOfFuncion(int index) {
    final Funcion funcion = funciones[index];
    return funcion.obraId;
  }

  Image getObraImageById(int id) {
    final String base64image = obras[id].imagen;
    return ImageUtils.imageFromBase64String(base64image);
  }

  Future<void> loadNextObrasPage() async {
    if (countCurrentLoadedItems < funciones.length) {
      int cantidadCargada = 0;
      for (var i = 0; i < _itemsPerPage; i++) {
        if (countCurrentLoadedItems + i < funciones.length) {
          final int indiceACargar = countCurrentLoadedItems + i;
          await _getObraFromFuncion(indiceACargar);
          cantidadCargada += 1;
        }
      }
      countCurrentLoadedItems += cantidadCargada;
    }
    state = const CarteleraLoaded();
  }

  String getEtiquetasAsString(int obraId) {
    final List<Etiqueta> etiquetas = obras[obraId].etiquetas;
    final String textoEtiquetasAMostrar = etiquetas.map((e) => e.nombre).toList().join(', ');
    return textoEtiquetasAMostrar;
  }

  List<String> getListEtiquetas(int obraId) {
    try {
      final List<Etiqueta> etiquetas = obras[obraId].etiquetas;
      final List<String> textoEtiquetas = etiquetas.map((e) => e.nombre).toList();
      return textoEtiquetas;
    } catch (error) {
      state = CarteleraError(ErrorHandler.errorMessage(error));
    }
    return [];
  }

  Future<void> subscribe(int index, int obraId) async {
    try {
      state = const CarteleraLoading();

      final CreateSubscripcionService createSubscripcionService = getIt<CreateSubscripcionService>();
      final Persona persona = await _getCurrentPersonaService.call(NoParams());
      Pago pago = _mockPago();
      pago = await _createPagoService.call(pago);
      final Subscripcion subscripcion =
          Subscripcion(funcionId: funciones[index].id, metodoPago: EnumMetodoPago.GOOGLEPAY, pagoId: pago.id, personaId: persona.id);
      //TODO controlar si ya esta creada la subscripcion, mostrar mensajes, etc.
      await createSubscripcionService.call(subscripcion);

      state = CarteleraSuccess(S.current.subscripcion_operation, S.current.subscripcion_successful_operation);
    } catch (error) {
      state = CarteleraError(ErrorHandler.errorMessage(error));
    }
    return;
  }

  Pago _mockPago() {
    return Pago(idExterno: '${Random().nextInt(8999) + 1000}');
  }
}
