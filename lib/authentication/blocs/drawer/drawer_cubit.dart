import 'package:bloc/bloc.dart';

enum DrawerState { open, closed }

extension DrawerStateX on DrawerState {
  get isOpen => this == DrawerState.open;

  DrawerState getOppositeValue() {
    if (isOpen) {
      return DrawerState.closed;
    } else {
      return DrawerState.open;
    }
  }
}

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerState.closed);

  drawerTapped() {
    return state.getOppositeValue();
  }
}
