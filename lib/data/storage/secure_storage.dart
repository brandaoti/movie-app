import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'internal_storage.dart';

class SecureStorage extends InternalStorageAdapter {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<String> getFavoriteMovie(int id) async {
    return await _storage.read(key: id.toString());
  }

  @override
  removeFavorite(int id) async {
    await _storage.delete(key: id.toString());
    print('Id: $id deletado.');
  }

  @override
  saveFavorite(int id) async {
    await _storage.write(key: id.toString(), value: id.toString());
    print('Id: $id salvo.');
  }

  @override
  void toggleFavorite(int movieID) {}
}
