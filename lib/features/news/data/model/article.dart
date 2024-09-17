import 'package:aab/core/constant/constant.dart';
import 'package:aab/features/news/domain/entity/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    super.id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      author: map['author'] ?? "1",
      title: map['title'] ?? "1",
      description: map['description'] ?? "1",
      url: map['url'] ?? "1",
      urlToImage: map['urlToImage'] ?? kDefaultImage,
      publishedAt: map['publishedAt'] ?? "1",
      content: map['content'] ?? "1",
    );
  }
}