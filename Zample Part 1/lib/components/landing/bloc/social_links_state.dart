import 'package:equatable/equatable.dart';

class SocialLinksState extends Equatable {
  /// content of the error message given by [Firebase]
  final String error;

  /// bool for managing the time between authentication and its success
  /// the state can be used for a [LoadingScreen]
  final bool loading;

  /// defines whether the current session is authenticated or not
  final bool authenticated;

  const SocialLinksState({
    this.error = "",
    this.loading = false,
    this.authenticated = false,
  });

  SocialLinksState copyWith(
          {String? error, bool? loading, bool? authenticated}) =>
      SocialLinksState(
        error: error ?? this.error,
        loading: loading ?? this.loading,
        authenticated: authenticated ?? this.authenticated,
      );

  @override
  List<Object> get props => [error, loading, authenticated];
}
