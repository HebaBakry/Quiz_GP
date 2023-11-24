import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'errorBloc_event.dart';
part 'errorBloc_state.dart';


class ErrorBloc extends Bloc<ErrorBlocEvent,ErrorBlocState>{

  ErrorBloc() : super(Init()){
    on<ErrorBlocEvent>((event, emit){
       if(event is MakeEmailError){
        emit(CreateEmailError());
      }
      else if(event is RemoveEmailError){
        emit(ClearEmailError());
      }
      else if(event is ChangeVisibilityPass){
         emit(ToggleVisibilityPass());
       }
       else if(event is ChangeVisibilityRepass){
         emit(ToggleVisibilityRepass());
       }
       else if(event is MakeRepassError){
         emit(CreateRePassError());
       }
       else if(event is RemoveRepassError){
         emit(ClearRepassError());
       }

    });
  }

}

