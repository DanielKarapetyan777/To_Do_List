/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ColorEvent { event_white, event_green }

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.green;
  final Color colores;

  ColorBloc({this.colores = Colors.white}) : super(colores);

  @override
  Color get initialState => Colors.green;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.event_white) ? Colors.white : Colors.green;
    yield _color;
  }
}
*/