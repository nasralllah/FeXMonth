

import '../data/API_Backend/Models/CommentRatingModel.dart';

class AppConstants {



  static const String APP_NAME = 'femonth ';

  static  String BASE_URL = 'http://10.0.2.2:8000';
  // static  String BASE_URL = 'Ahttp://10.0.2.2:8000';

  static const String USER_ID = 'userId';
  static const String NAME1 = 'name1';
  static const String TOKEN1 = 'token1';
  static const String NEWS = "/api/home/news";
  static const String BRANDS_URI = '/api/v1/brands?category_id=';
  static const String BRAND_PRODUCT_URI = '/api/v1/brands/products/';
  static const String CATEGORY_PRODUCT_URI = '/api/v1/categories/products/';
  static const String REGISTRATION_URI = '/api/v1/auth/register';
  static const String LOGIN_URI = '/api/v1/auth/login';
  static const String DELETE_ACCOUNT = '/api/v1/auth/delete_account';
  static const String LATEURI = '/api/v1/config';
  static const String ADD_WISH_LIST_URI = '/api/v1/customer/wish-list/add?product_id=';
  static const String REMOVE_WISH_LIST_URI = '/api/v1/customer/wish-list/remove?product_id=';
  static const String UPDATE_PROFILE_URI = '/api/v1/customer/update-profile';
  static const String CUSTOMER_URI = '/api/v1/customer/info';
  static const String ADDRESS_LIST_URI = '/api/v1/customer/address/list';
  static const String REMOVE_ADDRESS_URI = '/api/v1/customer/address?address_id=';
  static const String ADD_ADDRESS_URI = '/api/v1/customer/address/add';
  static const String WISH_LIST_GET_URI = '/api/v1/customer/wish-list';
  static const String SUPPORT_TICKET_URI = '/api/v1/customer/support-ticket/create';
  static const String MAIN_BANNER_URI = '/api/v1/banners?banner_type=main_banner&category_id=';
  static const String FOOTER_BANNER_URI = '/api/v1/banners?banner_type=footer_banner&category_id=';
  static const String MAIN_SECTION_BANNER_URI = '/api/v1/banners?banner_type=main_section_banner&category_id=';
  static const String SECOND_SECTION_BANNER_URI = '/api/v1/banners?banner_type=sec_section_banner&category_id=';
  static const String RELATED_PRODUCT_URI = '/api/v1/products/related-products/';
  static const String ORDER_URI = '/api/v1/customer/order/list';
  static const String ORDER_DETAILS_URI = '/api/v1/customer/order/details?order_id=';
  static const String ORDER_PLACE_URI = '/api/v1/customer/order/place';
  static const String SELLER_URI = '/api/v1/seller?seller_id=';
  static const String SELLER_PRODUCT_URI = '/api/v1/seller/';
  static const String TOP_SELLER = '/api/v1/seller/top';
  static const String TRACKING_URI = '/api/v1/order/track?order_id=';
  static const String FORGET_PASSWORD_URI = '/api/v1/auth/forgot-password';
  static const String SUPPORT_TICKET_GET_URI = '/api/v1/customer/support-ticket/get';
  static const String SUPPORT_TICKET_CONV_URI = '/api/v1/customer/support-ticket/conv/';
  static const String SUPPORT_TICKET_REPLY_URI = '/api/v1/customer/support-ticket/reply/';
  static const String SUBMIT_REVIEW_URI = '/api/v1/products/reviews/submit';
  static const String FLASH_DEAL_URI = '/api/v1/flash-deals?category_id=';
  static const String FEATURED_DEAL_URI = '/api/v1/deals/featured?category_id=';
  static const String FLASH_DEAL_PRODUCT_URI = '/api/v1/flash-deals/products/';
  static const String COUNTER_URI = '/api/v1/products/counter/';
  static const String SOCIAL_LINK_URI = '/api/v1/products/social-share-link/';
  static const String SHIPPING_URI = '/api/v1/products/shipping-methods';
  static const String CHOSEN_SHIPPING_URI = '/api/v1/shipping-method/chosen';
  static const String COUPON_URI = '/api/v1/coupon/apply?code=';
  static const String MESSAGES_URI = '/api/v1/customer/chat/messages?shop_id=';
  static const String CHAT_INFO_URI = '/api/v1/customer/chat';
  static const String SEND_MESSAGE_URI = '/api/v1/customer/chat/send-message';
  static const String TOKEN_URI = '/api/v1/customer/cm-firebase-token';
  static const String NOTIFICATION_URI = '/api/v1/notifications';
  static const String GET_CART_DATA_URI = '/api/v1/cart';
  static const String ADD_TO_CART_URI = '/api/v1/cart/add';

  static  String TOKEN = 'token';
  static  String ORDER_CODE = '';
  static  String ACCOUNT_TYPE = 'general';
  static  String USER = 'user';
  static  String USER_EMAIL = 'user_email';
  static  String USER_PASSWORD = 'user_password';
  static  String HOME_ADDRESS = 'home_address';
  static const String SEARCH_ADDRESS = 'search_address';
  static const String OFFICE_ADDRESS = 'office_address';
  static const String CART_LIST = 'cart_list';
  static const String CONFIG = 'config';
  static const String GUEST_MODE = 'guest_mode';
  static const String CURRENCY = 'currency';
  static const String LANG_KEY = 'lang';
  static const String INTRO = 'intro';

  //RemoteConfig
  static  bool showLogin = false;
  static double textScaleFactior = 1.0 ;

  static List<String> selectedNavigatorPicList  =[
    "Images/path7.png" ,
    "Images/Group 80.png",
    "Images/Mask Group 4@2x.png"

  ];


}








