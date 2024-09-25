import 'package:chat_bot/data/remote_data/remote_data_source.dart';
import 'package:chat_bot/data/repositor_impl/chat_repository_impl.dart';
import 'package:chat_bot/domain/repository/chat_repository.dart';
import 'package:chat_bot/domain/usecases/generate_chat_usecase.dart';
import 'package:chat_bot/presentation/bloc/chat_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void init() {
  // Bloc DI
  sl.registerFactory<ChatBloc>(
    () => ChatBloc(sl()),
  );

  // UseCase DI
  sl.registerLazySingleton(
    () => GenerateChatUsecase(sl()),
  );

  sl.registerLazySingleton<Dio>(() => Dio());

  // Repo DI
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(sl()),
  );

  // Data Source DI
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(sl()),
  );
}
