import 'package:demo_blnk/users.dart';
import 'package:gsheets/gsheets.dart';

class UserReg {
  static const _credentials = r'''{
  "type": "service_account",
  "project_id": "registration-app-353301",
  "private_key_id": "756e8b38e0b4899e239b29ad5d8f83c01d6c9882",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCwvWgAK+tsjSjd\nuEiG/zWfxso+PqwmJQTElicMFPh9GlsBujFfRGC20eh4bPXkKsYWxwPL1k8mZoo2\nyeMNL5QnOv0jpMRHiDw9zMuP9+j1T6kgXcNSX0GC7rvhN+oehLdOckcKvzIQOuNL\nnow3NpH0G9kX4XloPw3vMs8hIJh1OzwWlIZOiPA1qUjkibBoF07uYOjaC2NIKtB1\nvHI+JDGGsRziryqEepB2RQWizDL3suHQ1GJzpPDCHv4FYDYiVG2DAH+BF73kU6ZS\n/uDl57lR7LxfJKc6+M0vlHR3JH6iPCaL8z+QgU3mS/4738eSU9WMNq/Ao8I1Op2V\nefEdbCPVAgMBAAECggEAHZJbc+flWMDXrR13+Sp7ePPkg/ythiZcgV4UQ3fAygHe\nZ1AVkbiZrA08JeYpUFd91HLRJkqB7M1sY9VsyZiD4/qBP3UCqGtZlQeOqdSTpHQD\nOtilZUNt7S/vvLPD1v5iw1vomho6kK+ht1XcZSKa0irUrKO70h72wGaSdJsFF1we\nGqakcLv7BW+fy08sp1/Nf00ZBYNJ2A66+04mmS+NUoSkalcRlUcte+FWAPgzonRj\nXexvfiN46wpMjN4SNPAkH62WUYv3GNWdl8b/F9SINf3jZ+OUuwbIHl0zb4U9794N\nPNsu4dbPVkAJonVIl0oU0r+LKUsUdCqmDsdYRpyqkwKBgQDhFas/+tD1CNlJnN7f\n7eI+7wM09rj3kLk3Mepz7qzJg7he5bKLrBU6aN+VCmQUejUBvzNHHWvuPAKmvAul\n3vlLOLSmQDizZF3OlG3jK3ry3L3OvG5hsMJ8VybQXedaY486r9iAnkkY0tIAUQ0r\nEGCLrteSzAbBRn1Zp4cZ5vjLewKBgQDJA9vWRPRHHBTrtLeG775T94IFfbyLCexZ\nzFIqN16xxYCp7zmIKBfDW1FLg8yTBJIhzcRrY2n6BpEUjFSSzr8cjSR5zOTE4wwX\n19wQI/sOX9fBwxfX3qp1YOC9wCiBN68CIkvBULUyiqkYUlcuIFNC13HcrR9TnkBz\n4j4tQVTE7wKBgGsANRfGMV27JiiTdXQ4jwxh7UFZZJbz6sitZwpT1To67wPV6Cnz\n1WeeAWPFu8vsSJSbA1J0TyHCz3PaAyOIOzSiMWazMwE83kddUlvjCKC5hVXpSAQS\n1nHrsFzvtxLGL4mznJWQKamuVvyli0AEmhDtPjff2/o3e1GKjXQn0/BPAoGAe9tJ\n0GuqTEpsRZOTZaxBDMG7tqBz1QPnQqlXkzWMvmKgVZTWUSPLCI8ytyHdolS1qeh8\nd2LJAMqdCBkzX0XOkcwRxo7OAtaXM/XIXZWd8oxxh60q+tLzGuH3eFN3Ya8qwVja\nbqHJE/xGFntdxkkapFvVh5CQddhThFPJ1d6kWbcCgYBe3WI6mf8ygMvlqrjNx9aQ\n7cCjgAuNLHs7SPEKY0Yz3pywYiIpfqlNLJMs5KSkXawND3aO14GcNyCplr5RuRtv\nemsYtf9eZ0grckvx6ABahgFX2E0HPyH6mN8aEVs/Iu3FaHMPKt+8fcmTi3u0wWWg\n7t0X73gDM22LWIygm9p95Q==\n-----END PRIVATE KEY-----\n",
  "client_email": "abdullahhusam@registration-app-353301.iam.gserviceaccount.com",
  "client_id": "116009644084376593084",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/abdullahhusam%40registration-app-353301.iam.gserviceaccount.com"
}
''';

  static final spreadsheet_id = '1P-ej4MCStHlsJ-x4zCfVGCfCjALsX-hsyrkyNDpESXM';
  static final _gsheets = GSheets(_credentials);
  static Worksheet? _usersheet;

  static Future init() async {
    try {
      final spreadsheat = await _gsheets.spreadsheet(spreadsheet_id);
      _usersheet = await _getWorkSheet(spreadsheat, title: 'Sheet1');
      final firstRow = UserFields.getFields();
      _usersheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Error: $e');
    }
  }

  static Future<Worksheet?> _getWorkSheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title);
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_usersheet == null) return;
    _usersheet!.values.map.appendRows(rowList);
  }
}
