import 'package:aab/features/news/domain/entity/article.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class NetworkArticleState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? error;

  const NetworkArticleState({this.articles, this.error});

  @override
  List<Object> get props => [articles!, error!];
}

class NetworkArticleLoading extends NetworkArticleState {
  const NetworkArticleLoading();
}

class NetworkArticleSuccess extends NetworkArticleState {
  const NetworkArticleSuccess(List<ArticleEntity> article): super(articles: article);
}

class NetworkArticleError extends NetworkArticleState {
  const NetworkArticleError(DioException error): super(error: error);
}