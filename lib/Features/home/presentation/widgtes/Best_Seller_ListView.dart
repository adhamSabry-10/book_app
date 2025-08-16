import 'package:book_app/Features/home/presentation/manager/newest_books_cubit/newset_books_cubit.dart';
import 'package:book_app/Features/home/presentation/widgtes/Best_Seller_ListView_Item.dart';
import 'package:book_app/core/Utils/widgets/custom_loading_indicator.dart';
import 'package:book_app/core/Utils/widgets/custome_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewSetBooksCubit, NewSetBooksState>(
      builder: (context, state) {
        if (state is NewSetBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookSellerListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewSetBooksFailure) {
          return CustomeErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
