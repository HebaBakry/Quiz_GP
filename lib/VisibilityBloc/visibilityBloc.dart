import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'visibilityBloc_event.dart';
part 'visibilityBloc_state.dart';


class VisibilityBloc extends Bloc<VisibilityBlocEvent,VisibilityBlocState>{
  bool isVisible = false;
  VisibilityBloc() : super(Init()){
    on<VisibilityBlocEvent>((event, emit){
      if(event is ChangeVisibility){
        isVisible = !isVisible;
        emit(ToggleVisibility());
      }
    });
  }

}

