import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Stream<FirebaseUser> user;
  Stream<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();

  AuthService() {
    user = _auth.onAuthStateChanged;
    profile = user.switchMap((FirebaseUser u) {
      if(u != null) {
        return _db.collection('users').document(u.uid).snapshots().map((snap) => snap.data);
      } else {
        return Stream.empty();
      }
    });
  }

  Future<String> googleSignIn() async {
    //loading.add(true);
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.accessToken
    , accessToken: googleAuth.idToken,);
    final AuthResult authResult = await _auth.signInWithCredential(
      credential
    );
    FirebaseUser user = authResult.user;

    assert(user.email != null);
    assert(user.displayName != null);
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    return 'signInWithGoogle succeeded: $user';
    // updateUserData(user);
    // print("signed in " + user.displayName);

    // loading.add(false);
    // return user;

  }

  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'lastSeen': DateTime.now()
    }, merge: true
    );
  }

  void signOut() {
    _auth.signOut();
  }

}

final AuthService authService = AuthService();