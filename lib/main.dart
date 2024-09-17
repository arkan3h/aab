import 'package:aab/config/theme/app_themes.dart';
import 'package:aab/features/news/presentation/bloc/article/network/article_bloc.dart';
import 'package:aab/features/news/presentation/bloc/article/network/article_event.dart';
import 'package:aab/features/news/presentation/pages/home/daily_news.dart';
import 'package:aab/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NetworkArticleBloc>( 
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appTheme(),
        home: const DailyNews()
      ),
    );
  }
}
