import 'package:get_it/get_it.dart';
import 'package:hofe/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:hofe/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:hofe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:hofe/features/auth/domain/repositories/auth_repository.dart';
import 'package:hofe/features/auth/domain/usecase/user_register_usecase.dart';
import 'package:hofe/features/auth/presentation/bloc/login/bloc/login_bloc.dart';
import 'package:hofe/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/domain/usecase/user_login_usecase.dart';

GetIt locator = GetIt.instance;
Future<void> initGetIt() async {
  // sharedpreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  //bloc
  locator.registerLazySingleton(
      () => RegisterBloc(userRegisterUsecase: locator()));
  locator.registerLazySingleton(() => LoginBloc(userLoginUsecase: locator()));

  // usecase
  locator.registerLazySingleton(
      () => UserRegisterUsecase(authRepository: locator()));
  locator
      .registerLazySingleton(() => UserLoginUsecase(authRepository: locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDatasource: locator(), authLocalDatasource: locator()));

  // datasource
  locator.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl());
  locator.registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(prefs: prefs));
}
