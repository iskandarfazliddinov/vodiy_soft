import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodiy_soft/core/di/locator.dart';
import 'package:vodiy_soft/features/login/data/repositories/impl_login_repo.dart';
import 'package:vodiy_soft/features/login/data/services/login_services.dart';
import 'package:vodiy_soft/features/login/domain/repositories/login_repo.dart';
import 'package:vodiy_soft/features/main/data/repositories/impl_main_repo.dart';
import 'package:vodiy_soft/features/main/data/services/main_services.dart';
import 'package:vodiy_soft/features/main/domain/repositories/main_repo.dart';
import 'package:vodiy_soft/features/main/domain/use_case/main_use_case.dart';
import 'package:vodiy_soft/features/main/presatation/state/main_bloc.dart';

class Injector extends StatelessWidget {
  final Widget child;

  const Injector({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        ..._getAuthRepo(),
        ..._getMainRepo(),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(
            create: (context) => MainBloc(mainUseCase: MainUseCase(mainRepo: context.read())),
          ),
        ],
        child: child,
      ),
    );
  }

  _getAuthRepo() => [
        RepositoryProvider<LoginService>(
          create: (context) => LoginService(locator<Dio>()),
        ),
        RepositoryProvider<LoginRepo>(
          create: (context) => ImplLoginRepo(
            authService: context.read(),
          ),
        ),
      ];

  _getMainRepo() => [
    RepositoryProvider<MainService>(
      create: (context) => MainService(locator<Dio>()),
    ),
    RepositoryProvider<MainRepo>(
      create: (context) => ImplMainRepo(
        mainService: context.read(),
      ),
    ),
  ];
}
