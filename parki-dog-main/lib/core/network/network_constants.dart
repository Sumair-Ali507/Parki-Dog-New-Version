class NetworkConstants {
  static const int apiTimeOut = 30 * 1000;

  // API - Database constants
  static const String baseUrl = 'https://m-alnagar.onrender.com/api/v1';

  static const String login = '/users/login';
  static const String signup = '/users/signup';
  static const String verifyEmail = '/users/verify';
  static const String logout = '/users/logout';
  static const String forgotPassword = '/users/forgotPassword';
  static const String resetPassword = '/users/resetPassword';
  static const String parks = '/parks';
  static const String park = '/park';
  static const String nearbyParks = '/parks/nearby';
  static const String profile = '/users/profile';
  static const String dogs = '/dogs/';
  static const String checkIn = '/parks/checkin';
  static const String checkOut = '/parks/checkout';
  static const String myDogs = '/dogs/my';
  static const String friendsRequest = '/friends/request';
  static const String friendsRequests = '/friends/requests';
  static const String friends = '/friends';
  static const String notifications = '/notifications';
  static const String chats = '/chats';
  static const String chatsFriend = '/chats/friend';
  static const String chatsMessage = '/chats/message';

  static const String changeMail = '/changeMail';
  static const String changePassword = '/changePassword';
  static const String submitInfo = '/submitInfo';
// End points
}
