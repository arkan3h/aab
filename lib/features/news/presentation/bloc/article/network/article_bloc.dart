import 'package:aab/core/resources/data_state.dart';
import 'package:aab/features/news/domain/usecases/get_article.dart';
import 'package:aab/features/news/presentation/bloc/article/network/article_event.dart';
import 'package:aab/features/news/presentation/bloc/article/network/article_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkArticleBloc extends Bloc<NetworkArticleEvent, NetworkArticleState> {
 final GetArticleUseCase _getArticleUseCase;

  NetworkArticleBloc(this._getArticleUseCase): super(const NetworkArticleLoading()) {
    on <GetArticles> (onGetArticles);
  }
  
  void onGetArticles(GetArticles event, Emitter<NetworkArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        NetworkArticleSuccess(dataState.data!)
      );
    }

    if (dataState is DataError) {
      emit(
        NetworkArticleError(dataState.error!)
      );
    }
  }
}