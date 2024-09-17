import 'package:aab/features/news/data/datasource/network/news_api_service.dart';
import 'package:aab/features/news/data/repository/article_repository_impl.dart';
import 'package:aab/features/news/domain/repository/article_repository.dart';
import 'package:aab/features/news/domain/usecases/get_article.dart';
import 'package:aab/features/news/presentation/bloc/article/network/article_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());

  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  sl.registerFactory<NetworkArticleBloc>(
    () => NetworkArticleBloc(sl())
  );
}