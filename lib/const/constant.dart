import 'package:woocom/utils/app_icon_utils.dart';

final List<String> imgList = [
  //7383146174 dipak bhai
  // AppIcon.bannerWatch1,
  AppIcon.bannerWatch2,
  AppIcon.bannerSamsung1,
  AppIcon.bannerSamsung2,
  AppIcon.bannerSamsung3,
  AppIcon.bannerSamsung4,
  AppIcon.bannerSamsung5,
  AppIcon.bannerSamsung6,
  AppIcon.bannerSamsung7,
  AppIcon.bannerMacbook1,
  AppIcon.bannerMacbook2,
  // AppIcon.bannerMacbook3,
  AppIcon.bannerMacbook4,
  AppIcon.bannerIphone1,
  // AppIcon.bannerIphone2,
  AppIcon.bannerIphone3,
  AppIcon.bannerIphone4,
  AppIcon.bannerBag1,
  AppIcon.bannerBag2,
  // AppIcon.bannerBag3,
  // AppIcon.bannerBag4,
  // AppIcon.bannerBag5,
  // AppIcon.bannerBox1,
  // AppIcon.bannerBox2,
  // AppIcon.bannerBox3,
  // AppIcon.bannerBox4,
  // AppIcon.bannerBox5,
];

final List<String> kitForYouList = [
  //7383146174 dipak bhai

  AppIcon.bannerIphoneRed1,
  AppIcon.bannerIphoneRed2,
  AppIcon.bannerIphoneRed3,
  AppIcon.bannerIphoneRed4,
  AppIcon.bannerIphoneRed5,
];

List data = [
  ["Wrist Pro Watch", AppIcon.bagImg1],
  ["Pro Bag", AppIcon.watch],
  ["Wrist Bag", AppIcon.shoes],
  ["Office Bag", AppIcon.fabrics],
  ["Travelling Bag", AppIcon.bagImg2],
  ["Party Bag", AppIcon.watch],
  ["Wrist Pro Watch", AppIcon.shoes],
  ["Pro Bag", AppIcon.fabrics],
  ["Wrist Bag", AppIcon.bagImg3],
  ["Office Bag", AppIcon.watch],
  ["Travelling Bag", AppIcon.shoes],
  ["Party Bag", AppIcon.fabrics]
];

List storeData = [
  ["Bags", AppIcon.bagImg1],
  ["Watches", AppIcon.watch],
  ["Shoes", AppIcon.shoes],
  ["Fabrics", AppIcon.fabrics],
  ["Bags", AppIcon.bagImg2],
  ["Watches", AppIcon.watch],
  ["Shoes", AppIcon.shoes],
  ["Fabrics", AppIcon.fabrics],
  ["Bags", AppIcon.bagImg3],
  ["Watches", AppIcon.watch],
  ["Shoes", AppIcon.shoes],
  ["Fabrics", AppIcon.fabrics]
];

List productDetailData = [
  AppIcon.bagImg6,
  AppIcon.bagImg1,
  AppIcon.bagImg2,
  AppIcon.bagImg3,
  AppIcon.bagImg4,
  AppIcon.bagImg5,
  AppIcon.bagImg6,
];
List sizeData = ["M", "S", "XS", "L", "XL"];

List colorData = ["FF39c526", "FF5780D9", "FFFFC400", "FFF71C3A", "FFA98666"];

List filterTypeData = [
  "All",
  "Ladies",
  "Mens",
  "All",
  "Watches",
  "All",
  "Ladies",
  "Mens",
  "All",
  "Watches"
];

List filterColorData = [
  "FF39c526",
  "FF5780D9",
  "FFFFC400",
  "FFF71C3A",
  "FFA98666",
  "FF39c526",
  "FF5780D9",
  "FFFFC400",
  "FFF71C3A",
  "FFA98666",
  "FF39c526",
  "FF5780D9",
  "FFFFC400",
  "FFF71C3A",
  "FFA98666"
];

List languageList = [
  "English",
  "Germany",
  "French",
  "Indian",
  "Arabic",
  "Indonesian",
  "Spanish",
  "Hindi",
  "Telugu",
  "Gujarati",
  "Russian"
];

//TODO: Const  Variable

// Manage Search Icon and Search TextField
var tapSearchIcon = false;

// Manage Filter Icon and Show DialogBox
var tapFilterIcon = false;

// Show Search Icon / Hide TextField
void setTrueSearch() {
  tapSearchIcon = true;
}

// Show TextField / Hide Search Icon
void setFalseSearch() {
  tapSearchIcon = false;
}

// Show Dialog
void setTrueFilter() {
  tapFilterIcon = true;
}

// Hide Dialog
void setFalseFilter() {
  tapFilterIcon = false;
}

// TODO: PREFERENCE KEY

// TODO: User Preference DATA KEY
// User Detail Key
String kUserIMAGE = "kUserIMAGE";
String kUserNAME = "kUserNAME";
String kUserMAIL = "kUserMAIL";
String kUserID = "kUserID";
// User Account Type Key
String kUserLoginType = "kUserType";
String kUserLoginTypeFB = "kUserLoginTypeFB";
String kUserLoginTypeGoogle = "kUserLoginTypeGoogle";
//User Check Login or Not
String kIsLogin = "IsLogin";
String kLoginTrue = "true";
String kLoginFalse = "false";

//TODO: API Related Variable
// API Key for Google Places
String kGoogleApiKey = "AIzaSyDQ3kZOmhYxz1LPyYaY3VnoGLl9dve4064";

//Token
String token = "";

// Check Status for API
String statusSuccess = "Success";
String statusFail = "false";

//Service API
String apiBaseUrl = "http://68.183.86.2/woocommerce-api/wp-json";
String socialRegister = "/wordpress-api/user/SocialRegister";
String socialLogin = "/wordpress-api/user/SocialLogin";
String mainCategory = "/wordpress-api/user/GetHomeCategories";
String categoryWiseProductDetail = "/wordpress-api/user/GetHomePopularProducts";
String searchProduct = "/wordpress-api/user/HomeSearchProducts/";
