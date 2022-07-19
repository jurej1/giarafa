import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../authentication.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();

  static route(BuildContext context) {
    return BlocProvider(
      create: ((_) => DrawerCubit()),
      child: const LoginView(),
    );
  }
}

class _LoginViewState extends State<LoginView> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      value: 1.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        BlocConsumer<DrawerCubit, DrawerState>(
          listener: (context, state) {
            if (state.isOpen) {
              _controller.animateTo(0.8);
            } else {
              _controller.animateTo(1.0);
            }
          },
          builder: (context, state) {
            return Transform.scale(
              scale: _controller.value,
              child: const Scaffold(
                appBar: CustomAppBar(),
              ),
            );
          },
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
          icon: const Icon(Icons.menu),
          onPressed: BlocProvider.of<DrawerCubit>(context).drawerTapped,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
