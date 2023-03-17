import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  /// Unique id for [Firebase] functionalities
  final String uid;

  /// Link to the profile picture in [Firebase]
  final String avatarUrl;

  /// Username (if not changed) composed of the email
  final String username;

  const Profile({
    required this.uid,
    required this.avatarUrl,
    required this.username,
  });

  factory Profile.fromJson(Map<String, dynamic> map) => Profile(
        uid: map["uid"] as String,
        avatarUrl: map["avatarUrl"] as String,
        username: map["username"] as String,
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "avatarUrl": avatarUrl,
        "username": username,
      };

  Profile copyWith({
    String? uid,
    String? avatarUrl,
    String? email,
    String? username,
  }) =>
      Profile(
        uid: uid ?? this.uid,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        username: username ?? this.username,
      );

  @override
  List<Object?> get props => [uid, avatarUrl, username];
}
