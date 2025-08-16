import 'package:flutter/material.dart';

class SearchSellerListView extends StatelessWidget {
  const SearchSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            // 
            child: Text('data'),
          );
        });
  }
}
