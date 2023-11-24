
part of 'ErrorBloc.dart';

@immutable
abstract class ErrorBlocState{}

class Init extends ErrorBlocState{}
class CreateEmailError extends ErrorBlocState{}
class CreateRePassError extends ErrorBlocState{}
class ClearRepassError extends ErrorBlocState{}
class ClearEmailError extends ErrorBlocState{}
class ToggleVisibilityPass extends ErrorBlocState{}
class ToggleVisibilityRepass extends ErrorBlocState{}