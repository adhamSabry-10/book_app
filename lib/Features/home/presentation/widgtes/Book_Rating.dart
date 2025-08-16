import 'package:book_app/core/Utils/Styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key, required this.rating, required this.count});
final num rating;
final int count;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const Icon(
          Icons.star,
          size: 14,
          color: Color(0xffFFDD4F),
        ),const SizedBox(
          width: 6.3,
        ),
         Text(
          rating.toString(),
          style: styles.textStyle16,
        ),const SizedBox(
          width: 5,
        ),
         Text(
          '($count)',
          style: styles.textStyle14.copyWith(color:const Color(0xff707070),
          fontWeight: FontWeight.w600),

        )
      ],
    );
  }
}