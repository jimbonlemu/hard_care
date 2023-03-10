import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../data/models/users_model.dart';
import '../routes/app_pages.dart';

class AuthController extends GetxController {
  var isSkipIntro = false.obs;
  var isAuth = false.obs;

  GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _currentUser;
  UserCredential? userCredential;
  var user = UsersModel().obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Future<void> register(
  //   String nama,
  //   String email,
  //   String jk,
  //   String alamat,
  //   String? foto,
  //   String password,
  //   String confirmPassword,
  // ) async {
  //   try {
  //     if (password != confirmPassword) {
  //       return Get.defaultDialog(
  //           title: 'Peringatan',
  //           middleText: 'Password tidak sama pada dengan Konfirmasi Password');
  //     } else {
  //       await _auth
  //           .createUserWithEmailAndPassword(
  //         email: email,
  //         password: password,
  //       )
  //           .then((value) {
  //         CollectionReference brewColi = firestore.collection('paisen');
  //         brewColi.doc(email).set({
  //           'uid': _auth.currentUser!.uid,
  //           'nama': nama,
  //           'email': email,
  //           'jk': jk,
  //           'alamat': alamat,
  //           'foto': foto == null ? "noimage" : foto,
  //           'password': password,
  //         }).then((value) async {
  //           http.post(
  //               Uri.parse(
  //                   "https://edda-2404-8000-102e-46f5-b044-5942-6c34-94f0.ap.ngrok.io/hc/api/insertPasien.php"),
  //               body: {
  //                 'nama': nama,
  //                 'email': email,
  //                 'jk': jk,
  //                 'alamat': alamat,
  //                 'foto': foto,
  //                 'password': password,
  //               });
  //           CollectionReference users = firestore.collection('paisen');
  //           final currUser = await users.doc(email).get();
  //           final currUserData = currUser.data() as Map<String, dynamic>;
  //           print(currUserData);
  //           // currUserData.addAll({'chats': []});

  //           var data = pasienModel(PasienModel.fromJson(currUserData));

  //           pasienModel.refresh();

  //           pasienModel.refresh();

  //           Get.defaultDialog(
  //               title: 'Notification',
  //               middleText: 'selamat anda berhasil mendaftar');
  //           Timer(
  //             const Duration(seconds: 1),
  //             () {
  //               // Navigate to your favorite place
  //               Get.offAllNamed(Routes.DASHBOARD);
  //             },
  //           );
  //           // return Get.defaultDialog(
  //           //         title: 'Notification',
  //           //         middleText: 'selamat anda berhasil mendaftar')
  //           //     .then((value) =>
  //         });
  //       });
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     print('anda gagal daftar awoakwoakao');
  //     return Get.defaultDialog(
  //         title: 'Notification !', middleText: '${e.message}');
  //   }
  // }

  Future<void> firstInitialized() async {
    await autoLogin().then((value) {
      if (value) {
        // Get.offAndToNamed(Routes.DASHBOARD);
        isAuth.value = true;
      }
    });

    await skipIntro().then((value) {
      if (value) {
        isSkipIntro.value = true;
      }
    });
  }

  Future<bool> skipIntro() async {
    // kita akan mengubah isSkipIntro => true
    final box = GetStorage();
    if (box.read('skipIntro') != null || box.read('skipIntro') == true) {
      return true;
    }
    return false;
  }

  Future<bool> autoLogin() async {
    // kita akan mengubah isAuth => true => autoLogin
    try {
      final isSignIn = await _googleSignIn.isSignedIn();
      if (isSignIn) {
        await _googleSignIn
            .signInSilently()
            .then((value) => _currentUser = value);
        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        // masukan data ke firebase...
        CollectionReference users = firestore.collection('pasien');

        await users.doc(_currentUser!.email).update({
          "lastSignInTime":
              userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
        });

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));

        user.refresh();

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });

          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        user.refresh();

        return true;
      }
      return false;
    } catch (err) {
      return false;
    }
  }

  Future<void> login() async {
    try {
      // Ini untuk handle kebocoran data user sebelum login
      await _googleSignIn.signOut();

      // Ini digunakan untuk mendapatkan google account
      await _googleSignIn.signIn().then((value) => _currentUser = value);

      // ini untuk mengecek status login user
      final isSignIn = await _googleSignIn.isSignedIn();

      if (isSignIn) {
        // kondisi login berhasil
        print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
        print(_currentUser);

        final googleAuth = await _currentUser!.authentication;

        final credential = GoogleAuthProvider.credential(
          idToken: googleAuth.idToken,
          accessToken: googleAuth.accessToken,
        );

        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) => userCredential = value);

        print("USER CREDENTIAL");
        print(userCredential);

        // simpan status user bahwa sudah pernah login & tidak akan menampilkan introduction kembali
        final box = GetStorage();
        if (box.read('skipIntro') != null) {
          box.remove('skipIntro');
        }
        box.write('skipIntro', true);

        // masukan data ke firebase...
        CollectionReference users = firestore.collection('pasien');

        final checkuser = await users.doc(_currentUser!.email).get();

        if (checkuser.data() == null) {
          await users.doc(_currentUser!.email).set({
            "uid": userCredential!.user!.uid,
            "name": _currentUser!.displayName,
            "keyName": _currentUser!.displayName!.substring(0, 1).toUpperCase(),
            "email": _currentUser!.email,
            "photoUrl": _currentUser!.photoUrl ?? "noimage",
            "status": "",
            "creationTime":
                userCredential!.user!.metadata.creationTime!.toIso8601String(),
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
            "updatedTime": DateTime.now().toIso8601String(),
          });
          await users.doc(_currentUser!.email).collection("chats");
        } else {
          await users.doc(_currentUser!.email).update({
            "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
                .toIso8601String(),
          });
        }

        final currUser = await users.doc(_currentUser!.email).get();
        final currUserData = currUser.data() as Map<String, dynamic>;

        user(UsersModel.fromJson(currUserData));

        user.refresh();

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = [];
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });

          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        user.refresh();

        isAuth.value = true;
        Get.offAllNamed(Routes.DASHBOARD);
      } else {
        print("TIDAK BERHASIL LOGIN");
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> logout() async {
    await _googleSignIn.disconnect();
    await _googleSignIn.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  // void updateProfile(
  //   String nama,
  //   String alamat,
  //   String email,
  // ) async {
  //   CollectionReference users = firestore2.collection('paisen');
  //   await users.doc(email).update({
  //     'nama': nama,
  //     'alamat': alamat,
  //   }).then((value) {
  //     http.post(
  //         Uri.parse(
  //             "https://edda-2404-8000-102e-46f5-b044-5942-6c34-94f0.ap.ngrok.io/hc/api/updateProfil.php"),
  //         body: {
  //           'nama': nama,
  //           'alamat': alamat,
  //           'email': email,
  //         });
  //   });

  //   pasienModel.update((user) {
  //     user!.nama = nama;
  //     user.alamat = alamat;
  //   });

  //   pasienModel.refresh();
  //   Get.defaultDialog(title: 'Perhatian', middleText: 'Sukses Mengubah Profil');
  // }

  // PROFILE
  void changeProfile(String name, String status) {
    String date = DateTime.now().toIso8601String();

    // Update firebase
    CollectionReference users = firestore.collection('pasien');

    users.doc(_currentUser!.email).update({
      "name": name,
      "keyName": name.substring(0, 1).toUpperCase(),
      "status": status,
      "lastSignInTime":
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
      "updatedTime": date,
    });

    // Update model
    user.update((user) {
      user!.name = name;
      user.keyName = name.substring(0, 1).toUpperCase();
      user.status = status;
      user.lastSignInTime =
          userCredential!.user!.metadata.lastSignInTime!.toIso8601String();
      user.updatedTime = date;
    });

    user.refresh();
    Get.defaultDialog(title: "Success", middleText: "Change Profile success");
  }

  // void updateStatus(String status) {
  //   String date = DateTime.now().toIso8601String();
  //   // Update firebase
  //   CollectionReference users = firestore.collection('users');

  //   users.doc(_currentUser!.email).update({
  //     "status": status,
  //     "lastSignInTime":
  //         userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
  //     "updatedTime": date,
  //   });

  //   // Update model
  //   user.update((user) {
  //     user!.status = status;
  //     user.lastSignInTime =
  //         userCredential!.user!.metadata.lastSignInTime!.toIso8601String();
  //     user.updatedTime = date;
  //   });

  //   user.refresh();
  //   Get.defaultDialog(title: "Success", middleText: "Update status success");
  // }

  void updatePhotoUrl(String url) async {
    String date = DateTime.now().toIso8601String();
    // Update firebase
    CollectionReference users = firestore.collection('pasien');

    await users.doc(_currentUser!.email).update({
      "photoUrl": url,
      "updatedTime": date,
    });

    // Update model
    user.update((user) {
      user!.photoUrl = url;
      user.updatedTime = date;
    });

    user.refresh();
    Get.defaultDialog(
        title: "Success", middleText: "Change photo profile success");
  }
  // SEARCH

  void addNewConnection(String friendEmail) async {
    bool flagNewConnection = false;
    var chat_id;
    String date = DateTime.now().toIso8601String();
    CollectionReference chats = firestore.collection("chats");
    CollectionReference users = firestore.collection("pasien");

    final docChats =
        await users.doc(_currentUser!.email).collection("chats").get();

    if (docChats.docs.length != 0) {
      // user sudah pernah chat dengan siapapun
      final checkConnection = await users
          .doc(_currentUser!.email)
          .collection("chats")
          .where("connection", isEqualTo: friendEmail)
          .get();

      if (checkConnection.docs.length != 0) {
        // sudah pernah buat koneksi dengan => friendEmail
        flagNewConnection = false;

        //chat_id from chats collection
        chat_id = checkConnection.docs[0].id;
      } else {
        // blm pernah buat koneksi dengan => friendEmail
        // buat koneksi ....
        flagNewConnection = true;
      }
    } else {
      // blm pernah chat dengan siapapun
      // buat koneksi ....
      flagNewConnection = true;
    }

    if (flagNewConnection) {
      // cek dari chats collection => connections => mereka berdua...
      final chatsDocs = await chats.where(
        "connections",
        whereIn: [
          [
            _currentUser!.email,
            friendEmail,
          ],
          [
            friendEmail,
            _currentUser!.email,
          ],
        ],
      ).get();

      if (chatsDocs.docs.length != 0) {
        // terdapat data chats (sudah ada koneksi antara mereka berdua)
        final chatDataId = chatsDocs.docs[0].id;
        final chatsData = chatsDocs.docs[0].data() as Map<String, dynamic>;

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(chatDataId)
            .set({
          "connection": friendEmail,
          "lastTime": chatsData["lastTime"],
          "total_unread": 0,
        });

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = List<ChatUser>.empty();
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });
          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        chat_id = chatDataId;

        user.refresh();
      } else {
        // buat baru , mereka berdua benar2 belum ada koneksi
        final newChatDoc = await chats.add({
          "connections": [
            _currentUser!.email,
            friendEmail,
          ],
        });

        await chats.doc(newChatDoc.id).collection("chat");

        await users
            .doc(_currentUser!.email)
            .collection("chats")
            .doc(newChatDoc.id)
            .set({
          "connection": friendEmail,
          "lastTime": date,
          "msg": "",
          "total_unread": 0,
        });

        final listChats =
            await users.doc(_currentUser!.email).collection("chats").get();

        if (listChats.docs.length != 0) {
          List<ChatUser> dataListChats = List<ChatUser>.empty();
          listChats.docs.forEach((element) {
            var dataDocChat = element.data();
            var dataDocChatId = element.id;
            dataListChats.add(ChatUser(
              chatId: dataDocChatId,
              connection: dataDocChat["connection"],
              lastTime: dataDocChat["lastTime"],
              total_unread: dataDocChat["total_unread"],
            ));
          });
          user.update((user) {
            user!.chats = dataListChats;
          });
        } else {
          user.update((user) {
            user!.chats = [];
          });
        }

        chat_id = newChatDoc.id;

        user.refresh();
      }
    }

    print(chat_id);

    final updateStatusChat = await chats
        .doc(chat_id)
        .collection("chat")
        .where("isRead", isEqualTo: false)
        .where("penerima", isEqualTo: _currentUser!.email)
        .get();

    updateStatusChat.docs.forEach((element) async {
      await chats
          .doc(chat_id)
          .collection("chat")
          .doc(element.id)
          .update({"isRead": true});
    });

    await users
        .doc(_currentUser!.email)
        .collection("chats")
        .doc(chat_id)
        .update({"total_unread": 0});

    Get.toNamed(
      Routes.CHAT_ROOM,
      arguments: {
        "chat_id": "$chat_id",
        "friendEmail": friendEmail,
      },
    );
  }

  // void updatePassword(
  //   String password,
  //   String confirmPassword,
  //   String email,
  // ) async {
  //   if (password != confirmPassword) {
  //     Get.defaultDialog(
  //         title: 'Peringatan', middleText: 'Password tidak sama!');
  //   } else if (password == '' || confirmPassword == '') {
  //     Get.defaultDialog(
  //         title: 'Peringatan', middleText: 'Password tidak boleh kosong!');
  //   } else if (password == '' && confirmPassword == '') {
  //     Get.defaultDialog(
  //         title: 'Peringatan', middleText: 'Password tidak boleh kosong!');
  //   } else {
  //     await _auth.currentUser!.updatePassword(confirmPassword).then((value) {
  //       CollectionReference users = firestore2.collection('paisen');
  //       users.doc(email).update({
  //         'password': password,
  //       }).then((value) {
  //         http.post(
  //             Uri.parse(
  //                 "https://edda-2404-8000-102e-46f5-b044-5942-6c34-94f0.ap.ngrok.io/hc/api/updatePassword.php"),
  //             body: {
  //               'email': email,
  //               'password': password,
  //             });
  //       });
  //     });

  //     pasienModel.update((user) {
  //       user!.password = password;
  //     });
  //     pasienModel.refresh();
  //     Get.defaultDialog(
  //         title: 'Perhatian', middleText: 'Berhasil Mengubah Password');
  //   }
  // }

  // void login2() async {
  //   try {
  //     _googleSignIn.signOut();

  //     await _googleSignIn.signIn().then((value) => _currentUser = value);

  //     // ini untuk mengecek status login user
  //     final isSignIn = await _googleSignIn.isSignedIn();

  //     // kondisi login berhasil
  //     print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
  //     print(_currentUser);

  //     final googleAuth = await _currentUser!.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken,
  //       accessToken: googleAuth.accessToken,
  //     );
  //     CollectionReference users = firestore.collection('users');
  //     final checkuser = await users.doc(_currentUser!.email).get();
  //     print(["askdjajs", checkuser.data()]);

  //     if (checkuser.data() == null) {
  //       Get.defaultDialog(middleText: 'user  tidak terdaftar');
  //     } else {
  //       Get.defaultDialog(middleText: 'user  terdaftar silahkan ');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // void register2(
  //   String nama,
  //   String jk,
  //   String alamat,
  // ) async {
  //   try {
  //     await _googleSignIn.signOut();
  //     await _googleSignIn.signIn().then((value) => _currentUser = value);

  //     final googleAuth = await _currentUser!.authentication;

  //     final credential = GoogleAuthProvider.credential(
  //       idToken: googleAuth.idToken,
  //       accessToken: googleAuth.accessToken,
  //     );

  //     await FirebaseAuth.instance
  //         .signInWithCredential(credential)
  //         .then((value) => userCredential = value);

  //     final box = GetStorage();
  //     if (box.read('skipIntro') != null) {
  //       box.remove('skipIntro');
  //     }
  //     box.write('skipIntro', true);
  //     CollectionReference users = firestore.collection('users');

  //     final checkuser = await users.doc(_currentUser!.email).get();

  //     if (checkuser.data() == null) {
  //       await users.doc(_currentUser!.email).set({
  //         "uid": userCredential!.user!.uid,
  //         "name": _currentUser!.displayName,
  //         "keyName": _currentUser!.displayName!.substring(0, 1).toUpperCase(),
  //         "email": _currentUser!.email,
  //         "photoUrl": _currentUser!.photoUrl ?? "noimage",
  //         "status": "",
  //         "creationTime":
  //             userCredential!.user!.metadata.creationTime!.toIso8601String(),
  //         "lastSignInTime":
  //             userCredential!.user!.metadata.lastSignInTime!.toIso8601String(),
  //         "updatedTime": DateTime.now().toIso8601String(),
  //       });

  //       await users.doc(_currentUser!.email).collection("chats");
  //     } else {
  //       Get.defaultDialog(middleText: 'user sudah terdaftar');
  //     }
  //   } catch (e) {}
  // }

  // Future<void> loginThu() async {
  //   try {
  //     // Ini untuk handle kebocoran data user sebelum login
  //     await _googleSignIn.signOut();

  //     // Ini digunakan untuk mendapatkan google account
  //     await _googleSignIn.signIn().then((value) => _currentUser = value);

  //     // ini untuk mengecek status login user
  //     final isSignIn = await _googleSignIn.isSignedIn();

  //     if (isSignIn) {
  //       // kondisi login berhasil
  //       print("SUDAH BERHASIL LOGIN DENGAN AKUN : ");
  //       print(_currentUser);

  //       final googleAuth = await _currentUser!.authentication;

  //       final credential = GoogleAuthProvider.credential(
  //         idToken: googleAuth.idToken,
  //         accessToken: googleAuth.accessToken,
  //       );

  //       await FirebaseAuth.instance
  //           .signInWithCredential(credential)
  //           .then((value) => userCredential = value);

  //       print("USER CREDENTIAL");
  //       print(userCredential);

  //       // simpan status user bahwa sudah pernah login & tidak akan menampilkan introduction kembali
  //       final box = GetStorage();
  //       if (box.read('skipIntro') != null) {
  //         box.remove('skipIntro');
  //       }
  //       box.write('skipIntro', true);

  //       // masukan data ke firebase...
  //       CollectionReference users = firestore.collection('pasien');

  //       final checkuser = await users.doc(_currentUser!.email).get();

  //       if (checkuser.data() == null) {
  //         Get.offAllNamed(Routes.REGISTER)!.then((value) async {
  //           await users.doc(_currentUser!.email).set({
  //             "uid": userCredential!.user!.uid,
  //             "name": _currentUser!.displayName,
  //             "keyName":
  //                 _currentUser!.displayName!.substring(0, 1).toUpperCase(),
  //             "email": _currentUser!.email,
  //             "photoUrl": _currentUser!.photoUrl ?? "noimage",
  //             "status": "",
  //             "creationTime": userCredential!.user!.metadata.creationTime!
  //                 .toIso8601String(),
  //             "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
  //                 .toIso8601String(),
  //             "updatedTime": DateTime.now().toIso8601String(),
  //           });
  //         });

  //         await users.doc(_currentUser!.email).collection("chats");
  //       } else {
  //         await users.doc(_currentUser!.email).update({
  //           "lastSignInTime": userCredential!.user!.metadata.lastSignInTime!
  //               .toIso8601String(),
  //         });
  //       }

  //       final currUser = await users.doc(_currentUser!.email).get();
  //       final currUserData = currUser.data() as Map<String, dynamic>;

  //       user(UsersModel.fromJson(currUserData));

  //       user.refresh();

  //       final listChats =
  //           await users.doc(_currentUser!.email).collection("chats").get();

  //       if (listChats.docs.length != 0) {
  //         List<ChatUser> dataListChats = [];
  //         listChats.docs.forEach((element) {
  //           var dataDocChat = element.data();
  //           var dataDocChatId = element.id;
  //           dataListChats.add(ChatUser(
  //             chatId: dataDocChatId,
  //             connection: dataDocChat["connection"],
  //             lastTime: dataDocChat["lastTime"],
  //             total_unread: dataDocChat["total_unread"],
  //           ));
  //         });

  //         user.update((user) {
  //           user!.chats = dataListChats;
  //         });
  //       } else {
  //         user.update((user) {
  //           user!.chats = [];
  //         });
  //       }

  //       user.refresh();

  //       isAuth.value = true;
  //       Get.offAllNamed(Routes.DASHBOARD);
  //     } else {
  //       print("TIDAK BERHASIL LOGIN");
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }
}
