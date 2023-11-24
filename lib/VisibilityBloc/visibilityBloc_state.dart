
part of 'visibilityBloc.dart';

@immutable
abstract class VisibilityBlocState{}

class Init extends VisibilityBlocState{}
class ToggleVisibility extends VisibilityBlocState{}