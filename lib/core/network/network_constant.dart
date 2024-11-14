class NetworkConstant{

  static const baseUrl  = "https://clusters.mediazoneag.com/wp-json/";

  static const login ="jwt-auth/v1/token";

  static const register ="custom/v1/register";
  static const products ="wc/v3/products";
    static const categories ="wc/v3/products/categories";
    static const profile="wp/v2/users/me";
static const otpsend="email-otp-authenticator/v1/generate";
static const otpResend="email-otp-authenticator/v1/resend";
static const otpValidate="email-otp-authenticator/v1/validate";
static const resetPassword="email-otp-authenticator/v1/reset-password";
static const deleteAccount="custom/v1/delete-account";
  static const String addToWishList = 'custom-api/v1/add-to-favorites';
  static const String getWishList = 'custom-api/v1/get-favorites';
  static const String removeFromWishList = 'custom-api/v1/remove-from-favorites';
  static const String consumerKey='cs_74925ff431ca8d29b7aa45d66d0aa7ebb334dbdc';
  static const String secretKey='ck_65f3c8c1444e58478083591b23622f44144e4cfe';
  static const order="wc/v3/orders";
  static const search="wc/v3/products";
}