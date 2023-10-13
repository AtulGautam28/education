<?php
use App\Http\Controllers\Auth\Api;
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

Route::post('login',[Api::class,'storeLogin'])->name('login');
Route::post('register',[Api::class,'storeRegister'])->name('register');

Route::post('property',[Api::class,'getUserProperties'])->name('property');
Route::post('propertDetails',[Api::class,'propertDetails'])->name('propertDetails');
Route::post('profile',[Api::class,'profile'])->name('profile');
Route::post('updateProfile',[Api::class,'updateProfile'])->name('updateProfile');

Route::post('propertyStore',[Api::class,'store'])->name('propertyStore');
Route::post('updateProperty',[Api::class,'updateProperty'])->name('updateProperty');
Route::post('propertyDestroy',[Api::class,'propertyDestroy'])->name('propertyDestroy');

Route::post('getwishlist',[Api::class,'getwishlist'])->name('getwishlist');
Route::post('addtowishlist',[Api::class,'addtowishlist'])->name('addtowishlist');
Route::post('deleteWishlist',[Api::class,'deleteWishlist'])->name('deleteWishlist');

Route::get('getCity',[Api::class,'getCity'])->name('getCity');
Route::get('getAminities',[Api::class,'getAminities'])->name('getAminities');
Route::get('getNearestLocation',[Api::class,'getNearestLocation'])->name('getNearestLocation');
Route::get('getPropertyTypes',[Api::class,'getPropertyTypes'])->name('getPropertyTypes');
Route::get('getAgent',[Api::class,'getAgent'])->name('getAgent');
Route::get('getPurpose',[Api::class,'getPurpose'])->name('getPurpose');

Route::post('updatePassword',[Api::class,'updatePassword'])->name('updatePassword');

Route::get('contactUs',[Api::class,'contactUs'])->name('contactUs');
Route::get('aboutUs',[Api::class,'aboutUs'])->name('aboutUs');
Route::get('privacyPolicy',[Api::class,'privacyPolicy'])->name('privacyPolicy');
Route::get('termsCondition',[Api::class,'termsCondition'])->name('termsCondition');
Route::get('pricingPlan',[Api::class,'pricingPlan'])->name('pricingPlan');

Route::post('filterProperty',[Api::class,'filterProperty'])->name('filterProperty');
Route::post('activity',[Api::class,'activity'])->name('activity');
Route::post('notification',[Api::class,'notification'])->name('notification');

Route::post('sendForgetEmail',[Api::class,'sendForgetEmail'])->name('sendForgetEmail');

//support and chat request
Route::post('sendRequest',[Api::class,'sendRequest'])->name('sendRequest');
//support and chat request list
Route::post('chatSupportRequest',[Api::class,'chatSupportRequest'])->name('chatSupportRequest');
Route::post('chatSupportRequestUpdate',[Api::class,'chatSupportRequestUpdate'])->name('chatSupportRequestUpdate');

// Chat send and get 
Route::post('getConversations',[Api::class,'getConversations'])->name('getConversations');
Route::post('storeConversations',[Api::class,'storeConversations'])->name('storeConversations');

//Support send and get message
Route::post('supportSendmessage',[Api::class,'supportSendmessage'])->name('supportSendmessage');
Route::post('supportGetmessage',[Api::class,'supportGetmessage'])->name('supportGetmessage');

//Chat user listing
Route::post('getChatUser',[Api::class,'getChatUser'])->name('getChatUser');
Route::post('getMessageId',[Api::class,'getMessageId'])->name('getMessageId');
Route::post('property_status',[Api::class,'property_status'])->name('property_status');

Route::post('agentprofile',[Api::class,'agentprofile'])->name('agentprofile');

Route::get('faq',[Api::class,'faq'])->name('faq');

Route::get('vocabulary_category',[Api::class,'vocabulary_category'])->name('vocabulary_category');
Route::get('vocabulary',[Api::class,'vocabulary'])->name('vocabulary');
//Practice Dialogue
Route::get('practiceDialogue',[Api::class,'practiceDialogue'])->name('practiceDialogue');
//Practice Dialogue Segments
Route::get('segments',[Api::class,'segments'])->name('segments');

// Purchase a Plan
Route::post('stripePayment',[Api::class,'stripePayment'])->name('stripePayment');



