import 'dart:typed_data';
import 'package:googleapis_auth/auth_io.dart' as auth;

import 'package:gcloud/storage.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:mime/mime.dart';

class CloudApi {
  final auth.ServiceAccountCredentials _credentials;
  late auth.AutoRefreshingAuthClient _client;

  CloudApi(String json)
      : _credentials = auth.ServiceAccountCredentials.fromJson(json);

  Future<ObjectInfo> save(String name, Uint8List imgBytes) async {
    _client = await auth.clientViaServiceAccount(_credentials, Storage.SCOPES);
    var storage = Storage(_client, 'registration-app');
    var bucket = storage.bucket('mybucket_reg');

    final type = lookupMimeType(name);
    return await bucket.writeBytes(name, imgBytes,
        metadata: ObjectMetadata(contentType: type));
  }
}
