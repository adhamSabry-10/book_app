import 'package:book_app/core/Utils/Styles.dart';
import 'package:flutter/material.dart';

class CustomeErrorWidget extends StatelessWidget {
 const CustomeErrorWidget({super.key, required this.errorMessage});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: styles.textStyle18,
        textAlign:TextAlign.center,
      ),
    );
  }
}
