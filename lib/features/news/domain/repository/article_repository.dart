import 'package:aab/core/resources/data_state.dart';
import 'package:aab/features/news/domain/entity/article.dart';

abstract class ArticleRepository {
  Future<DataState<List<ArticleEntity>>> getNewsArticle();
}