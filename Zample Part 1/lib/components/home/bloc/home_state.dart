import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int index;

  const HomeState({this.index = 2});

  @override
  List<Object?> get props => [index];
}
