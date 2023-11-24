part of 'ErrorBloc.dart';

@immutable
abstract class ErrorBlocEvent{}
class MakeEmailError extends ErrorBlocEvent{}
class RemoveEmailError extends ErrorBlocEvent{}
class MakeRepassError extends ErrorBlocEvent{}
class RemoveRepassError extends ErrorBlocEvent{}
class ChangeVisibilityPass extends ErrorBlocEvent{}
class ChangeVisibilityRepass extends ErrorBlocEvent{}

