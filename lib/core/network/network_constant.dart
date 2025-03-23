class NetworkConstant{

  static const baseUrl  = "https://champion-edu.com/wp-json/";

  static const login ="jwt-auth/v1/token";

  static const register ="custom/v1/register";
  static const products ="custom-api/v1/courses";
  static const categories ="wp/v2/course-category";
  static const profile="wp/v2/users/me";
static const otpsend="email-otp-authenticator/v1/generate";
static const otpResend="email-otp-authenticator/v1/resend";
static const otpValidate="email-otp-authenticator/v1/validate";
static const resetPassword="email-otp-authenticator/v1/reset-password";
static const deleteAccount="custom/v1/delete-account";
  static const String addToWishList = 'custom-api/v1/add-to-favorites';
  static const String getWishList = 'custom-api/v1/get-favorites';
  static const String removeFromWishList = 'custom-api/v1/remove-from-favorites';
  static const String consumerKey='ck_02177b0141641f93c75a9a5ee966a58193dd2785';
  static const String secretKey='cs_d4cc60a631e3fa015153fb7483f53543e1f0de3b';
  static const order="wc/v3/orders";
  static const search="wc/v3/products";
}