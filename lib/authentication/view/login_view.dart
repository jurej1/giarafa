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
      duration: const Duration(milliseconds: 300),
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
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 10,
          ),
          height: size.height,
          width: size.width,
          color: Colors.orange,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              )
            ],
          ),
        ),
        _TopLayer(controller: _controller),
      ],
    );
  }
}

class _TopLayer extends StatelessWidget {
  const _TopLayer({
    Key? key,
    required AnimationController controller,
  })  : _controller = controller,
        super(key: key);

  final AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrawerCubit, DrawerState>(
      listener: (context, state) {
        if (state.isOpen) {
          _controller.animateTo(0);
        } else {
          _controller.animateBack(1);
        }
      },
      builder: (context, state) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset((_controller.value) * -170 + 170, 0),
              child: Transform.scale(
                scale: ((_controller.value / 1) * (1.0 - 0.8) + 0.8),
                child: const Scaffold(
                  appBar: CustomAppBar(),
                ),
              ),
            );
          },
        );
      },
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
