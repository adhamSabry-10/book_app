import 'package:flutter/material.dart';

class CustomeSearchTextField extends StatelessWidget {
  const CustomeSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration:InputDecoration(
        label: const Text('Search'),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:const BorderSide(color: Colors.white,
            )
        ),
        focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:const BorderSide(color: Colors.white,
            )
        ),
        hintText: 'Search',
        suffixIcon:IconButton(onPressed: (){}, icon: const Opacity(
            opacity: .8,
            child: Icon( Icons.search,size: 30,))),
      ) ,

    );
  }
}