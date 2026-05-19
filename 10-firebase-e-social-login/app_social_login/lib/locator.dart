import 'package:app_social_login/pages/login/store/login.store.dart';
import 'package:app_social_login/services/firebase_notification.service.dart';
import 'package:app_social_login/services/local_notification.service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  // Registrando Stores
  getIt.registerLazySingleton<LoginStore>(() => LoginStore());

  // Registrando Services
  getIt.registerLazySingleton<LocalNotificationService>(
    () => LocalNotificationService(),
  );
  getIt.registerLazySingleton<FirebaseNotificationService>(
    () => FirebaseNotificationService(),
  );
}
