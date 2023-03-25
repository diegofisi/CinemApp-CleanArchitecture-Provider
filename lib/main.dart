import 'package:clean_cinema/app/data/repository_implementation/authtentication_repository_impl.dart';
import 'package:clean_cinema/app/data/repository_implementation/connectivity_repository_impl.dart';
import 'package:clean_cinema/app/domain/repositories/connectivity_repository.dart';
import 'package:clean_cinema/app/my_app.dart';
import 'package:flutter/material.dart';

import 'app/domain/repositories/authentication_repository.dart';

void main() {
  runApp(
    Injector(
      connectivityRepository: ConnectivityRepositoryImpl(),
      authenticationRepository: AuthenticationRepositoryImpl(),
      child: const MyApp(),
    ),
  );
}

class Injector extends InheritedWidget {
  const Injector({
    super.key,
    required super.child,
    required this.connectivityRepository,
    required this.authenticationRepository,
  });

  final ConnectivityRepository connectivityRepository;
  final AuthenticationRepository authenticationRepository;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw UnimplementedError();
  }

  static Injector of(BuildContext context) {
    final injector = context.dependOnInheritedWidgetOfExactType<Injector>();
    assert(injector != null, 'No Injector found in context');
    return injector!;
  }
}
