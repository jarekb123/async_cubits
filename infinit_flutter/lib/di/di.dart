import 'package:get_it/get_it.dart';
import 'package:infinit_flutter/di/di.config.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@injectableInit
void setupDI() => getIt.init();

T inject<T extends Object>() => getIt<T>();
