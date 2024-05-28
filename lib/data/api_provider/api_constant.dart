class ApiConstants {
  //new
  static const String _baseUrl = "https://pixstra.bcoder.co.in/api";
  static const String socketUrl = "https://pixstra.bcoder.co.in/api/socket";

  //old
  // static const String _baseUrl = "http://34.197.28.175/api";
 // static const String _baseUrl = "http://199.192.21.220:5001/api";
  // static const String _baseUrl = "https://beautyspot.codingcopz.in/api";

  // static const String _baseUrl = "https://admin.beautyspotapp.co.uk/api";

  // static const String imageBaseUrl = "http://34.197.28.175/images/";
  // static const String imageBaseUrl = "https://bcoder-dev-bucket.s3.amazonaws.com/beauty-spot/";
  static const String imageBaseUrl = "https://bcoder24.s3.ap-south-1.amazonaws.com/prod/";

  //apis
  static String logIn = "$_baseUrl/auths/login";
  static String socialLogin = "$_baseUrl/auths/social/login";
  static String signUp = "$_baseUrl/auths/register";
  static String changeName = "$_baseUrl/users/change-name";
  static String updateUser = "$_baseUrl/users";
  static String changePassword = "$_baseUrl/auths/changePassword";
  static String updatePassword = "$_baseUrl/auths/updatePassword";
  static String logout = "$_baseUrl/auths/logout";
  static String deleteProvider = "$_baseUrl/users/deletedUser";
  static String reportProblem = "$_baseUrl/reportProblems";

  static String checkEmailExist = "$_baseUrl/users/check-email-exist";
  static String appUserNameChecker = "$_baseUrl/users/appusernamechecker";
  static String forgotPassword = "$_baseUrl/auths/forgotpassword";
  static String codeVerification = "$_baseUrl/auths/verify";
  static String accountVerification = "$_baseUrl/auths/verify";
  static String code = "$_baseUrl/forgotpassword";
  static String resetPassword = "$_baseUrl/auths/resetpassword/user";
  static String businessProfile = "$_baseUrl/businessProfiles";
  static String updateBusinessAvailability = "$_baseUrl/businessprofiles/update/availability";
  static String editBusinessProfile =
      "$_baseUrl/businessProfiles/edit-business-profile";
  static String categories = "$_baseUrl/categories/provider-all-categories";
  static String getProviderProfile =
      "$_baseUrl/businessProfiles/get/provider/profile";
  static String getBusinessProfile =
      "$_baseUrl/businessProfiles/get/business/profile";
  static String addSubCategory = "$_baseUrl/subCategories/AddSubCategory";
  static String addProviderServices =
      "$_baseUrl/providerServices/add-provider-services";
  static String getProviderServices =
      "$_baseUrl/providerServices/get/provider/services";
  static String createProviderGallery =
      "$_baseUrl/providerGalleries/createProviderGallery";
  static String getProviderGallery =
      "$_baseUrl/providerGalleries/get/Provider/Gallery";
  static String deleteGalleryImage =
      "$_baseUrl/providerGalleries/deletedProviderImage";
  static String updateProviderGallery =
      "$_baseUrl/providerGalleries/updateProviderImage";
  static String businessImageUpdate =
      "$_baseUrl/businessProfiles/business-image-update";
  static String imageUpload = "$_baseUrl/images/upload";

  //client
  static String getSpotLightList =
      "$_baseUrl/businessProfiles/featured/Stylist";
  static String getRecentlyList = "$_baseUrl/businessProfiles/recently/viewed";
  static String getPopularList = "$_baseUrl/businessProfiles/popular/api";
  static String getRecentlyAddedList =
      "$_baseUrl/businessProfiles/recently/added";
  static String getCategoryDetail = "$_baseUrl/businessProfiles/filter-api";
  static String getCategoryDetailNew =
      "$_baseUrl/businessProfiles/categoryTypeFilter";
  static String gatService =
      "$_baseUrl/businessProfiles/ProviderCompleteProfile";
  static String getGallery = "$_baseUrl/providerGalleries/get/gallery";
  static String reviews = "$_baseUrl/ratings";
  static String addBookingReview = "$_baseUrl/reviews";
  static String favourite = "$_baseUrl/favourites";
  static String unfavourite = "$_baseUrl/favourites";
  static String getMapGallery = "$_baseUrl/businessProfiles/searchProvider";
  static String getFavourites = "$_baseUrl/favourites/get/Favorite";
  static String notificationUpdate = "$_baseUrl/users/toggle/Notification";
  static String deleteClient = "$_baseUrl/users/deletedUser";
  static String getNotificationList = "$_baseUrl/userNotifications";
  static String clearNotification =
      "$_baseUrl/userNotifications/clear/Notification";
  static String countNotification =
      "$_baseUrl/userNotifications/count/Notification";
  static String onClickBooking =
      "$_baseUrl/businessProfiles/increaseBookCounter";
  static String updateSearchlist = "$_baseUrl/searchLists/addSearchedKeyWord";

  static String getDayWiseAvailabilities = "$_baseUrl/days";
  static String createAvailability = "$_baseUrl/providerAvailabilities";
  static String toggleAvailability =
      "$_baseUrl/providerAvailabilities/day/onOff";
  static String createBlockDay = "$_baseUrl/providerAvailabilities/block";
  static String deleteBlockDay =
      "$_baseUrl/providerAvailabilities/block/delete";
  static String getBlockDays = "$_baseUrl/calendarDates";

  static String getProviderNewServices = "$_baseUrl/services/get/services";
  static String getProviderSlots = "$_baseUrl/bookings/get/slots";
  static String getAvailabilityDays = "$_baseUrl/days";

  //booking
  static String getBookingCalculations = "$_baseUrl/bookings/get/calculation";
  static String applyPromoCode = "$_baseUrl/promoCodes/get/promoCode";

  static String booking = "$_baseUrl/bookings";
  static String bookingCancelled = "$_baseUrl/bookings/cancelled";
  static String bookingFinished = "$_baseUrl/bookings/finished";

  static String verifyBookingPayment = "$_baseUrl/bookings/payment/complete";

  //subs
  static String checkSubscriptionStatus = "$_baseUrl/subscriptions/check";
  static String purchaseAppleSubscription = "$_baseUrl/subscriptions/apple";
  static String purchaseGoogleSubscription = "$_baseUrl/subscriptions/google";
  static String bookingPolicyUpdate = "$_baseUrl/users/create/update/booking/policy";


  static String  walletConnect = "$_baseUrl/spAccounts/connect";
  static String  walletStatus = "$_baseUrl/spAccounts/check/status";
  static String  getWallet = "$_baseUrl/wallets/get/my";
  static String getDashBoard = "$_baseUrl/dashboards/sp/count";

  static String services = "$_baseUrl/services";
  static String getCurrentBooking = "$_baseUrl/bookings/getCurrent/booking";
  static String acceptRequest= "$_baseUrl/requests/acceptRequest";
  static String rejectRequest = "$_baseUrl/requests/rejectRequest";
  static String cancelBooking = "$_baseUrl/bookings/cancel";
  static String startBooing = "$_baseUrl/bookings/startBooking";
  static String extendBooking = "$_baseUrl/bookings/extentBookingTime";
  static String endBooking = "$_baseUrl/bookings/endBooking";
  static String bookingComments = "$_baseUrl/comments";
  static String bookingLogs = "$_baseUrl/bookingLogs";
  static String bookings = "$_baseUrl/bookings";

  static String addMoney = "$_baseUrl/wallets/addMoney";
  static String verifyAddMoney = "$_baseUrl/wallets/paymentDone";
  static String walletTransactions = "$_baseUrl/walletTransactions";
}
