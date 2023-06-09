import 'package:clean_cinema/app/domain/either.dart';
import 'package:clean_cinema/app/domain/enums.dart';
import 'package:clean_cinema/app/domain/models/user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../domain/repositories/authentication_repository.dart';

const _key = 'sessionID';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final FlutterSecureStorage _secureStorage;

  AuthenticationRepositoryImpl(this._secureStorage);

  @override
  Future<User?> getUserData() => Future.value(User());
  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _secureStorage.read(key: _key);
    return sessionId != null;
  }

  @override
  Future<Either<SignInFailure, User>> signIn(
    String username,
    String password,
  ) async {
    await Future.delayed(const Duration(seconds: 2));

    if (username != 'test') {
      return Either.left(SignInFailure.notFound);
    }
    if (password != '123456') {
      return Either.left(SignInFailure.unauthorized);
    }

    await _secureStorage.write(key: _key, value: '123');

    return Either.right(
      User(),
    );
  }
  
  @override
  Future<void> signOut(){
    return _secureStorage.delete(key: _key);
  }
}
