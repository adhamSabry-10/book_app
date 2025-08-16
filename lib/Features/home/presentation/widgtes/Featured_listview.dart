import 'package:book_app/Features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:book_app/Features/home/presentation/widgtes/custome_Book_Item.dart';
import 'package:book_app/core/Utils/widgets/custom_loading_indicator.dart';
import 'package:book_app/core/Utils/widgets/custome_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
        builder: (context, state) {
      if (state is FeaturedBooksSuccess) {
        return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              itemCount: state.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(onTap: ()
                    {
                      GoRouter.of(context).push('/bookView', extra:state.books[index]);
                    },
                      child: CustomeBookImage(
                          imageUrl: state.books[index].volumeInfo.imageLinks
                              ?.thumbnail ??
                              ''
                      ),
                    ),
                  );
                }));
      } else if (state is FeaturedBooksFailure) {
        return CustomeErrorWidget(
          errorMessage: state.errorMessage,
        );
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
