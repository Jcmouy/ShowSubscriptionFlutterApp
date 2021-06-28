import 'package:plataforma_app/features/domain/business/security_service.dart';
import 'package:plataforma_app/features/presentation/home/home_states.dart';
import 'package:plataforma_app/injection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:plataforma_app/shared/presentation/common/error_handler.dart';

final homeControllerProvider = StateNotifierProvider.autoDispose(
  (ref) => HomeController(getIt<SecurityService>()),
);

class HomeController extends StateNotifier<HomeState> {
  final SecurityService _securityService;

  HomeController(this._securityService) : super(const HomeInitial());

  Future<void> executeUserLogout() async {
    state = const HomeLoading();
    try {
      await _securityService.clearUserData();
      state = const HomeLogout();
    } catch (error) {
      state = HomeError(ErrorHandler.errorMessage(error));
    }
  }
}
