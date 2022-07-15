import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:girafa/app.dart';
import 'package:girafa/app_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(App()),
    blocObserver: AppBlocObserver(),
  );
}
