import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:40 ,bottom:20  ),
      child: Row(
        children: [
          Image.asset('Assets/images/logo.png',height:20),
         const Spacer(),
          IconButton(onPressed:(){
            GoRouter.of(context).push('/SearchView');
          }, icon:const Icon( Icons.search,size: 30,))
        ],
      ),
    );
  }
}
