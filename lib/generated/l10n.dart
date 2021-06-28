// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Experience`
  String get slide_1_title {
    return Intl.message(
      'Experience',
      name: 'slide_1_title',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to the magic world`
  String get slide_1_desc_1 {
    return Intl.message(
      'Welcome to the magic world',
      name: 'slide_1_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `of Experience`
  String get slide_1_desc_2 {
    return Intl.message(
      'of Experience',
      name: 'slide_1_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `where anything can happen!`
  String get slide_1_desc_3 {
    return Intl.message(
      'where anything can happen!',
      name: 'slide_1_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Come inside!`
  String get slide_2_title {
    return Intl.message(
      'Come inside!',
      name: 'slide_2_title',
      desc: '',
      args: [],
    );
  }

  /// `Here you will find`
  String get slide_2_desc_1 {
    return Intl.message(
      'Here you will find',
      name: 'slide_2_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `fantastic stories`
  String get slide_2_desc_2 {
    return Intl.message(
      'fantastic stories',
      name: 'slide_2_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `and incredible worlds`
  String get slide_2_desc_3 {
    return Intl.message(
      'and incredible worlds',
      name: 'slide_2_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Adventure!`
  String get slide_3_title {
    return Intl.message(
      'Adventure!',
      name: 'slide_3_title',
      desc: '',
      args: [],
    );
  }

  /// `Be part of our stories,`
  String get slide_3_desc_1 {
    return Intl.message(
      'Be part of our stories,',
      name: 'slide_3_desc_1',
      desc: '',
      args: [],
    );
  }

  /// `and prepare to`
  String get slide_3_desc_2 {
    return Intl.message(
      'and prepare to',
      name: 'slide_3_desc_2',
      desc: '',
      args: [],
    );
  }

  /// `face the unknown!`
  String get slide_3_desc_3 {
    return Intl.message(
      'face the unknown!',
      name: 'slide_3_desc_3',
      desc: '',
      args: [],
    );
  }

  /// `Understood`
  String get pg_understood {
    return Intl.message(
      'Understood',
      name: 'pg_understood',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get pg_next {
    return Intl.message(
      'Next',
      name: 'pg_next',
      desc: '',
      args: [],
    );
  }

  /// `Skip to End`
  String get pg_skip {
    return Intl.message(
      'Skip to End',
      name: 'pg_skip',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get sp_screen_w {
    return Intl.message(
      'Welcome',
      name: 'sp_screen_w',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get edit_firstname {
    return Intl.message(
      'First Name',
      name: 'edit_firstname',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get edit_lastname {
    return Intl.message(
      'Last Name',
      name: 'edit_lastname',
      desc: '',
      args: [],
    );
  }

  /// `Birthday`
  String get edit_birthday {
    return Intl.message(
      'Birthday',
      name: 'edit_birthday',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get edit_email {
    return Intl.message(
      'Email',
      name: 'edit_email',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get edit_phone {
    return Intl.message(
      'Phone Number',
      name: 'edit_phone',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get edit_login {
    return Intl.message(
      'Login',
      name: 'edit_login',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get edit_password {
    return Intl.message(
      'Password',
      name: 'edit_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get edit_confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'edit_confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get common_title_confirm {
    return Intl.message(
      'Confirmation',
      name: 'common_title_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get common_title_register {
    return Intl.message(
      'Registration',
      name: 'common_title_register',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your user data`
  String get common_subtitle_confirm {
    return Intl.message(
      'Please confirm your user data',
      name: 'common_subtitle_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Please complete your personal information`
  String get common_subtitle_register {
    return Intl.message(
      'Please complete your personal information',
      name: 'common_subtitle_register',
      desc: '',
      args: [],
    );
  }

  /// `All fields are required`
  String get form_validation_fields {
    return Intl.message(
      'All fields are required',
      name: 'form_validation_fields',
      desc: '',
      args: [],
    );
  }

  /// `The field is required`
  String get form_validation_field_required {
    return Intl.message(
      'The field is required',
      name: 'form_validation_field_required',
      desc: '',
      args: [],
    );
  }

  /// `Please complete the birth details.`
  String get form_validation_birthday_required {
    return Intl.message(
      'Please complete the birth details.',
      name: 'form_validation_birthday_required',
      desc: '',
      args: [],
    );
  }

  /// `The password cannot be empty.`
  String get form_validation_password_empty {
    return Intl.message(
      'The password cannot be empty.',
      name: 'form_validation_password_empty',
      desc: '',
      args: [],
    );
  }

  /// `Passwords are not the same.`
  String get form_validation_password_not_equal {
    return Intl.message(
      'Passwords are not the same.',
      name: 'form_validation_password_not_equal',
      desc: '',
      args: [],
    );
  }

  /// `The password must be at least 8 characters long.`
  String get form_validation_password_length {
    return Intl.message(
      'The password must be at least 8 characters long.',
      name: 'form_validation_password_length',
      desc: '',
      args: [],
    );
  }

  /// `Old password can't be the same as new one.`
  String get form_validation_password_old_equal {
    return Intl.message(
      'Old password can\'t be the same as new one.',
      name: 'form_validation_password_old_equal',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get button_text_confirm {
    return Intl.message(
      'Confirm',
      name: 'button_text_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get button_text_register {
    return Intl.message(
      'Register',
      name: 'button_text_register',
      desc: '',
      args: [],
    );
  }

  /// `Skip to home`
  String get button_text_skip {
    return Intl.message(
      'Skip to home',
      name: 'button_text_skip',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Email`
  String get button_continue_email {
    return Intl.message(
      'Continue with Email',
      name: 'button_continue_email',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get button_continue_google {
    return Intl.message(
      'Continue with Google',
      name: 'button_continue_google',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get button_continue_facebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'button_continue_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe`
  String get button_text_subscribe {
    return Intl.message(
      'Subscribe',
      name: 'button_text_subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Outstanding Experiences`
  String get home_features {
    return Intl.message(
      'Outstanding Experiences',
      name: 'home_features',
      desc: '',
      args: [],
    );
  }

  /// `In our Catalogue`
  String get home_catalogue {
    return Intl.message(
      'In our Catalogue',
      name: 'home_catalogue',
      desc: '',
      args: [],
    );
  }

  /// `Available:`
  String get function_available {
    return Intl.message(
      'Available:',
      name: 'function_available',
      desc: '',
      args: [],
    );
  }

  /// `Description:`
  String get function_description {
    return Intl.message(
      'Description:',
      name: 'function_description',
      desc: '',
      args: [],
    );
  }

  /// `Address:`
  String get function_address {
    return Intl.message(
      'Address:',
      name: 'function_address',
      desc: '',
      args: [],
    );
  }

  /// `Starring:`
  String get function_starring {
    return Intl.message(
      'Starring:',
      name: 'function_starring',
      desc: '',
      args: [],
    );
  }

  /// `Duration:`
  String get function_duration {
    return Intl.message(
      'Duration:',
      name: 'function_duration',
      desc: '',
      args: [],
    );
  }

  /// `Labels:`
  String get function_labels {
    return Intl.message(
      'Labels:',
      name: 'function_labels',
      desc: '',
      args: [],
    );
  }

  /// `General Settings`
  String get profile_title {
    return Intl.message(
      'General Settings',
      name: 'profile_title',
      desc: '',
      args: [],
    );
  }

  /// `Download Media`
  String get profile_download_title {
    return Intl.message(
      'Download Media',
      name: 'profile_download_title',
      desc: '',
      args: [],
    );
  }

  /// `Automatically download videos/pictures when wifi is available`
  String get profile_download_subtitle {
    return Intl.message(
      'Automatically download videos/pictures when wifi is available',
      name: 'profile_download_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification Settings`
  String get profile_notif_title {
    return Intl.message(
      'Notification Settings',
      name: 'profile_notif_title',
      desc: '',
      args: [],
    );
  }

  /// `Priority of Notifications`
  String get profile_notif_title_priority {
    return Intl.message(
      'Priority of Notifications',
      name: 'profile_notif_title_priority',
      desc: '',
      args: [],
    );
  }

  /// `Show notification icon at the top of the screen`
  String get profile_notif_subtitle_priority {
    return Intl.message(
      'Show notification icon at the top of the screen',
      name: 'profile_notif_subtitle_priority',
      desc: '',
      args: [],
    );
  }

  /// `Ringtone`
  String get profile_notif_title_ringtone {
    return Intl.message(
      'Ringtone',
      name: 'profile_notif_title_ringtone',
      desc: '',
      args: [],
    );
  }

  /// `Sound upon receipt of a new notification`
  String get profile_notif_subtitle_ringtone {
    return Intl.message(
      'Sound upon receipt of a new notification',
      name: 'profile_notif_subtitle_ringtone',
      desc: '',
      args: [],
    );
  }

  /// `Vibrate`
  String get profile_notif_title_vibrate {
    return Intl.message(
      'Vibrate',
      name: 'profile_notif_title_vibrate',
      desc: '',
      args: [],
    );
  }

  /// `Vibrate on new notification`
  String get profile_notif_title_subvibrate {
    return Intl.message(
      'Vibrate on new notification',
      name: 'profile_notif_title_subvibrate',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get profile_about_title {
    return Intl.message(
      'About',
      name: 'profile_about_title',
      desc: '',
      args: [],
    );
  }

  /// `With this app we aim to provide a world full of emotion and fantasy to its users - :)`
  String get profile_about_title_presentation {
    return Intl.message(
      'With this app we aim to provide a world full of emotion and fantasy to its users - :)',
      name: 'profile_about_title_presentation',
      desc: '',
      args: [],
    );
  }

  /// `Version: 1.0`
  String get profile_about_title_version {
    return Intl.message(
      'Version: 1.0',
      name: 'profile_about_title_version',
      desc: '',
      args: [],
    );
  }

  /// `Send Feedback`
  String get profile_about_title_send_t {
    return Intl.message(
      'Send Feedback',
      name: 'profile_about_title_send_t',
      desc: '',
      args: [],
    );
  }

  /// `Got any queries? We are happy to help!`
  String get profile_about_title_send_st {
    return Intl.message(
      'Got any queries? We are happy to help!',
      name: 'profile_about_title_send_st',
      desc: '',
      args: [],
    );
  }

  /// `FAQ`
  String get profile_about_title_faq_t {
    return Intl.message(
      'FAQ',
      name: 'profile_about_title_faq_t',
      desc: '',
      args: [],
    );
  }

  /// `View frequently asked questions`
  String get profile_about_title_faq_st {
    return Intl.message(
      'View frequently asked questions',
      name: 'profile_about_title_faq_st',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Police`
  String get profile_about_title_pp_t {
    return Intl.message(
      'Privacy Police',
      name: 'profile_about_title_pp_t',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get profile_about_title_tc_t {
    return Intl.message(
      'Terms & Conditions',
      name: 'profile_about_title_tc_t',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get profile_card_password {
    return Intl.message(
      'Change Password',
      name: 'profile_card_password',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get profile_card_language {
    return Intl.message(
      'Change Language',
      name: 'profile_card_language',
      desc: '',
      args: [],
    );
  }

  /// `Change Font Size`
  String get profile_card_font {
    return Intl.message(
      'Change Font Size',
      name: 'profile_card_font',
      desc: '',
      args: [],
    );
  }

  /// `Change Storage`
  String get profile_card_storage {
    return Intl.message(
      'Change Storage',
      name: 'profile_card_storage',
      desc: '',
      args: [],
    );
  }

  /// `Select the desired font size for the messages received`
  String get profile_alert_dialog_option_font_title {
    return Intl.message(
      'Select the desired font size for the messages received',
      name: 'profile_alert_dialog_option_font_title',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get profile_alert_dialog_option_font_s {
    return Intl.message(
      'Small',
      name: 'profile_alert_dialog_option_font_s',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get profile_alert_dialog_option_font_m {
    return Intl.message(
      'Medium',
      name: 'profile_alert_dialog_option_font_m',
      desc: '',
      args: [],
    );
  }

  /// `Big`
  String get profile_alert_dialog_option_font_b {
    return Intl.message(
      'Big',
      name: 'profile_alert_dialog_option_font_b',
      desc: '',
      args: [],
    );
  }

  /// `Select the desired location to save the content of the app`
  String get profile_alert_dialog_option_storage_title {
    return Intl.message(
      'Select the desired location to save the content of the app',
      name: 'profile_alert_dialog_option_storage_title',
      desc: '',
      args: [],
    );
  }

  /// `Internal storage`
  String get profile_alert_dialog_option_storage_is {
    return Intl.message(
      'Internal storage',
      name: 'profile_alert_dialog_option_storage_is',
      desc: '',
      args: [],
    );
  }

  /// `SD Card`
  String get profile_alert_dialog_option_storage_sd {
    return Intl.message(
      'SD Card',
      name: 'profile_alert_dialog_option_storage_sd',
      desc: '',
      args: [],
    );
  }

  /// `Select the language of the application`
  String get profile_alert_dialog_option_language_title {
    return Intl.message(
      'Select the language of the application',
      name: 'profile_alert_dialog_option_language_title',
      desc: '',
      args: [],
    );
  }

  /// `Spanish`
  String get profile_alert_dialog_option_language_sp {
    return Intl.message(
      'Spanish',
      name: 'profile_alert_dialog_option_language_sp',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get profile_alert_dialog_option_language_en {
    return Intl.message(
      'English',
      name: 'profile_alert_dialog_option_language_en',
      desc: '',
      args: [],
    );
  }

  /// `Query from Experience`
  String get profile_email_subject {
    return Intl.message(
      'Query from Experience',
      name: 'profile_email_subject',
      desc: '',
      args: [],
    );
  }

  /// `Please write your query here:`
  String get profile_email_body {
    return Intl.message(
      'Please write your query here:',
      name: 'profile_email_body',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get profile_title_change_pass {
    return Intl.message(
      'Change password',
      name: 'profile_title_change_pass',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your current password, and the new one`
  String get profile_subtitle_change_pass {
    return Intl.message(
      'Please enter your current password, and the new one',
      name: 'profile_subtitle_change_pass',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get profile_edit_old_pass {
    return Intl.message(
      'Old Password',
      name: 'profile_edit_old_pass',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get profile_edit_new_pass {
    return Intl.message(
      'New Password',
      name: 'profile_edit_new_pass',
      desc: '',
      args: [],
    );
  }

  /// `Repeat new password`
  String get profile_edit_rep_new_pass {
    return Intl.message(
      'Repeat new password',
      name: 'profile_edit_rep_new_pass',
      desc: '',
      args: [],
    );
  }

  /// `The password update was successful`
  String get profile_successful_operation_change_pass {
    return Intl.message(
      'The password update was successful',
      name: 'profile_successful_operation_change_pass',
      desc: '',
      args: [],
    );
  }

  /// `Subscription`
  String get subscripcion_operation {
    return Intl.message(
      'Subscription',
      name: 'subscripcion_operation',
      desc: '',
      args: [],
    );
  }

  /// `The subscription was successful`
  String get subscripcion_successful_operation {
    return Intl.message(
      'The subscription was successful',
      name: 'subscripcion_successful_operation',
      desc: '',
      args: [],
    );
  }

  /// `Messages`
  String get menu_messages {
    return Intl.message(
      'Messages',
      name: 'menu_messages',
      desc: '',
      args: [],
    );
  }

  /// `Billboard`
  String get menu_billboard {
    return Intl.message(
      'Billboard',
      name: 'menu_billboard',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get menu_profile {
    return Intl.message(
      'Profile',
      name: 'menu_profile',
      desc: '',
      args: [],
    );
  }

  /// `... more`
  String get expandable_text_more {
    return Intl.message(
      '... more',
      name: 'expandable_text_more',
      desc: '',
      args: [],
    );
  }

  /// ` less`
  String get expandable_text_less {
    return Intl.message(
      ' less',
      name: 'expandable_text_less',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get error_form {
    return Intl.message(
      'An error occurred',
      name: 'error_form',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect username or password`
  String get error_manual_login {
    return Intl.message(
      'Incorrect username or password',
      name: 'error_manual_login',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password`
  String get error_change_password {
    return Intl.message(
      'Incorrect password',
      name: 'error_change_password',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'es', countryCode: 'UY'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}