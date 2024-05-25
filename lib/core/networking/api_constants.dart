//video 9

class ApiConstants {
  static const String apiBaseUrl = "https://mazrealty.onrender.com/api/v1/";
  static const String login = "auth/login";
  static const String signup = "auth/signup";
  static const String userInfo = "users/me";
  static const String allPosts = "properties";
  static const String myAds = "properties/my-properties";
  static const String myFavorites = "favorites";
  static const String updateUser="users/updateme";
  static const String addProperty="properties";
  static const String updatePassword="users/updateMyPassword";
  static const String adminHome="lawyers/not-approved";
  static const String cities="cities";
  static const String approveProperty="lawyers/approve-property/";
  static const String makeFavorite="favorites/";
  static const String rejectProperty="lawyers/reject-property/";
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";
}

