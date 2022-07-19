import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          height: size.height,
          width: size.width,
          color: Colors.orange,
        ),
        Transform.scale(
          scale: 0.8,
          child: Scaffold(
            appBar: CustomAppBar(),
          ),
        ),
      ],
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Material(
      color: Colors.green,
      child: Container(
        height: kToolbarHeight,
        width: size.width,
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
