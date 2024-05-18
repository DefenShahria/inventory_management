class Urls {
  static const String baseUrl = 'https://skill-test.retinasoft.com.bd/api/v1';

  static const String signup = '$baseUrl/sign-up/store';
  static const String signupOTP = '$baseUrl/sign-up/verify-otp-code';
  static const String signin = '$baseUrl/send-login-otp?=';
  static const String signinOTP = '$baseUrl/login';
  static const String userInfo = '$baseUrl/admin/profile';
  static const String userinfoUpdate = '$baseUrl/admin/profile/update';
  static const String branchInfo = '$baseUrl/admin/branches';
  static const String branchCreat = '$baseUrl/admin/branch/create';
  static String branchUpdate(String bID) => '$baseUrl/admin/branch/$bID/update';
  static String branchDelet(String bID) => '$baseUrl/admin/branch/$bID/delete';


}