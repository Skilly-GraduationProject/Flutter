class ApiConstants {
  static const String baseUrl = 'https://skilly.runasp.net/api/';
  static const String getRequestedServices =
      'UserProfile/requestServices/getAllRequests';
  static const String getHomeBanners = 'Banner/GetAllBanners';
  static const String getProviderProfile =
      'Provider/GetServiceProviderByUserId';
  static const String getMyServices =
      'Provider/ProviderServices/GetAllServicesByproviderId';
  static const String getMyGallery =
      'Provider/Servicegallery/GetAllServicegalleryByproviderId';
  static const String getMyReviews =
      'Provider/Review/GetAllReviewsByproviderId';
  static const String addService = 'Provider/ProviderServices/AddService';
  static const String getNotifications = 'Notification/GetUserNotifications';
  static const String deleteNotification =
      'Notification/Delete-Notification-By';
  static const String sendOffer = 'OfferSalary/AddOffer';
  static const String getChats = 'Chat/GetChatsForUser';
}
