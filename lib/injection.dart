import 'package:get_it/get_it.dart';
import 'package:hofe/features/auth/data/datasource/auth_remote_datasource.dart';
import 'package:hofe/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:hofe/features/auth/domain/usecase/repositories/auth_repository.dart';
import 'package:hofe/features/auth/domain/usecase/user_register_usecase.dart';
import 'package:hofe/features/auth/presentation/bloc/register/register_bloc.dart';

GetIt locator = GetIt.instance;
Future<void> initGetIt() async {
  //bloc
  locator.registerLazySingleton(
      () => RegisterBloc(userRegisterUsecase: locator()));

  // usecase
  locator.registerLazySingleton(
      () => UserRegisterUsecase(authRepository: locator()));

  // repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDatasource: locator()));

  // datasource
  locator.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasourceImpl());
}
