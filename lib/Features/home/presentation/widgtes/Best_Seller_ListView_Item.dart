import 'package:book_app/Features/home/data/Models/book_model.dart';
import 'package:book_app/Features/home/presentation/widgtes/Book_Rating.dart';
import 'package:book_app/Features/home/presentation/widgtes/custome_Book_Item.dart';
import 'package:book_app/constants.dart';
import 'package:book_app/core/Utils/Styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookSellerListViewItem extends StatelessWidget {
  const BookSellerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/bookView', extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Container(
          child: Row(
            children: [
              CustomeBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          bookModel.volumeInfo.title!,
                          style: styles.textStyle20
                              .copyWith(fontFamily: kGTSectraFineRegular),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                    const SizedBox(height: 3),
                    Text(
                      bookModel.volumeInfo.authors?.first ?? 'Unknown Author',
                      style: styles.textStyle14,
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          'Free',
                          style: styles.textStyle20
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        BookRating(
                          rating:
                              bookModel.volumeInfo.averageRating?.round() ?? 0,
                          count: bookModel.volumeInfo.ratingsCount ?? 0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
