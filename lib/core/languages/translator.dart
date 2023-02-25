import 'package:get/get_navigation/src/root/internacionalization.dart';

class Translator extends Translations{
  static const app_name = 'app_name';
  static const splash_text1 = 'splash_text1';
  static const splash_text2 = 'splash_text2';
  static const welcome = 'welcome';
  static const email = 'email';
  static const userOrEmail = 'user_or_email';
  static const password = 'password';
  static const confirm_password = 'confirm_password';
  static const forget_password = 'forget_password';
  static const login = 'login';
  static const dont_have_accounte = 'dont_have_account';
  static const have_accounte = 'have_account';
  static const signup = 'sign_in';
  static const username = 'username';
  static const password_recovery = 'password_recovery';
  static const send_password_recover_request = 'send_password_recover_request';
  static const email_example = 'email_example';
  static const recovery_link_send = 'recovery_link_send';
  static const recovery_text = 'recovery_text';
  static const understand = 'understand';
  static const confirm_and_change_password = 'confirm_and_change_password';
  static const profile = 'profile';
  static const blog = 'blog';
  static const myCourses = 'myCourses';
  static const home = 'home';
  static const lastActiveCourse = 'last_active_course';
  static const session = 'session';
  static const lastSeen = 'last_seen';
  static const generalYogaCourses = 'general_yoga_courses';
  static const miniYogaCourses = 'mini_yoga_courses';
  static const seeAll = 'see_all';
  static const mentor = 'mentor';
  static const toman = 'toman';
  static const favoriteCourses = 'favorite_course';
  static const purchasedCourses = 'purchased_courses';
  static const continueCourse = 'continueCourse';
  static const buyCourse = 'buy_course';
  static const yogaMovements = 'yoga_movements';
  static const articles = 'articles';



  /*static const app_name = 'app_name';
  static const app_name = 'app_name';*/
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
    'fa_IR':{
      yogaMovements: 'حرکات یوگا',
      articles: 'مقالات',
      buyCourse: 'خرید دوره',
      continueCourse: 'ادامه دوره',
      favoriteCourses: 'دوره های مورد علاقه',
      purchasedCourses: 'دوره های خریداری شده',
      miniYogaCourses: 'مینی دوره ها',
      toman: 'تومان',
      mentor: 'مربی',
      seeAll:'مشاهده همه',
      lastSeen:'آخرین بازدید',
      session:'جلسه',
      lastActiveCourse: 'آخرین دوره فعال',
      generalYogaCourses:'دوره‌های جامع یوگا',
      myCourses:'دوره‌های من',
      app_name:'رهیـــــوگا',
      splash_text1:'جمله الهام بخش',
      splash_text2:'به آرامی نفس بکشید',
      welcome:'به رهیوگا خوش آمدید!',
      email:'ایمیل',
      password:'رمزعبور',
      confirm_password: 'تکرار رمز عبور',
      forget_password:'رمز عبور خود را فراموش کرده ام',
      login:'ورود',
      dont_have_accounte:'هنوز عضو نشده اید؟',
      have_accounte:'ثبت نام کرده ام',
      signup:'ثبت نام',
      username:'نام کاربری',
      password_recovery:'بازیابی رمر عبور',
      send_password_recover_request: 'ارسال درخواست',
      email_example:'example@example.com',
      recovery_link_send:'لینک بازیابی ارسال شد!',
      understand:'متوجه شدم',
      recovery_text:'لینک بازیابی به ایمیل @email ارسال شد. لطفا با کلیک روی لینک اقدام به بازیابی رمز خود فرمایید!',
      confirm_and_change_password:'تایید و تغیر رمزعبور',
      home:'خانه',
      blog: 'بلاگ',
      myCourses:'دوره های من',
      profile:'پروفایل',
      userOrEmail:'نام کاربری یا ایمیل',
    },
    'en_US':{
      articles: 'articles',
      yogaMovements: 'yoga movements',
      buyCourse: 'buy course',
      continueCourse: 'continue course',
      purchasedCourses: 'purchased courses',
      favoriteCourses: 'favorite courses',
      miniYogaCourses: 'mini_yoga_courses',
      toman: 'toman',
      mentor: 'mentor',
      seeAll:'see all',
      generalYogaCourses:'general yoga courses',
      lastSeen:'last seen',
      session:'session',
      myCourses:'my courses',
      lastActiveCourse: 'last active course',
      app_name:'Rahyoga',
      splash_text1:'positive sentence',
      splash_text2:'breath slowly',
      welcome:'welcome to Rahyoga',
      email:'email',
      password:'password',
      confirm_password: 'confirm password',
      forget_password:'forget_password',
      login:'login',
      dont_have_accounte:"Don't have an account?",
      have_accounte:'I have account.',
      signup:'signup',
      username:'username',
      password_recovery:'password recovery',
      send_password_recover_request: 'send request',
      email_example:'example@example.com',
      recovery_link_send:'recovery link sent!',
      understand:'understand',
      recovery_text:'The recovery link was sent to @email. Please click on the link to recover your password!',
      confirm_and_change_password:'confirm and change password',
      home:'home',
      blog: 'blog',
      myCourses: 'my courses',
      profile: 'profile',
      userOrEmail:'username or email',

    }
  };
}