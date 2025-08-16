import 'package:book_app/Features/home/presentation/widgtes/App_bar.dart';
import 'package:book_app/Features/home/presentation/widgtes/Best_Seller_ListView.dart';
import 'package:book_app/Features/home/presentation/widgtes/Featured_listview.dart';
import 'package:book_app/core/Utils/Styles.dart';
import 'package:flutter/material.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build (BuildContext context) {
   return const CustomScrollView(
     physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: CustomeAppBar(),
              ),
              FeaturedBooksListView(),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'NewSet Books',
                  style: styles.textStyle18,
                ),
              ),
              SizedBox(
                height: 20,
              ),

            ],
          ) ,
        ),
        SliverFillRemaining(
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ) ,
        ),
      ],
    );

  }
}
