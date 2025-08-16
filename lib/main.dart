import 'package:book_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/Features/home/presentation/manager/newest_books_cubit/newset_books_cubit.dart';
import 'package:book_app/constants.dart';
import 'package:book_app/core/Utils/app_router.dart';
import 'package:book_app/core/Utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewSetBooksCubit(
            getIt.get<HomeRepoImpl>()
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
              getIt.get<HomeRepoImpl>()
          )..fetchFeaturedBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
