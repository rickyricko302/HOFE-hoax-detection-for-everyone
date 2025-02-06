import 'package:get_it/get_it.dart';
import 'package:hofe/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:hofe/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:hofe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:hofe/features/auth/domain/repositories/auth_repository.dart';
import 'package:hofe/features/auth/domain/usecase/user_register_usecase.dart';
import 'package:hofe/features/auth/presentation/bloc/login/bloc/login_bloc.dart';
import 'package:hofe/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hofe/features/detect_hoax/domain/usecase/get_detect_hoax_usecase.dart';
import 'package:hofe/features/detect_hoax/presentations/cubit/detect_hoax_cubit.dart';
import 'package:hofe/features/hoax_news/data/datasource/hoax_news_remote_datasource.dart';
import 'package:hofe/features/hoax_news/domain/repositories/hoax_news_repository.dart';
import 'package:hofe/features/hoax_news/domain/usecase/get_hoax_news_usecase.dart';
import 'package:hofe/features/hoax_news/presentation/bloc/hoax_news_bloc.dart';
import 'package:hofe/features/hoax_news/presentation/cubit/home_navigation_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/auth/domain/usecase/user_login_usecase.dart';
import 'features/hoax_news/data/repositories/hoax_news_repository.dart';

GetIt locator = GetIt.instance;
Future<void> initGetIt() async {
  // sharedpreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  //bloc
  locator.registerLazySingleton(
      () => RegisterBloc(userRegisterUsecase: locator()));
  locator.registerLazySingleton(() => LoginBloc(userLoginUsecase: locator()));
  locator.registerLazySingleton(() => HomeNavigationCubit());
  locator
      .registerLazySingleton(() => HoaxNewsBloc(getHoaxNewsUsecase: locator()));
  locator.registerLazySingleton(
      () => DetectHoaxCubit(getDetectHoaxUsecase: locator()));

  // usecase
  locator.registerLazySingleton(
      () => UserRegisterUsecase(authRepository: locator()));
  locator
      .registerLazySingleton(() => UserLoginUsecase(authRepository: locator()));
  locator.registerLazySingleton(
      () => GetHoaxNewsUsecase(hoaxNewsRepository: locator()));
  locator.registerLazySingleton(
      () => GetDetectHoaxUsecase(hoaxNewsRepository: locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      authRemoteDatasource: locator(), authLocalDatasource: locator()));
  locator.registerLazySingleton<HoaxNewsRepository>(
      () => HoaxNewsRepositoryImpl(hoaxNewsRemoteDatasource: locator()));

  // datasource
  locator.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl());
  locator.registerLazySingleton<AuthLocalDatasource>(
      () => AuthLocalDatasourceImpl(prefs: prefs));
  locator.registerLazySingleton<HoaxNewsRemoteDatasource>(
      () => HoaxNewsRemoteDatasourceImpl());
}
