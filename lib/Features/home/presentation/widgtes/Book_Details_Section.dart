import 'package:book_app/Features/home/data/Models/book_model.dart';
import 'package:book_app/Features/home/presentation/widgtes/Book_Rating.dart';
import 'package:book_app/Features/home/presentation/widgtes/Books_Action.dart';
import 'package:book_app/Features/home/presentation/widgtes/custome_Book_Item.dart';
import 'package:book_app/core/Utils/Styles.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .25),
          child: CustomeBookImage(imageUrl: bookModel.volumeInfo.imageLinks
              ?.thumbnail ??
              '',),
        ),
        const SizedBox(
          height: 45,
        ),
         Text(

          bookModel.volumeInfo.title!,
          style: styles.textStyle30,
           textAlign: TextAlign.center,
        ),

        const SizedBox(
          height: 5,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0]??'',
            style: styles.textStyle18.copyWith(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookRating(
              rating: bookModel.volumeInfo.averageRating??0,
              count: bookModel.volumeInfo.ratingsCount??0,
            ),
          ],
        ),
        const SizedBox(
          height: 37,
        ),
         BookAction(bookModel: bookModel,),
      ],
    );
  }
}