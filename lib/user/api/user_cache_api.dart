// import 'package:authentication_repository/authentication_repository.dart'
//     as auth;

// import 'package:dartz/dartz.dart';
// import 'package:hive/hive.dart';
// import 'package:user_repository/user_repository.dart';

// /// MongoDB userApi.
// /// @see [User]
// /// @see [UserException]

// class UserCacheApi extends UserApi {
//   final HiveInterface _hive;
//   final auth.AuthenticationRepository _authenticationRepository;
//   static const String _boxName = '__user__';

//   UserCacheApi({required authenticationRepository, required HiveInterface hive})
//       : _authenticationRepository = authenticationRepository,
//         _hive = hive..openBox<User>(_boxName);

//   @override
//   Future<Either<UserException, User>> getUser(String id) async {
//     try {
//       var userBox = _hive.box<User>(_boxName);
//       User? user = userBox.get(id);

//       if (user == null) {
//         return Left(UserException(message: 'Error cargando al usuario'));
//       }
//       return Right(user);
//     } on HiveError catch (e) {
//       return Left(UserException(message: e.message));
//     } catch (e) {
//       return Left(UserException());
//     }
//   }

//   @override
//   Future<Either<UserException, User>> deleteUser(String id) async {
//     try {
//       var userBox = _hive.box<User>(_boxName);
//       await userBox.delete(id);

//       return const Right(User.empty);
//     } on HiveError catch (e) {
//       return Left(UserException(message: e.message));
//     } catch (e) {
//       return Left(UserException());
//     }
//   }

//   @override
//   Future<Either<UserException, User>> updateUser(User user) async {
//     try {
//       var userBox = _hive.box<User>(_boxName);
//       await userBox.put(user.id, user);

//       return Right(user);
//     } on HiveError catch (e) {
//       return Left(UserException(message: e.message));
//     } catch (e) {
//       return Left(UserException());
//     }
//   }

//   @override
//   Future<Either<UserException, Nothing>> acceptInvitation(String code) async {
//     throw UnimplementedError();
//   }

//   @override
//   Future<Either<UserException, Nothing>> deleteSupervised(String id) async {
//     try {
//       var userBox = _hive.box<User>(_boxName);
//       User? user = userBox.get(_authenticationRepository.currentUser.id);

//       if (user == null) {
//         return Left(UserException(message: 'Error cargando al usuario'));
//       }

//       user.supervised?.removeWhere((user) => user.id == id);
//       await userBox.put(user.id, user);
//       return const Right(Nothing());
//     } on HiveError catch (e) {
//       return Left(UserException(message: e.message));
//     } catch (e) {
//       return Left(UserException());
//     }
//   }

//   @override
//   Future<Either<UserException, Nothing>> deleteSupervisor(String id) async {
//     try {
//       var userBox = _hive.box<User>(_boxName);
//       User? user = userBox.get(_authenticationRepository.currentUser.id);

//       if (user == null) {
//         return Left(UserException(message: 'Error cargando al usuario'));
//       }

//       user.supervisors?.removeWhere((user) => user.id == id);
//       await userBox.put(user.id, user);
//       return const Right(Nothing());
//     } on HiveError catch (e) {
//       return Left(UserException(message: e.message));
//     } catch (e) {
//       return Left(UserException());
//     }
//   }
// }
