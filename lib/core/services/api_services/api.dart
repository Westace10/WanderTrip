import 'package:appwrite/appwrite.dart';
import 'package:flutter/services.dart';
import 'package:wandertrip/app/app.logger.dart';
import 'package:wandertrip/core/constants/app_credentials.dart';
import 'package:wandertrip/core/models/wandertrip_user.dart';

class AppWriteApiServices {
  final log = getLogger("AppWriteApiServices");
  Client client = Client()
      .setEndpoint('https://cloud.appwrite.io/v1')
      .setProject(appWriteProjectID)
      .setSelfSigned(); // For self signed certificates, only use for development

  Future createAccount(String email, String password, String name) async {
    try {
      Account account = Account(client);
      final result = await account
          .create(
        userId: ID.unique(),
        email: email,
        password: password,
        name: name,
      )
          .then((response) async {
        await account.createEmailSession(email: email, password: password);
        return response;
      });
      return result;
    } catch (e) {
      return "error";
    }
  }

  Future<String?> uploadProfilePicture(String filePath, String imgName) async {
    try {
      final account = Account(client);
      final storage = Storage(client);

      final res = await account.get();
      final result = await storage.createFile(
        bucketId: appWriteUsersProfileBucketID,
        file: InputFile.fromPath(path: filePath, filename: imgName),
        fileId: ID.unique(),
        permissions: ['role:all', 'user:${res.$id}'],
      );
      return result.$id;
    } catch (e) {
      log.v('$e');
      rethrow;
    }
  }

  Future<void> addUserProfile(
      {String? name, String? bio, String? imgId}) async {
    // Get the details about the current logged in user
    final account = Account(client);
    final database = Databases(client);

    final res = await account.get();

    try {
      // //  We will be updating his name in the Users Api
      // await account.updateName(name: name ?? "");
      // Additional data of the user will be written in the collection
      await database.createDocument(
        databaseId: appWriteDatabaseID,
        collectionId: appWriteUsersCollectionID,
        documentId: res.$id,
        data: {
          'name': res.name,
          'bio': bio ?? "",
          'imgId': imgId ?? "",
          'email': res.email,
          'id': res.$id,
        },
        permissions: [
          Permission.create(Role.user(res.$id)),
          Permission.read(Role.any()),
          Permission.write(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );
    } catch (_) {
      log.v(_);
      rethrow;
    }
  }

  Future<WanderTripUser?> getCurrentUser() async {
    try {
      final account = Account(client);
      final database = Databases(client);

      final user = await account.get();
      final data = await database.getDocument(
        databaseId: appWriteDatabaseID,
        collectionId: appWriteUsersCollectionID,
        documentId: user.$id,
      );
      final img = await _getProfilePicture(data.data['imgId']);
      log.v(data.data);
      return WanderTripUser.fromMap(data.data).copyWith(image: img);
    } catch (_) {
      rethrow;
    }
  }

  Future<List<WanderTripUser>> getUsersList() async {
    try {
      final database = Databases(client);

      final response = await database.listDocuments(
        databaseId: appWriteDatabaseID,
        collectionId: appWriteUsersCollectionID,
      );
      final List<WanderTripUser> users = [];
      final temp = response.documents;
      // If the list is empty, return an empty list
      if (temp.isEmpty) {
        return users;
      }
      // For loop for converting the data to our [WanderTripUser] object
      for (var element in temp) {
        final memImage =
            await _getProfilePicture(element.data['imgId'] as String);
        users.add(
            WanderTripUser.fromMap(element.data).copyWith(image: memImage));
      }
      return users;
    } on AppwriteException {
      rethrow;
    }
  }

  Future<Uint8List> _getProfilePicture(String fileId) async {
    try {
      final storage = Storage(client);

      final data = await storage.getFilePreview(
        bucketId: appWriteUsersProfileBucketID,
        fileId: fileId,
      );
      return data;
    } on AppwriteException {
      rethrow;
    }
  }

  Future<void> addFavCountry({String? countryName}) async {
    try {
      final account = Account(client);
      final database = Databases(client);

      final user = await account.get();
      log.v(user.status);

      final response = await database.updateDocument(
        databaseId: appWriteDatabaseID,
        collectionId: appWriteUsersCollectionID,
        documentId: ID.unique(),
        data: {
          'country_name': countryName ?? "",
          'email': user.email,
          'id': user.$id,
        },
        permissions: [
          Permission.read(Role.any()),
          Permission.write(Role.any()),
          Permission.update(Role.any()),
          Permission.delete(Role.any()),
        ],
      );

      // if (response. == 201) {
      log.v(response.data['\$id']);
    } catch (e) {
      log.v(e);
    }

    // Perform further actions with the country ID
    // } else {
    //   // Handle error
    // }
  }

  Future loginUser(
    String email,
    String password,
  ) async {
    try {
      Account account = Account(client);
      final result = await account
          .createEmailSession(email: email, password: password)
          .then((response) {
        return response;
      });
      return result;
    } catch (e) {
      log.v(e);
      return "error";
    }
  }

  Future logOut() async {
    try {
      Account account = Account(client);
      final result =
          await account.deleteSession(sessionId: 'current').then((response) {
        return response;
      });
      log.v(result);
      return result;
    } catch (e) {
      log.v(e);
      return e;
    }
  }

  Future getUserData() async {
    try {
      Account account = Account(client);
      final result = await account.get().then((response) {
        return response;
      });
      return result;
    } catch (e) {
      return e;
    }
  }

  Future getUserSession(String session) async {
    try {
      Account account = Account(client);
      final result =
          await account.getSession(sessionId: session).then((response) {
        return response;
      });
      return result;
    } catch (e) {
      return e;
    }
  }

  Future updateUserAccountName(String newName) async {
    try {
      Account account = Account(client);
      final result = await account.updateName(name: newName).then((response) {
        return response;
      });
      return result;
    } catch (e) {
      return e;
    }
  }

  // Future passwordRecovery(
  //   String phone,
  //   String password,
  // ) async {
  //   try {
  //     Account account = Account(client);
  //     final result = await account
  //         .updatePhone(phone: phone, password: password)
  //         .then((response) {
  //       return response;
  //     });
  //     return result;
  //   } catch (e) {
  //     return e;
  //   }
  // }

  Future updatePassword(
    String newPassword,
    String oldPassword,
  ) async {
    try {
      Account account = Account(client);
      final result = await account
          .updatePassword(password: newPassword, oldPassword: oldPassword)
          .then((response) {
        return response;
      });
      return result;
    } catch (e) {
      return e;
    }
  }

  Future updateEmail(
    String email,
    String password,
  ) async {
    try {
      Account account = Account(client);
      final result = await account
          .updateEmail(email: email, password: password)
          .then((response) {
        return response;
      });
      return result;
    } catch (e) {
      return e;
    }
  }

  Future updatePhone(
    String phone,
    String password,
  ) async {
    try {
      Account account = Account(client);
      final result = await account
          .updatePhone(phone: phone, password: password)
          .then((response) {
        return response;
      });
      return result;
    } catch (e) {
      return e;
    }
  }
}
