import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zample/components/profile/firebase_profile_repository.dart';

import '../../../components/profile/profile.dart';
import '../../services/service_locator.dart';

class AuthCubit extends Cubit<dynamic> {
  /// link to a specific default image for the [avatarUrl]
  static const lightBulbImageUrl =
      'https://firebasestorage.googleapis.com/v0/b/zample-95803.appspot.com/o/ressources%2Fexternal-content.duckduckgo.com.png?alt=media&token=c4048d1a-4d3a-471f-96eb-03b9d3c1a6a1';

  AuthCubit() : super("");

  /// initializes the authentication process by checking whether a [FirebaseUser] exists
  /// If the [FirebaseUser] is null, a new [FirebaseUser] with [UserCredential] is created
  Future<void> initialize() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;

    final FirebaseProfileRepository profileRepository =
        app.get<FirebaseProfileRepository>();

    if (firebaseUser != null) {
      final bool exists = await profileRepository.exists();
      if (!exists) {
        final Profile profile = await createDefaultProfile(firebaseUser);
        await profileRepository.create(profile: profile);
      }
    }
  }

  /// creates the Default Profile with the unique [FirebaseUser]-id
  Future<Profile> createDefaultProfile(User user) async {
    return Profile(
      uid: user.uid,
      avatarUrl: lightBulbImageUrl,
      username: user.displayName ??
          user.email!.substring(
            0,
            user.email!.indexOf("@"),
          ),
    );
  }
}
