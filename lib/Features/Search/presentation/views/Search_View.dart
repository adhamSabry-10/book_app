import 'package:book_app/Features/Search/presentation/views/widgets/Search_View_body.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  SafeArea(child: SearchViewBody()),
    );

  }
}
