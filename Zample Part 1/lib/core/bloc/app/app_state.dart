import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  const AppState({
    this.loading = true,
    this.errorMsg = '',
  });

  AppState copyWith({bool? loading, String? errorMsg}) => AppState(
        loading: loading ?? this.loading,
        errorMsg: errorMsg ?? this.errorMsg,
      );

  @override
  List<Object> get props => [loading, errorMsg];

  final bool loading;
  final String errorMsg;
}
