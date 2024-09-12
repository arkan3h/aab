

import 'dart:io';

import 'package:aab/core/constant/constant.dart';
import 'package:aab/core/resources/data_state.dart';
import 'package:aab/features/news/data/datasource/network/news_api_service.dart';
import 'package:aab/features/news/data/model/article.dart';
import 'package:aab/features/news/domain/repository/article_repository.dart';
import 'package:dio/dio.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);
  
  @override
  Future<DataState<List<ArticleModel>>> getNewsArticle() async {
    try {
      final httpResponse = await _newsApiService.getNewsArticle(
        apiKey: newsApiKey,
        country: newsCountry,
        category: newsCategory,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataError(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            message: httpResponse.response.statusMessage,
            type: DioExceptionType.badResponse,
            response: httpResponse.response,
            stackTrace: StackTrace.current
          )
        );
      }
    } on DioException catch(e){
      return DataError(e);
    }
  }
}