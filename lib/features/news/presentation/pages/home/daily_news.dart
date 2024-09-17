import 'package:aab/features/news/presentation/bloc/article/network/article_bloc.dart';
import 'package:aab/features/news/presentation/bloc/article/network/article_state.dart';
import 'package:aab/features/news/presentation/widget/article_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      title: const Text(
        'Berita',
        style: TextStyle(
          color: Colors.black
        ),
      ),
    );
  }

  _body() {
    return BlocBuilder<NetworkArticleBloc, NetworkArticleState> (
      builder: (_,state) {
        if (state is NetworkArticleLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state is NetworkArticleError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is NetworkArticleSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return ArticleWidget(
                article: state.articles![index],
              );
            },
            itemCount: state.articles!.length,
          );
        }
        return const SizedBox();
      }
    );
  }
}