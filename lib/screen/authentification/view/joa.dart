/*
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freasy_room/global/common/constant.dart';
import 'package:freasy_room/global/common/toast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:local_auth/local_auth.dart';
import 'package:translator/translator.dart';

class UsualFunctions {
  static Future openDialog(
      BuildContext context, List<List> menuItemList, double appBarHeightSize) {
    return showMenu(
      context: context,
      position: RelativeRect.fromLTRB(1, appBarHeightSize, 0, 0),
      semanticLabel: 'Menu',
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      items: [
        for (final element in menuItemList) _buildPopMenuItem(context, element),
      ],
    );
  }

  static PopupMenuItem _buildPopMenuItem(BuildContext context, List item) {
    return PopupMenuItem(
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: ((context) => item[2]),
            ),
          );
        },
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              item[0],
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color!,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              item[1],
              style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.normal,
                fontFamily: 'Comfortaa_bold',
                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Get from Camera
  static Future getImageFromDevice({
    required bool multiImage,
  }) async {
    final ImagePicker picker = ImagePicker();
    try {
      if (multiImage) {
        final pickedFile = await picker.pickMultiImage();
        List<File?> imagesFiles = [];
        for (var pic in pickedFile) {
          imagesFiles.add(File(pic.path));
        }
        return imagesFiles;
      }
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );

      if (pickedFile == null) return;
      return File(pickedFile.path);
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  // Upload image to Firebase Storage
  static Future uploadFile({
    required File? fileToUpload,
    required String fileName,
    required int? number,
    required String uploadToPath,
  }) async {
    try {
      // Create an instance of Firebase Storage
      final firebaseStorage = FirebaseStorage.instance;

      final storageRef = firebaseStorage.ref().child(
          '$uploadToPath/${fileName}_$number.${fileToUpload!.path.split('.').last}');
      //
      final uploadTask = storageRef.putFile(fileToUpload);
      final snapshot = await uploadTask.whenComplete(() => null);

      // Get the download URL
      final imageUrl = await snapshot.ref.getDownloadURL();
      return imageUrl;
    } on FirebaseException catch (errno) {
      CommonToast.showFlashMessage(
        errno.message.toString(),
        Colors.red,
      );
    }
  }

  //
  static String formatLikeCount(int count) {
    if (count < 1000) {
      return count.toString(); // No abbreviation needed
    } else if (count < 1000000) {
      final kCount = (count / 1000).toStringAsFixed(1);
      return '${kCount}k'; // Abbreviate thousands
    } else {
      final mCount = (count / 1000000).toStringAsFixed(1);
      return '${mCount}M'; // Abbreviate millions
    }
  }
}

class FingerPrintScanner {
  static final _auth = LocalAuthentication();

  static Future<bool> hasBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<bool> isBiometricSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  static Future<List<BiometricType>> getBiometrics() async {
    try {
      return await _auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      return <BiometricType>[];
    }
  }

  static Future<bool> authentication() async {
    final isAvailable = await hasBiometrics();
    final isbBiometricSupported = await isBiometricSupported();
    if (!isAvailable && !isbBiometricSupported) return false;

    try {
      return await _auth.authenticate(
        localizedReason: 'Scan your fingerprint to authenticate',
        options: const AuthenticationOptions(
          stickyAuth: true,
        ),
      );
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}

class Config {
  static const String apiKey = "ega5cqgrdrth";

  static const String tokenH =
      "7wwhnccww44je594h9zvbwatv2xge49wuryhj63wyfnxc9ufkd2afqe44yt3zzub";
}

class Auth {
  static String verifyId = '';
  // Initialize an instance of firebase auth
  static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  //
  static User? get currentUser => _firebaseAuth.currentUser;
  static Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // Function for OTP (sms code sent) verification
  static Future verifyOtp({
    required String smsCode,
  }) async {
    try {
      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verifyId,
        smsCode: smsCode,
      );
      await currentUser!.updatePhoneNumber(credential);
      return currentUser;
    } on FirebaseAuthException catch (e) {
      CommonToast.showFlashMessage(
        e.message!,
        Colors.red,
      );
    } catch (errno) {
      CommonToast.showFlashMessage(
        errno.toString(),
        Colors.red,
      );
    }
  }

  // Function for phone authentication
  static Future phoneAuthentication({
    required String phone,
    // required Function next,
  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) async {
        await currentUser!.updatePhoneNumber(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        CommonToast.showFlashMessage(
          e.message!,
          Colors.red,
        );
      },
      codeSent: (String verificationId, int? resendToken) async {
        verifyId = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) async {
        // Handle auto-retrieval timeout
        verificationId = verificationId;
      },
    );
  }

  // Function to sign in user with email & password
  static Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'user-not-found' || e.code == 'wrong-password') {
      CommonToast.showFlashMessage(
        e.message!,
        Colors.red,
      );
      // } else {
      //   CommonToast.showFlashMessage(
      //     'An error occured\nPlease Make sure you are connected to internet',
      //     Colors.red,
      //   );
      // }
    }
  }

  // Function to sign up user with email & password
  static Future createUserWithEmailAndPassword({
    required String userName,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        await currentUser!.updateDisplayName(userName);
        return currentUser;
      }
    } on FirebaseAuthException catch (e) {
      CommonToast.showFlashMessage(
        e.message!,
        Colors.red,
      );
    }
  }

  // Function to sign out user with email & password
  static Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  // Function for password reset
  static Future resetPassword({
    required String resetEMail,
  }) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(
        email: resetEMail,
      );
    } on FirebaseAuthException catch (e) {
      CommonToast.showFlashMessage(
        e.message!,
        Colors.red,
      );
    }
  }

  // Function for password reset
  static Future changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: currentUser!.email!,
        password: currentPassword,
      );
      await currentUser!.reauthenticateWithCredential(credential);
      await currentUser!.updatePassword(
        newPassword,
      );
    } on FirebaseAuthException catch (e) {
      CommonToast.showFlashMessage(
        e.message!,
        Colors.red,
      );
    }
  }
}

class UserAccount {
  // Initialize an instance of firebase cloud firestore
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  // Cloud saving user's informations
  static Future cloudSaving({
    required Map<String, Object?> data,
  }) async {
    await _firebaseFirestore
        .collection('users')
        .doc(Auth.currentUser!.uid)
        .set(data);

    return localSaving();
  }

  // Local saving user's informations
  static Future<void> localSaving() async {
    final userData = await _firebaseFirestore
        .collection('users')
        .doc(Auth.currentUser!.uid)
        .get();
    await UserSimplePreferences.setUserInfo(
      {
        'userType': userData['userType'],
        'username': userData['username'],
        'age': userData['age'],
        'town': userData['town'],
        'phone': userData['phone'],
        'email': userData['email'],
        'photoURL': userData['photoURL'],
      },
    );
    await UserSimplePreferences.setFirstTime(true);
    return;
  }
}

class HomeFinder {
  // Global variable to store houses
  static List<DocumentSnapshot> housesSnapshot = <DocumentSnapshot>[];

  // Global variable to store houses
  static List<DocumentSnapshot> housesOwnerSnapshot = <DocumentSnapshot>[];

  // Global variable to store house visit statistics
  static List<Map<String, dynamic>> housesVisitStats = <Map<String, dynamic>>[];

  // Global variable to store user chats
  static List<DocumentSnapshot> userChats = <DocumentSnapshot>[];

  // Initialize an instance of firebase cloud firestore
  static final FirebaseFirestore _firebaseFirestore =
      FirebaseFirestore.instance;

  // Retreives all houses stored in the database
  static Future<void> getHomes(
    int limit, {
    DocumentSnapshot? startAfter,
    Object? ownerRef,
  }) async {
    Query<Map<String, dynamic>>? refHomes;
    QuerySnapshot? snapHouses;

    if (ownerRef != null) {
      print(ownerRef);
      refHomes = _firebaseFirestore
          .collection('Home')
          .where(
            'ownerReference',
            isEqualTo: ownerRef,
          )
          .orderBy('surfaceHome')
          .limit(limit);
      if (startAfter == null) {
        snapHouses = await refHomes.get();
      } else {
        snapHouses = await refHomes.startAfterDocument(startAfter).get();
      }

      // Adding houses to global instances
      housesOwnerSnapshot.addAll(snapHouses.docs);
    }
    if (ownerRef == null) {
      refHomes = _firebaseFirestore
          .collection('Home')
          .orderBy('surfaceHome')
          .limit(limit);
      if (startAfter == null) {
        snapHouses = await refHomes.get();
      } else {
        snapHouses = await refHomes.startAfterDocument(startAfter).get();
      }
      // Adding houses to global instances
      housesSnapshot.addAll(snapHouses.docs);

      housesVisitStats.clear();
      // Retreiving house visit statistics
      for (dynamic item
          in housesSnapshot.isNotEmpty ? housesSnapshot : snapHouses.docs) {
        final visitStat = await homeVisitsStatistics(
          houseRef: item.id,
        );
        housesVisitStats.add({
          item.id: visitStat.data()?['visits'],
        });
      }
    }
  }

  // Retreive house owner informations
  static Future<DocumentSnapshot> getHouseOwnerInformations({
    required DocumentReference ownerRef,
  }) async {
    return await ownerRef.get();
  }

  // Update house informations
  static Future createNewHome({
    required Map<String, dynamic> data,
  }) async {
    return await _firebaseFirestore.collection('Home').doc().set(data);
  }

  // Update house informations
  static Future updateHome({
    required String idHome,
    required Map<Object, Object?> data,
  }) async {
    return await _firebaseFirestore.collection('Home').doc(idHome).update(data);
  }

  // Delete house from database
  static Future deleteHome({
    required String houseRef,
  }) async {
    return await _firebaseFirestore.collection('Home').doc(houseRef).delete();
  }

  // Get house visit statistics
  static Future homeVisitsStatistics({
    required String houseRef,
  }) async {
    return await _firebaseFirestore.collection('Visit').doc(houseRef).get();
  }

  // Get user chats
  static Future getChats(
    DocumentReference userRef,
    String userType,
    int limit, {
    DocumentSnapshot? startAfter,
  }) async {
    final QuerySnapshot chatSnapShot;
    final chatRef = _firebaseFirestore
        .collection('Chat')
        .where(
          userType == 'Owner' ? 'ownerReference' : 'customerReference',
          isEqualTo: userRef,
        )
        .limit(limit);
    if (startAfter == null) {
      chatSnapShot = await chatRef.get();
    } else {
      chatSnapShot = await chatRef.startAfterDocument(startAfter).get();
    }

    userChats.addAll(chatSnapShot.docs);
  }
}

class Internet {
  static Future<bool> checkInternetAccess() async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    }
    final isInternetPresent = await InternetConnectionChecker().hasConnection;
    if (!isInternetPresent) {
      return false;
    }

    return true;
  }
}

class Translate {
  static String? appLanguage;

  static Future init() async {
    appLanguage = UserSimplePreferences.getAppLanguage();
  }

  static final GoogleTranslator translator = GoogleTranslator();

  // App translate system
  static Future appTranslate(textToTranslate) async {
    try {
      final appLanguage = UserSimplePreferences.getAppLanguage();
      return await translator.translate(
        "I would buy a car, if I had money.",
        to: appLanguage,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
*/
