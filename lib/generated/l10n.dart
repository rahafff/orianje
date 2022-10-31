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
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Loading`
  String get loading {
    return Intl.message(
      'Loading',
      name: 'loading',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your Email`
  String get pleaseEnterYourEmail {
    return Intl.message(
      'Please Enter Your Email',
      name: 'pleaseEnterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `I have an account`
  String get iHaveAnAccount {
    return Intl.message(
      'I have an account',
      name: 'iHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Error Happened`
  String get errorHappened {
    return Intl.message(
      'Error Happened',
      name: 'errorHappened',
      desc: '',
      args: [],
    );
  }

  /// `Error Loading Data`
  String get errorLoadingData {
    return Intl.message(
      'Error Loading Data',
      name: 'errorLoadingData',
      desc: '',
      args: [],
    );
  }

  /// `Email Address is Required`
  String get emailAddressIsRequired {
    return Intl.message(
      'Email Address is Required',
      name: 'emailAddressIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Please input phone number`
  String get pleaseInputPhoneNumber {
    return Intl.message(
      'Please input phone number',
      name: 'pleaseInputPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get signOut {
    return Intl.message(
      'Sign out',
      name: 'signOut',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Paid`
  String get paid {
    return Intl.message(
      'Paid',
      name: 'paid',
      desc: '',
      args: [],
    );
  }

  /// `not Paid`
  String get notPaid {
    return Intl.message(
      'not Paid',
      name: 'notPaid',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `My document`
  String get document {
    return Intl.message(
      'My document',
      name: 'document',
      desc: '',
      args: [],
    );
  }

  /// `gallery`
  String get gallery {
    return Intl.message(
      'gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `camera`
  String get camera {
    return Intl.message(
      'camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePass {
    return Intl.message(
      'Change password',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get oldPass {
    return Intl.message(
      'Old password',
      name: 'oldPass',
      desc: '',
      args: [],
    );
  }

  /// `incorrect old password`
  String get wrongPass {
    return Intl.message(
      'incorrect old password',
      name: 'wrongPass',
      desc: '',
      args: [],
    );
  }

  /// `Company info`
  String get companyInfo {
    return Intl.message(
      'Company info',
      name: 'companyInfo',
      desc: '',
      args: [],
    );
  }

  /// `networkError`
  String get networkError {
    return Intl.message(
      'networkError',
      name: 'networkError',
      desc: '',
      args: [],
    );
  }

  /// `Warnning`
  String get warnning {
    return Intl.message(
      'Warnning',
      name: 'warnning',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get newPassword {
    return Intl.message(
      'new password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `username or password is wrong`
  String get invalidCredentials {
    return Intl.message(
      'username or password is wrong',
      name: 'invalidCredentials',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get username {
    return Intl.message(
      'username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `please Complete Field`
  String get pleaseCompleteField {
    return Intl.message(
      'please Complete Field',
      name: 'pleaseCompleteField',
      desc: '',
      args: [],
    );
  }

  /// `password Is Too Short`
  String get passwordIsTooShort {
    return Intl.message(
      'password Is Too Short',
      name: 'passwordIsTooShort',
      desc: '',
      args: [],
    );
  }

  /// `refresh`
  String get refresh {
    return Intl.message(
      'refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Invoices`
  String get invoices {
    return Intl.message(
      'Invoices',
      name: 'invoices',
      desc: '',
      args: [],
    );
  }

  /// `Supplier name`
  String get supplierName {
    return Intl.message(
      'Supplier name',
      name: 'supplierName',
      desc: '',
      args: [],
    );
  }

  /// `add supplier name`
  String get AddSupplierName {
    return Intl.message(
      'add supplier name',
      name: 'AddSupplierName',
      desc: '',
      args: [],
    );
  }

  /// `Invoice number`
  String get invoiceNumber {
    return Intl.message(
      'Invoice number',
      name: 'invoiceNumber',
      desc: '',
      args: [],
    );
  }

  /// `add invoice number`
  String get AddInvoiceNumber {
    return Intl.message(
      'add invoice number',
      name: 'AddInvoiceNumber',
      desc: '',
      args: [],
    );
  }

  /// `CashBook number`
  String get cashBookNumber {
    return Intl.message(
      'CashBook number',
      name: 'cashBookNumber',
      desc: '',
      args: [],
    );
  }

  /// `add cashBook number`
  String get addCashBookNumber {
    return Intl.message(
      'add cashBook number',
      name: 'addCashBookNumber',
      desc: '',
      args: [],
    );
  }

  /// `Posts`
  String get mails {
    return Intl.message(
      'Posts',
      name: 'mails',
      desc: '',
      args: [],
    );
  }

  /// `Employees`
  String get employees {
    return Intl.message(
      'Employees',
      name: 'employees',
      desc: '',
      args: [],
    );
  }

  /// `Post number`
  String get mailNumber {
    return Intl.message(
      'Post number',
      name: 'mailNumber',
      desc: '',
      args: [],
    );
  }

  /// `Add post number`
  String get addMailNumber {
    return Intl.message(
      'Add post number',
      name: 'addMailNumber',
      desc: '',
      args: [],
    );
  }

  /// `Format`
  String get format {
    return Intl.message(
      'Format',
      name: 'format',
      desc: '',
      args: [],
    );
  }

  /// `Work hour`
  String get workHour {
    return Intl.message(
      'Work hour',
      name: 'workHour',
      desc: '',
      args: [],
    );
  }

  /// `Work day`
  String get workDay {
    return Intl.message(
      'Work day',
      name: 'workDay',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get startDate {
    return Intl.message(
      'Start date',
      name: 'startDate',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get endDate {
    return Intl.message(
      'End date',
      name: 'endDate',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Select employee`
  String get selectEmployee {
    return Intl.message(
      'Select employee',
      name: 'selectEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Add work hour`
  String get addWorkHour {
    return Intl.message(
      'Add work hour',
      name: 'addWorkHour',
      desc: '',
      args: [],
    );
  }

  /// `Add work day`
  String get addWorkDay {
    return Intl.message(
      'Add work day',
      name: 'addWorkDay',
      desc: '',
      args: [],
    );
  }

  /// `Date range`
  String get dateRange {
    return Intl.message(
      'Date range',
      name: 'dateRange',
      desc: '',
      args: [],
    );
  }

  /// `From: `
  String get from {
    return Intl.message(
      'From: ',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `To: `
  String get to {
    return Intl.message(
      'To: ',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Post type`
  String get mailType {
    return Intl.message(
      'Post type',
      name: 'mailType',
      desc: '',
      args: [],
    );
  }

  /// `Add post type`
  String get addMailType {
    return Intl.message(
      'Add post type',
      name: 'addMailType',
      desc: '',
      args: [],
    );
  }

  /// `Seen`
  String get seen {
    return Intl.message(
      'Seen',
      name: 'seen',
      desc: '',
      args: [],
    );
  }

  /// `Not seen`
  String get notSeen {
    return Intl.message(
      'Not seen',
      name: 'notSeen',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Inbox`
  String get inbox {
    return Intl.message(
      'Inbox',
      name: 'inbox',
      desc: '',
      args: [],
    );
  }

  /// `Sell`
  String get sell {
    return Intl.message(
      'Sell',
      name: 'sell',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Invoice type`
  String get invoiceType {
    return Intl.message(
      'Invoice type',
      name: 'invoiceType',
      desc: '',
      args: [],
    );
  }

  /// `Apply filter`
  String get applyFilter {
    return Intl.message(
      'Apply filter',
      name: 'applyFilter',
      desc: '',
      args: [],
    );
  }

  /// `Attachments`
  String get attachments {
    return Intl.message(
      'Attachments',
      name: 'attachments',
      desc: '',
      args: [],
    );
  }

  /// `Add invoice`
  String get addInvoice {
    return Intl.message(
      'Add invoice',
      name: 'addInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Take picture`
  String get takePicture {
    return Intl.message(
      'Take picture',
      name: 'takePicture',
      desc: '',
      args: [],
    );
  }

  /// `Select existing picture`
  String get selectImage {
    return Intl.message(
      'Select existing picture',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Select existing document`
  String get selectDoc {
    return Intl.message(
      'Select existing document',
      name: 'selectDoc',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `No attachment for this post`
  String get noAttachMail {
    return Intl.message(
      'No attachment for this post',
      name: 'noAttachMail',
      desc: '',
      args: [],
    );
  }

  /// `No attachment for this invoice`
  String get noAttachInvoice {
    return Intl.message(
      'No attachment for this invoice',
      name: 'noAttachInvoice',
      desc: '',
      args: [],
    );
  }

  /// `Add post`
  String get addMail {
    return Intl.message(
      'Add post',
      name: 'addMail',
      desc: '',
      args: [],
    );
  }

  /// `Search supplier name or invoice number`
  String get searchForInvoiceNumAndName {
    return Intl.message(
      'Search supplier name or invoice number',
      name: 'searchForInvoiceNumAndName',
      desc: '',
      args: [],
    );
  }

  /// `post name`
  String get mailName {
    return Intl.message(
      'post name',
      name: 'mailName',
      desc: '',
      args: [],
    );
  }

  /// `add post name`
  String get addMailName {
    return Intl.message(
      'add post name',
      name: 'addMailName',
      desc: '',
      args: [],
    );
  }

  /// `Search post name or number`
  String get searchMailNameOrNumber {
    return Intl.message(
      'Search post name or number',
      name: 'searchMailNameOrNumber',
      desc: '',
      args: [],
    );
  }

  /// `Records`
  String get records {
    return Intl.message(
      'Records',
      name: 'records',
      desc: '',
      args: [],
    );
  }

  /// `Add record`
  String get addRecord {
    return Intl.message(
      'Add record',
      name: 'addRecord',
      desc: '',
      args: [],
    );
  }

  /// `Invoice paid successfully`
  String get paidSuccessfully {
    return Intl.message(
      'Invoice paid successfully',
      name: 'paidSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Invoice payment canceled successfully`
  String get unPaidSuccessfully {
    return Intl.message(
      'Invoice payment canceled successfully',
      name: 'unPaidSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Select post format`
  String get selectMailFormat {
    return Intl.message(
      'Select post format',
      name: 'selectMailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Hour`
  String get hour {
    return Intl.message(
      'Hour',
      name: 'hour',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `App lock`
  String get appLock {
    return Intl.message(
      'App lock',
      name: 'appLock',
      desc: '',
      args: [],
    );
  }

  /// `Accept`
  String get accept {
    return Intl.message(
      'Accept',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Deny`
  String get deny {
    return Intl.message(
      'Deny',
      name: 'deny',
      desc: '',
      args: [],
    );
  }

  /// `Sender`
  String get senderName {
    return Intl.message(
      'Sender',
      name: 'senderName',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator.\nInterpretation and Definitions\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\nDefinitions\nFor the purposes of this Privacy Policy:\nAccount means a unique account created for You to access our Service or parts of our Service.\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\nApplication means the software program provided by the Company downloaded by You on any electronic device, named Oranje dienstverlening\nCompany (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Oranje Dienstverlening B.V., Schuttevaerweg 5,3044 BA, Rotterdam.\nCountry refers to: Netherlands\nDevice means any device that can access the Service such as a computer, a cellphone or a digital tablet.\nPersonal Data is any information that relates to an identified or identifiable individual.\nService refers to the Application.\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.\nUsage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).\nYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.`
  String get terms {
    return Intl.message(
      'This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your information when You use the Service and tells You about Your privacy rights and how the law protects You.\nWe use Your Personal data to provide and improve the Service. By using the Service, You agree to the collection and use of information in accordance with this Privacy Policy. This Privacy Policy has been created with the help of the Privacy Policy Generator.\nInterpretation and Definitions\nInterpretation\nThe words of which the initial letter is capitalized have meanings defined under the following conditions. The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.\nDefinitions\nFor the purposes of this Privacy Policy:\nAccount means a unique account created for You to access our Service or parts of our Service.\nAffiliate means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.\nApplication means the software program provided by the Company downloaded by You on any electronic device, named Oranje dienstverlening\nCompany (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Oranje Dienstverlening B.V., Schuttevaerweg 5,3044 BA, Rotterdam.\nCountry refers to: Netherlands\nDevice means any device that can access the Service such as a computer, a cellphone or a digital tablet.\nPersonal Data is any information that relates to an identified or identifiable individual.\nService refers to the Application.\nService Provider means any natural or legal person who processes the data on behalf of the Company. It refers to third-party companies or individuals employed by the Company to facilitate the Service, to provide the Service on behalf of the Company, to perform services related to the Service or to assist the Company in analyzing how the Service is used.\nUsage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).\nYou means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
      name: 'terms',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'nl'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
