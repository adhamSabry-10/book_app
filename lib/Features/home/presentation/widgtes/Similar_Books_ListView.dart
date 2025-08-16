import 'package:book_app/Features/home/presentation/manager/smila_books_cubit/similar_books_cubit.dart';
import 'package:book_app/Features/home/presentation/widgtes/custome_Book_Item.dart';
import 'package:book_app/core/Utils/widgets/custom_loading_indicator.dart';
import 'package:book_app/core/Utils/widgets/custome_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
      if (state is SimilarBooksSuccess) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomeBookImage(
                    imageUrl:
                    state.books[index].volumeInfo.imageLinks
                        ?.thumbnail ??
                        '',
                  ),
                );
              }),
        );
      }else if (state is SimilarBooksFailure) {
        return CustomeErrorWidget(
          errorMessage: state.errMessage,
        );
      } else {
        return const CustomLoadingIndicator();
      }
    });
  }
}
