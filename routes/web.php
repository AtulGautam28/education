<?php
use App\Http\Controllers\Admin\SegmentsController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ContactController;

use App\Http\Controllers\Auth\RegisterController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\ForgotPasswordController;

use App\Http\Controllers\Admin\Auth\AdminLoginController;
use App\Http\Controllers\Admin\Auth\AdminForgotPasswordController;
use App\Http\Controllers\Admin\AdminDashboardController;

use App\Http\Controllers\Admin\ProfileController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\ConditionPrivacyController;
use App\Http\Controllers\Admin\DayController;
use App\Http\Controllers\Admin\PaymentAccountController;
use App\Http\Controllers\Admin\SettingsController;
use App\Http\Controllers\Admin\SubscriberController;
use App\Http\Controllers\Admin\AdminOrderController;
use App\Http\Controllers\Admin\AdminToturialController;
use App\Http\Controllers\Admin\AdminTextFormateController;
use App\Http\Controllers\Admin\TextController;
use App\Http\Controllers\Admin\ValidationTextController;
use App\Http\Controllers\Admin\BlogCategoryController;
use App\Http\Controllers\Admin\BlogController;
use App\Http\Controllers\Admin\AboutController;
use App\Http\Controllers\Admin\AboutSectionController;
use App\Http\Controllers\Admin\ContactInformationController;
use App\Http\Controllers\Admin\ContactUsController;
use App\Http\Controllers\Admin\HomeSectionController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\TestimonialController;
use App\Http\Controllers\Admin\PartnerController;
use App\Http\Controllers\Admin\ListingReviewController;
use App\Http\Controllers\Admin\BlogCommentController;

use App\Http\Controllers\Admin\PracticeController;

use App\Http\Controllers\Admin\SeoTextController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\BannerImageController;
use App\Http\Controllers\Admin\StaffController;
use App\Http\Controllers\Admin\CustomPageController;
use App\Http\Controllers\Admin\PaginatorController;
use App\Http\Controllers\Admin\EmailConfigurationController;
use App\Http\Controllers\Admin\CountryController;
use App\Http\Controllers\Admin\CountryStateController;
use App\Http\Controllers\Admin\CityController;
use App\Http\Controllers\Admin\PropertyPurposeController;
use App\Http\Controllers\Admin\PropertyTypeController;
use App\Http\Controllers\Admin\PackageController;
use App\Http\Controllers\Admin\AminityController;
use App\Http\Controllers\Admin\NearestLocationController;
use App\Http\Controllers\Admin\AdminPropertyController;
use App\Http\Controllers\Admin\FaqController;
use App\Http\Controllers\Admin\ServiceController;
use App\Http\Controllers\Admin\OverviewController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\FileManagerController;
use App\Http\Controllers\Admin\AdminLanguageController;

use Illuminate\Support\Facades\Route;

// Route::get('/',function(){
//     return view('layouts.user.index');
// });
Route::get('/',[AdminDashboardController::class,'index'])->name('dashboard');

Route::get('/home',[HomeController::class,'index'])->name('home');
Route::get('/about-us',[HomeController::class,'aboutUs'])->name('about.us');
Route::get('/blog',[HomeController::class,'blog'])->name('blog');
Route::get('/blog-details/{slug}',[HomeController::class,'blogDetails'])->name('blog.details');
Route::get('/blog-category/{slug}',[HomeController::class,'blogCategory'])->name('blog.category');
Route::get('/blog-search',[HomeController::class,'blogSearch'])->name('blog.search');
Route::post('/blog-comment/{id}',[HomeController::class,'blogComment'])->name('blog.comment');
Route::get('/faq',[HomeController::class,'faq'])->name('faq');
Route::get('/contact-us',[HomeController::class,'contactUs'])->name('contact.us');
Route::post('contact-message',[ContactController::class,'sendMessage'])->name('contact.message');
Route::get('terms-and-conditions',[HomeController::class,'termsCondition'])->name('terms-and-conditions');
Route::get('privacy-policy',[HomeController::class,'privacyPolicy'])->name('privacy-policy');
Route::get('subscribe-us',[HomeController::class,'subscribeUs'])->name('subscribe-us');
Route::get('subscription-verify/{token}',[HomeController::class,'subscriptionVerify'])->name('subscription.verify');
Route::get('page/{slug}',[HomeController::class,'customPage'])->name('custom.page');
Route::get('agents',[HomeController::class,'agent'])->name('agents');
Route::get('agent',[HomeController::class,'agentDetails'])->name('agent.show');


Route::get('/pricing-plan',[HomeController::class,'pricingPlan'])->name('pricing.plan');
Route::get('/properties',[HomeController::class,'properties'])->name('properties');
Route::get('/property/{slug}',[HomeController::class,'propertDetails'])->name('property.details');
Route::get('search-property',[HomeController::class,'searchPropertyPage'])->name('search-property');

Route::post('user-contact-message',[ContactController::class,'messageForUser'])->name('user.contact.message');

Route::get('/download-listing-file/{file}',[HomeController::class,'downloadListingFile'])->name('download-listing-file');


// user custom auth route
Route::get('register',[RegisterController::class,'userRegisterPage'])->name('register');
Route::post('register',[RegisterController::class,'storeRegister'])->name('register');
Route::get('user-verify/{token}',[RegisterController::class,'userVerify'])->name('user.verify');
Route::get('login',[LoginController::class,'userLoginPage'])->name('login');
Route::post('login',[LoginController::class,'storeLogin'])->name('login');
Route::get('logout',[LoginController::class,'userLogout'])->name('logout');
Route::get('forget-password',[ForgotPasswordController::class,'forgetPassForm'])->name('forget.password');
Route::post('send-forget-password',[ForgotPasswordController::class,'sendForgetEmail'])->name('send.forget.password');
Route::get('reset-password/{token}',[ForgotPasswordController::class,'resetPassword'])->name('reset.password');
Route::post('store-reset-password/{token}',[ForgotPasswordController::class,'storeResetData'])->name('store.reset.password');


// Route::group(['as'=> 'user.', 'prefix' => 'user'],function (){

// Route::get('dashboard',[AdminDashboardController::class,'index'])->name('dashboard');
// })
// admin routes

Route::group(['as'=> 'admin.', 'prefix' => 'admin'],function (){
    // login route
    Route::get('/',[AdminLoginController::class,'adminLoginForm'])->name('login');
    Route::get('login',[AdminLoginController::class,'adminLoginForm'])->name('login');
    Route::post('login',[AdminLoginController::class,'storeLoginInfo'])->name('login');
    Route::get('/logout',[AdminLoginController::class,'adminLogout'])->name('logout');
    Route::get('forget-password',[AdminForgotPasswordController::class,'forgetPassword'])->name('forget.password');
    Route::post('send-forget-password',[AdminForgotPasswordController::class,'sendForgetEmail'])->name('send.forget.password');
    Route::get('reset-password/{token}',[AdminForgotPasswordController::class,'resetPassword'])->name('reset.password');
    Route::post('store-reset-password/{token}',[AdminForgotPasswordController::class,'storeResetData'])->name('store.reset.password');

    // manage admin profile
    Route::get('profile',[ProfileController::class,'profile'])->name('profile');
    Route::post('update-profile',[ProfileController::class,'updateProfile'])->name('update.profile');

    //  admin
    Route::resource('admin-list',AdminController::class);
    Route::get('admin-status/{id}', [AdminController::class,'changeStatus'])->name('admin.status');


    // Terms-condition and privacy-policy
    Route::resource('terms-conditions', ConditionPrivacyController::class);
    Route::get('privacy-policy',[ConditionPrivacyController::class, 'privacyPolicy'])->name('privacy-policy');
    Route::post('update-privacy-policy',[ConditionPrivacyController::class, 'updatePrivacy'])->name('update-privacy-policy');

    // manage day
    Route::resource('day',DayController::class);

    // payment Account information
    Route::resource('payment-account',PaymentAccountController::class);
    Route::post('razorpay-update/{id}',[PaymentAccountController::class,'razorpayUpdate'])->name('razorpay-update');
    Route::post('stripe-update/{id}',[PaymentAccountController::class,'stripeUpdate'])->name('stripe-update');
    Route::post('bank-update/{id}',[PaymentAccountController::class,'bankUpdate'])->name('bank-update');
    Route::post('flutterwave-update/{id}',[PaymentAccountController::class,'flutterwaveUpdate'])->name('flutterwave-update');
    Route::post('paystack-update/{id}',[PaymentAccountController::class,'paystackUpdate'])->name('paystack-update');
    Route::post('mollie-update/{id}',[PaymentAccountController::class,'updateMollie'])->name('mollie-update');
    Route::post('instamojo-update/{id}',[PaymentAccountController::class,'updateInstamojo'])->name('instamojo-update');

    // language start
   
    Route::get('language-setting',[AdminLanguageController::class,'index'])->name('language.setting');
    Route::get('language-create',[AdminLanguageController::class,'create'])->name('language-create');
    Route::get('language-delete/{id}',[AdminLanguageController::class,'destroy'])->name('language-delete');
    Route::get('language-edit/{id}',[AdminLanguageController::class,'edit'])->name('language-edit');
    Route::post('language-update/{id}',[AdminLanguageController::class,'update'])->name('language-update');
    Route::post('language-store',[AdminLanguageController::class,'store'])->name('language-store');


    //Language end
    // setting start
    Route::resource('settings',SettingsController::class);
    Route::get('comment-setting',[SettingsController::class,'blogCommentSetting'])->name('comment.setting');
    Route::get('serverkey-setting',[SettingsController::class,'serverkeySetting'])->name('serverkey.setting');
    Route::post('update-comment-setting',[SettingsController::class,'updateCommentSetting'])->name('update.comment.setting');
    Route::post('update-serverkey-setting',[SettingsController::class,'updateserverkeySetting'])->name('update.serverkey.setting');
    Route::get('cookie-consent-setting',[SettingsController::class,'cookieConsentSetting'])->name('cookie.consent.setting');
    Route::post('update-cookie-consent',[SettingsController::class,'updateCookieConsentSetting'])->name('update.cookie.consent.setting');
    Route::get('captcha-setting',[SettingsController::class,'captchaSetting'])->name('captcha.setting');
    Route::post('update-captcha-setting',[SettingsController::class,'updateCaptchaSetting'])->name('update.captcha.setting');

    Route::get('livechat-setting',[SettingsController::class,'livechatSetting'])->name('livechat.setting');
    Route::post('update-livechat-setting',[SettingsController::class,'updateLivechatSetting'])->name('update.livechat.setting');

    Route::get('preloader-setting',[SettingsController::class,'preloaderSetting'])->name('preloader.setting');
    Route::post('preloader-update/{id}',[SettingsController::class,'preloaderUpdate'])->name('preloader.update');

    Route::get('google-analytic-setting',[SettingsController::class,'googleAnalytic'])->name('google.analytic.setting');
    Route::post('google-analytic-update',[SettingsController::class,'googleAnalyticUpdate'])->name('google.analytic.update');



    Route::get('email-template',[SettingsController::class,'emailTemplate'])->name('email.template');
    Route::get('email-template-edit/{id}',[SettingsController::class,'editEmail'])->name('email-edit');
    Route::post('email-template-update/{id}',[SettingsController::class,'updateEmail'])->name('email.update');

    // clear database
    Route::get('clear-database',[SettingsController::class,'clearDatabase'])->name('clear.database');
    Route::get('clear-all',[SettingsController::class,'destroyDatabase'])->name('clear.all.data');


    Route::get('theme-color',[SettingsController::class,'themeColor'])->name('theme-color');
    Route::post('theme-color.update',[SettingsController::class,'themeColorUpdate'])->name('theme-color.update');


     // setting end


    // subscriber
    Route::get('subscriber',[SubscriberController::class,'index'])->name('subscriber');
    Route::get('subscriber-delete/{id}',[SubscriberController::class,'delete'])->name('subscriber.delete');
    Route::get('subscriber-email',[SubscriberController::class,'emailTemplate'])->name('subscriber.email');
    Route::post('send-subscriber-email',[SubscriberController::class,'sendMail'])->name('send.subscriber.mail');


    // check notification
    Route::get('view-order-notify',[AdminOrderController::class,'viewOrderNotify'])->name('view.order.notify');
    Route::get('view-message-notify',[AdminOrderController::class,'viewMessageNotify'])->name('view.message.notify');

    Route::get('setup-text',[TextController::class,'index'])->name('setup.text');
    Route::post('update-text',[TextController::class,'update'])->name('update.text');

    Route::get('validation-errors',[ValidationTextController::class,'index'])->name('validation.errors');
    Route::post('update-validation-text',[ValidationTextController::class,'update'])->name('update.validation.text');

    Route::get('notification-text',[ValidationTextController::class,'notification'])->name('notification.text');
    Route::post('update-notification-text',[ValidationTextController::class,'updateNotification'])->name('update.notification.text');

     //admin Dashboard
     Route::get('dashboard',[AdminDashboardController::class,'index'])->name('dashboard');

     // manage blog category
    Route::resource('blog-category', BlogCategoryController::class);
    Route::get('blog-category-status/{id}',[BlogCategoryController::class,'changeStatus'])->name('blog.category.status');

    // blog
    Route::resource('blog', BlogController::class);
    Route::get('blog-status/{id}',[BlogController::class,'changeStatus'])->name('blog.status');

    // Blog comment
    Route::get('blog-comment',[BlogCommentController::class,'allComments'])->name('blog-comment');
    Route::get('delete-blog-comment/{id}',[BlogCommentController::class,'deleteComment'])->name('delete.blog.comment');
    Route::get('blog-comment-status/{id}',[BlogCommentController::class,'changeStatus'])->name('blog.comment.status');

    // about
    Route::resource('about', AboutController::class);
    Route::resource('about-section', AboutSectionController::class);
    Route::post('section-about.update/{id}', [AboutSectionController::class,'sectionAboutUpdate'])->name('section-about.update');
    Route::post('section-feature.update/{id}', [AboutSectionController::class,'sectionFeatureUpdate'])->name('section-feature.update');


    // contact info
    Route::resource('contact-information',ContactInformationController::class);
    Route::post('topbar-contact/{id}',[ContactInformationController::class,'topbarContact'])->name('topbar.contact');
    Route::post('footer-contact/{id}',[ContactInformationController::class,'footerContact'])->name('footer.contact');
    Route::post('social-link/{id}',[ContactInformationController::class,'socialLink'])->name('social.link');
    Route::get('contact-message',[ContactUsController::class,'message'])->name('contact.message');
    Route::get('delete-contact-message/{id}',[ContactUsController::class,'destroyMessage'])->name('delete-contact-message');

    // home section
    Route::resource('home-section', HomeSectionController::class);
    Route::post('banner-in-homepage/{id}', [HomeSectionController::class,'updateBannerSection'])->name('banner-in-homepage');
    Route::post('feature-in-homepage/{id}', [HomeSectionController::class,'updateFeatureSection'])->name('feature-in-homepage');
    Route::post('overview-in-homepage/{id}', [HomeSectionController::class,'updateOverviewSection'])->name('overview-in-homepage');
    Route::post('banner-award-in-homepage/{id}', [HomeSectionController::class,'updateBannerCategorySection'])->name('banner-award-in-homepage');


    Route::get('home-section-status/{id}',[HomeSectionController::class,'changeStatus'])->name('home.section.status');

    Route::resource('slider', SliderController::class);
    Route::get('slider-status/{id}',[SliderController::class,'changeStatus'])->name('slider.status');


    // manage testimonial and status
    Route::resource('testimonial', TestimonialController::class);
    Route::get('testimonial-status/{id}',[TestimonialController::class,'changeStatus'])->name('testimonial.status');

    // manage partner
    Route::resource('partner', PartnerController::class);
    Route::get('partner-status/{id}', [PartnerController::class,'changeStatus'])->name('partner.status');



    Route::get('property-review',[ListingReviewController::class,'index'])->name('listing-review');
    Route::get('review-delete/{id}',[ListingReviewController::class,'destroy'])->name('review.delete');
    Route::get('review-status/{id}',[ListingReviewController::class,'changeStatus'])->name('review-status');


    // manage seo
    Route::get('home-page-seo/{id}',[SeoTextController::class,'index'])->name('home-seo-setup');
    Route::get('property-seo-setup/{id}',[SeoTextController::class,'index'])->name('property-seo-setup');
    Route::get('about-us-seo-setup/{id}',[SeoTextController::class,'index'])->name('about-us-seo-setup');
    Route::get('pricing-seo-setup/{id}',[SeoTextController::class,'index'])->name('pricing-seo-setup');
    Route::get('our-agent-seo-setup/{id}',[SeoTextController::class,'index'])->name('our-agent-seo-setup');
    Route::get('blog-seo-setup/{id}',[SeoTextController::class,'index'])->name('blog-seo-setup');
    Route::get('contact-us-seo-setup/{id}',[SeoTextController::class,'index'])->name('contact-us-seo-setup');
    Route::get('faq-seo-setup/{id}',[SeoTextController::class,'index'])->name('faq-seo-setup');
    Route::post('update-seo/{id}',[SeoTextController::class,'update'])->name('update-seo');



    // manage mene section
    Route::get('menu-section',[MenuController::class,'index'])->name('menu-section');
    Route::post('menu-update',[MenuController::class,'update'])->name('menu-update');
    Route::get('menu-status/{id}',[MenuController::class,'changeStatus'])->name('menu-status');


     // manage banner image
    Route::get('banner-image',[BannerImageController::class,'bannerImage'])->name('banner.image');
    Route::post('update-image/{id}',[BannerImageController::class,'BannerUpdate'])->name('update-image');
    Route::get('login-image',[BannerImageController::class,'LoginImage'])->name('login.image');
    Route::post('update-login-image/{id}',[BannerImageController::class,'updateLogin'])->name('update-login-image');
    Route::get('profile-image',[BannerImageController::class,'profileImageIndex'])->name('profile.image');
    Route::post('update-profile-image/{id}',[BannerImageController::class,'updateProfileImage'])->name('update-profile-image');
    Route::get('bg-image',[BannerImageController::class,'bgIndex'])->name('bg.image');
    Route::post('update-bg-image/{id}',[BannerImageController::class,'updateBg'])->name('update-bg-image');

    Route::get('staff',[StaffController::class,'index'])->name('staff');
    Route::get('create-staff/',[StaffController::class,'create'])->name('create-staff');
    Route::post('store-staff/',[StaffController::class,'store'])->name('store-staff');
    Route::get('delete-staff/{id}',[StaffController::class,'destroy'])->name('delete-staff');
    Route::get('staff-status/{id}',[StaffController::class,'changeStatus'])->name('staff.status');


    // custome page
    Route::resource('custom-page',CustomPageController::class);
    Route::get('custom-page-status/{id}', [CustomPageController::class,'changeStatus'])->name('custom.page.status');

    Route::get('paginator',[PaginatorController::class,'index'])->name('paginator');
    Route::post('paginator-update',[PaginatorController::class,'update'])->name('paginator.update');


    Route::get('email-configuration',[EmailConfigurationController::class,'index'])->name('email-configuration');
    Route::post('update-email-configuraion',[EmailConfigurationController::class,'update'])->name('update-email-configuraion');


    Route::resource('file-manager', FileManagerController::class);


    // country , state, city route
    Route::resource('country',CountryController::class);
    Route::get('country-status/{id}',[CountryController::class,'changeStatus'])->name('country.status');
    Route::resource('country-state',CountryStateController::class);
    Route::get('country-state-status/{id}',[CountryStateController::class,'changeStatus'])->name('city.status');
    Route::resource('city',CityController::class);
    Route::get('city-status/{id}',[CityController::class,'changeStatus'])->name('city.status');

    // Real estate property purpose, aminities,type
    Route::resource('property-purpose',PropertyPurposeController::class);
    Route::get('property-purpose-status/{id}',[PropertyPurposeController::class,'changeStatus'])->name('property-purpose.status');
    Route::resource('property-type',PropertyTypeController::class);
    Route::get('property-type-status/{id}', [PropertyTypeController::class,'changeStatus'])->name('property.type.status');
    Route::resource('nearest-location',NearestLocationController::class);
    Route::get('nearest-location-status/{id}', [NearestLocationController::class,'changeStatus'])->name('nearest-location.status');

    Route::resource('package',PackageController::class);
    Route::get('package-status/{id}',[PackageController::class,'changeStatus'])->name('package.status');

    Route::resource('aminity', AminityController::class);
    Route::get('aminity-status/{id}',[AminityController::class,'changeStatus'])->name('aminity.status');
    Route::resource('property',AdminPropertyController::class);
    Route::get('agent-property',[AdminPropertyController::class,'agentProperty'])->name('agent-property');

    Route::get('property-status/{id}', [AdminPropertyController::class,'changeStatus'])->name('property.status');
    Route::get('property-slider-img/{id}',[AdminPropertyController::class,'propertySliderImage'])->name('property-slider-img');
    Route::get('property-delete-pdf/{id}',[AdminPropertyController::class,'deletePdfFile'])->name('property-delete-pdf');
    Route::get('exist-nearest-location/{id}',[AdminPropertyController::class,'existNearestLocation'])->name('exist-nearest-location');

    Route::resource('faq',FaqController::class);
    Route::get('faq-status/{id}', [FaqController::class,'changeStatus'])->name('faq.status');
    Route::post('faq-image', [FaqController::class,'faqImage'])->name('faq-image');
    Route::resource('service',ServiceController::class);
    Route::get('service-status/{id}', [ServiceController::class,'changeStatus'])->name('service.status');
    Route::post('service-image', [ServiceController::class,'serviceBgImage'])->name('service-image');
    Route::resource('overview',OverviewController::class);
    Route::get('overview-status/{id}', [OverviewController::class,'changeStatus'])->name('overview.status');

    Route::get('agents',[UserController::class,'index'])->name('agents');
    Route::get('agents-show/{id}',[UserController::class,'show'])->name('agents.show');
    Route::get('agents-status/{id}',[UserController::class,'changeStatus'])->name('agents.status');
    Route::get('agents-delete/{id}',[UserController::class,'destroy'])->name('agents.delete');

    Route::get('order',[AdminOrderController::class,'index'])->name('order');
    Route::get('pending-order',[AdminOrderController::class,'pendingOrder'])->name('pending-order');
    Route::get('pending-payment/{id}',[AdminOrderController::class,'pendingPayment'])->name('pending-payment');
    Route::get('payment-accept/{id}',[AdminOrderController::class,'paymentAccept'])->name('payment-accept');
    Route::get('order-show/{id}',[AdminOrderController::class,'show'])->name('order-show');
    Route::get('order-delete/{id}',[AdminOrderController::class,'destroy'])->name('order-delete');
    Route::get('toturial',[AdminToturialController::class,'index'])->name('toturial');
    Route::get('toturial-create',[AdminToturialController::class,'create'])->name('toturial-create');
    Route::get('tutorial-delete/{id}',[AdminToturialController::class,'destroy'])->name('tutorial-delete');
    Route::get('tutorial-edit/{id}',[AdminToturialController::class,'edit'])->name('tutorial-edit');
    Route::post('toturial-update/{id}',[AdminToturialController::class,'update'])->name('toturial-update');
    Route::post('toturial-store',[AdminToturialController::class,'store'])->name('toturial-store');

    Route::get('textformate',[AdminTextFormateController::class,'index'])->name('textformate');
    Route::get('textformate-create',[AdminTextFormateController::class,'create'])->name('textformate-create');
    Route::get('textformate-delete/{id}',[AdminTextFormateController::class,'destroy'])->name('textformate-delete');
    Route::get('textformate-edit/{id}',[AdminTextFormateController::class,'edit'])->name('textformate-edit');
    Route::post('textformate-update/{id}',[AdminTextFormateController::class,'update'])->name('textformate-update');
    Route::post('textformate-store',[AdminTextFormateController::class,'store'])->name('textformate-store');

    // Practice Dialogue
    // Route::resource('practice',PracticeController::class);
    Route::get('practice',[PracticeController::class,'index'])->name('practice');
    Route::post('store-practice',[PracticeController::class,'store'])->name('store.practice');
    Route::post('practice-update/{id}',[PracticeController::class,'update'])->name('practice.update');
    Route::get('practice-delete/{id}',[PracticeController::class,'destroy'])->name('practice.delete');

    // Segments
    // Route::resource('practice',PracticeController::class);
    Route::get('segments',[SegmentsController::class,'index'])->name('segments');
    Route::post('store-segments',[SegmentsController::class,'store'])->name('store.segments');
    Route::post('segments-update/{id}',[SegmentsController::class,'update'])->name('segments.update');
    Route::get('segments-delete/{id}',[SegmentsController::class,'destroy'])->name('segments.delete');
    Route::get('segments-status/{id}', [SegmentsController::class,'changeStatus'])->name('segments.status');
    
    Route::get('practice-filter/{id}',[SegmentsController::class,'practice_filter'])->name('practice.filter');
});

