import 'package:book_app/Features/Search/presentation/views/widgets/Custome_Search_TextField.dart';
import 'package:book_app/Features/Search/presentation/views/widgets/Search_Seller_ListView.dart';
import 'package:book_app/core/Utils/Styles.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomeSearchTextField(),
           SizedBox(height:16 ,),
          Text(
            'Search Result',
            style: styles.textStyle18,
          ), SizedBox(height:16 ,),
          Expanded(child: SearchSellerListView())
        ],
      ),
    );
  }
}

