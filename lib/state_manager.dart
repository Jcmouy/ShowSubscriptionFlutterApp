// import 'package:flutter_riverpod/all.dart';
// import 'package:plataforma_app/features/presentation/login/login_controller.dart';
// import 'package:plataforma_app/features/domain/business/login_manual_service.dart';
// import 'package:plataforma_app/features/domain/entities/login_dto.dart';
// import 'package:plataforma_app/injection.dart';

// final signInWithGoogleProvider = FutureProvider.autoDispose<void>((ref) async {
//   return LoginController(getIt<LoginManualService>()).signInWithGoogle();
// });

// final signInWithFacebookProvider = FutureProvider.autoDispose<void>((ref) async {
//   return LoginController(getIt<LoginManualService>()).signInWithFacebook();
// });

// final loginManualProvider = FutureProvider.autoDispose.family<void, LoginDto>((ref, loginDto) async {
//   return LoginController(getIt<LoginManualService>()).loginManual(loginDto);
// });
