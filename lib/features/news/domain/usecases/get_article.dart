import 'package:aab/core/resources/data_state.dart';
import 'package:aab/core/usecase/usecase.dart';
import 'package:aab/features/news/domain/entity/article.dart';
import 'package:aab/features/news/domain/repository/article_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticle();
  }  
}