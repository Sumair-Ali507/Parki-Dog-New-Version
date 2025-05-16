import 'package:dio/dio.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/friends/data/datasource/remote/friends_remote_data_source.dart';
import 'package:parki_dog/features/friends/data/models/friend_request_response.dart';
import 'package:parki_dog/features/friends/data/models/friend_requests_response.dart';
import 'package:parki_dog/features/friends/data/models/friend_response.dart';
import 'package:parki_dog/features/friends/data/models/friends_response.dart';
import 'package:parki_dog/features/friends/domain/repository/base_friends_repository.dart';
import 'package:parki_dog/features/friends/domain/use_case/respond_to_request_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/send_friend_request_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/unfriend_use_case.dart';

class FriendsRepository extends BaseFriendsRepository {
  final BaseFriendsRemoteDataSource baseFriendsRemoteDataSource;

  FriendsRepository(this.baseFriendsRemoteDataSource);

  @override
  Future<(Failure?, FriendRequestsResponse?)> getFriendRequests(
      NoParameters parameters) async {
    try {
      final result =
          await baseFriendsRemoteDataSource.getFriendRequests(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, FriendsResponse?)> getFriends(
      NoParameters parameters) async {
    try {
      final result = await baseFriendsRemoteDataSource.getFriends(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, FriendResponse?)> respondToRequest(
      RespondToRequestParameters parameters) async {
    try {
      final result =
          await baseFriendsRemoteDataSource.respondToRequest(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, FriendRequestResponse?)> sendFriendRequest(
      SendFriendRequestParameters parameters) async {
    try {
      final result =
          await baseFriendsRemoteDataSource.sendFriendRequest(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, bool?)> unFriend(UnFriendParameters parameters) async {
    try {
      final result = await baseFriendsRemoteDataSource.unFriend(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
