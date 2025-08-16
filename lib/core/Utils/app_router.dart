import 'package:book_app/Features/Search/presentation/views/Search_View.dart';
import 'package:book_app/Features/Splash/presentation/views/Splash_View.dart';
import 'package:book_app/Features/home/data/Models/book_model.dart';
import 'package:book_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:book_app/Features/home/presentation/manager/smila_books_cubit/similar_books_cubit.dart';
import 'package:book_app/Features/home/presentation/views/Book_view_details.dart';
import 'package:book_app/Features/home/presentation/views/home_view.dart';
import 'package:book_app/core/Utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/homeView',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/bookView',
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(
            getIt.get<HomeRepoImpl>(),
          ),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          ),
        ),
      ),
      GoRoute(
        path: '/SearchView',
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
