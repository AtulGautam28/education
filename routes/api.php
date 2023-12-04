<?php
use App\Http\Controllers\Auth\Apis;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('login',[Apis::class,'storeLogin'])->name('login');
Route::post('register',[Apis::class,'storeRegister'])->name('register');

Route::post('property',[Apis::class,'getUserProperties'])->name('property');
Route::post('propertDetails',[Apis::class,'propertDetails'])->name('propertDetails');
Route::post('profile',[Apis::class,'profile'])->name('profile');
Route::post('updateProfile',[Apis::class,'updateProfile'])->name('updateProfile');

Route::post('propertyStore',[Apis::class,'store'])->name('propertyStore');
Route::post('updateProperty',[Apis::class,'updateProperty'])->name('updateProperty');
Route::post('propertyDestroy',[Apis::class,'propertyDestroy'])->name('propertyDestroy');

Route::post('getwishlist',[Apis::class,'getwishlist'])->name('getwishlist');
Route::post('addtowishlist',[Apis::class,'addtowishlist'])->name('addtowishlist');
Route::post('deleteWishlist',[Apis::class,'deleteWishlist'])->name('deleteWishlist');

Route::get('getCity',[Apis::class,'getCity'])->name('getCity');
Route::get('getAminities',[Apis::class,'getAminities'])->name('getAminities');
Route::get('getNearestLocation',[Apis::class,'getNearestLocation'])->name('getNearestLocation');
Route::get('getPropertyTypes',[Apis::class,'getPropertyTypes'])->name('getPropertyTypes');
Route::get('getAgent',[Apis::class,'getAgent'])->name('getAgent');
Route::get('getPurpose',[Apis::class,'getPurpose'])->name('getPurpose');

Route::post('updatePassword',[Apis::class,'updatePassword'])->name('updatePassword');

Route::get('contactUs',[Apis::class,'contactUs'])->name('contactUs');
Route::get('aboutUs',[Apis::class,'aboutUs'])->name('aboutUs');
Route::get('privacyPolicy',[Apis::class,'privacyPolicy'])->name('privacyPolicy');
Route::get('termsCondition',[Apis::class,'termsCondition'])->name('termsCondition');
Route::get('pricingPlan',[Apis::class,'pricingPlan'])->name('pricingPlan');

Route::post('filterProperty',[Apis::class,'filterProperty'])->name('filterProperty');
Route::post('activity',[Apis::class,'activity'])->name('activity');
Route::post('notification',[Apis::class,'notification'])->name('notification');

Route::post('sendForgetEmail',[Apis::class,'sendForgetEmail'])->name('sendForgetEmail');

//support and chat request
Route::post('sendRequest',[Apis::class,'sendRequest'])->name('sendRequest');
//support and chat request list
Route::post('chatSupportRequest',[Apis::class,'chatSupportRequest'])->name('chatSupportRequest');
Route::post('chatSupportRequestUpdate',[Apis::class,'chatSupportRequestUpdate'])->name('chatSupportRequestUpdate');

// Chat send and get 
Route::post('getConversations',[Apis::class,'getConversations'])->name('getConversations');
Route::post('storeConversations',[Apis::class,'storeConversations'])->name('storeConversations');

//Support send and get message
Route::post('supportSendmessage',[Apis::class,'supportSendmessage'])->name('supportSendmessage');
Route::post('supportGetmessage',[Apis::class,'supportGetmessage'])->name('supportGetmessage');

//Chat user listing
Route::post('getChatUser',[Apis::class,'getChatUser'])->name('getChatUser');
Route::post('getMessageId',[Apis::class,'getMessageId'])->name('getMessageId');
Route::post('property_status',[Apis::class,'property_status'])->name('property_status');

Route::post('agentprofile',[Apis::class,'agentprofile'])->name('agentprofile');

Route::get('faq',[Apis::class,'faq'])->name('faq');

Route::get('vocabulary_category',[Apis::class,'vocabulary_category'])->name('vocabulary_category');
Route::post('vocabulary',[Apis::class,'vocabulary'])->name('vocabulary');
//Practice Dialogue
Route::post('practiceDialogue',[Apis::class,'practiceDialogue'])->name('practiceDialogue');
//Practice Dialogue Segments
Route::post('segments',[Apis::class,'segments'])->name('segments');

// Purchase a Plan
Route::post('stripePayment',[Apis::class,'stripePayment'])->name('stripePayment');
Route::post('razorPay',[Apis::class,'razorPay'])->name('razorPay');
Route::post('pushNotification',[Apis::class,'pushNotification'])->name('pushNotification');


//Push Notification
Route::post('pushNotification',[Apis::class,'pushNotification'])->name('pushNotification');

//Video Gallery
Route::get('videoGallery',[Apis::class,'videoGallery'])->name('videoGallery');

// Online Message
Route::post('sendMessage',[Apis::class,'sendMessage'])->name('sendMessage');

// Test Formate
Route::get('testFomate',[Apis::class,'testFomate'])->name('testFomate');

// Language
Route::get('language',[Apis::class,'language'])->name('language');

// Favorite
Route::post('addtoFavorite',[Apis::class,'addtoFavorite'])->name('addtoFavorite');
Route::post('deleteFavorite',[Apis::class,'deleteFavorite'])->name('deleteFavorite');
Route::post('getFavorite',[Apis::class,'getFavorite'])->name('getFavorite');

//Filter Vocabulary Category wise
Route::post('filterVocabulary',[Apis::class,'filterVocabulary'])->name('filterVocabulary');

//Plan Purchase History
Route::post('planPurchaseHistory',[Apis::class,'planPurchaseHistory'])->name('planPurchaseHistory');
Route::get('lastMinutesPractice',[Apis::class,'lastMinutesPractice'])->name('lastMinutesPractice');

//Dashboard
Route::post('dashboard',[Apis::class,'dashboard'])->name('dashboard');

//Search Vocabulary 
Route::post('searchVocabulary',[Apis::class,'searchVocabulary'])->name('searchVocabulary');
Route::post('usesVocabulary',[Apis::class,'usesVocabulary'])->name('usesVocabulary');
Route::post('usesPractice',[Apis::class,'usesPractice'])->name('usesPractice');




