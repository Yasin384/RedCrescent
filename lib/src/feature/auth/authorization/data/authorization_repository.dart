import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:red_crescent/src/core/constans/storage_key.dart';
import 'package:red_crescent/src/core/model/access.dart';
import 'package:rxdart/rxdart.dart';

/// {@template authorization_repository}
/// AuthorizationRepository.
/// {@endtemplate}
abstract interface class AuthorizationRepository {
  /// {@macro authorization_repository}

  Future<void> unAuthorize();

  Future<void> authorize(Access acces);

  Future<void> initAuthSession();

  BehaviorSubject<Access?> get accesSubj;
}

/// {@template authorization_repository}
/// AuthorizationRepositoryImpl.
/// {@endtemplate}
final class AuthorizationRepositoryImpl implements AuthorizationRepository {
  /// {@macro authorization_repository}

  AuthorizationRepositoryImpl(
      {required FlutterSecureStorage flutterSecureStorage})
      : _flutterSecureStorage = flutterSecureStorage;

  final FlutterSecureStorage _flutterSecureStorage;

  final BehaviorSubject<Access?> _accessSubj = BehaviorSubject.seeded(null);

  @override
  BehaviorSubject<Access?> get accesSubj => _accessSubj; // вернул приватное поле

  @override
  Future<void> authorize(Access acces) async {
    await _flutterSecureStorage.write(
        key: StorageKey.access, value: accessToJson(acces));
    _accessSubj.add(acces);
  }

  @override
  Future<void> unAuthorize() async {
    await _flutterSecureStorage.delete(key: StorageKey.access);
    _accessSubj.add(null);
  }

  @override
  Future<void> initAuthSession() async {
    final access = await _flutterSecureStorage.read(key: StorageKey.access);

    if (access != null) {
      _accessSubj.add(accessFromJson(access));
    }
  }
}
