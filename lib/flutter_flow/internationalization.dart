import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'es', 'de', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? esText = '',
    String? deText = '',
    String? arText = '',
  }) =>
      [enText, esText, deText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // IDpage
  {
    'u8tg0l3c': {
      'en': 'Master-Chits',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jy8dscze': {
      'en': 'Collection-Login',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o07j3mgv': {
      'en': 'Enter The Collector ID',
      'ar': 'البدء',
      'de': 'Loslegen',
      'es': 'Empezar',
    },
    'fzxvw3mu': {
      'en': 'Login to access your account below.',
      'ar': 'قم بإنشاء حسابك أدناه.',
      'de': 'Erstellen Sie unten Ihr Konto.',
      'es': 'Crea tu cuenta a continuación.',
    },
    'a9j78va9': {
      'en': 'Company',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'i7f18cve': {
      'en': '',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'gkhe77rj': {
      'en': 'Name',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'xy0oh7te': {
      'en': '',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'efzyt3rr': {
      'en': 'Phone No',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    'a4fn9fxr': {
      'en': '',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'gpsm90r5': {
      'en': 'E-mail',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    '5ijwhhgh': {
      'en': '',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'af7ch9he': {
      'en': 'ID',
      'ar': 'عنوان البريد الالكترونى',
      'de': 'E-Mail-Addresse',
      'es': 'Dirección de correo electrónico',
    },
    't3imzpnj': {
      'en': '',
      'ar': 'أدخل بريدك الإلكتروني ...',
      'de': 'Geben sie ihre E-Mail Adresse ein...',
      'es': 'Introduce tu correo electrónico...',
    },
    'qbmoi1av': {
      'en': 'Start',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
    '2bb3vct7': {
      'en': 'Home',
      'ar': 'مسكن',
      'de': 'Heim',
      'es': 'Casa',
    },
  },
  // add_transaction
  {
    'nlltqk1h': {
      'en': 'Add Transaction',
      'ar': '',
      'de': '',
      'es': '',
    },
    'i5y41ole': {
      'en': 'Transaction Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ugdahbgv': {
      'en': 'Enter transaction amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    '933tnn3v': {
      'en': 'Current Balance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wrnnp2bh': {
      'en': 'Collected Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gzaqf5qh': {
      'en': 'Total:',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4w8s0hce': {
      'en': 'Add Transaction',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // monthDay
  {
    'v1t4ytsd': {
      'en': 'Master-Chits',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rb4nvsom': {
      'en': 'Collection-Login',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wa8o23ta': {
      'en': 'Daily Collection',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tl5bd317': {
      'en': 'Monthly Collection',
      'ar': '',
      'de': '',
      'es': '',
    },
    'n7o4cgqv': {
      'en': 'Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hd9o9o49': {
      'en': 'Configuration',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y2ykhlbp': {
      'en': 'Upload Data',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ufatltqo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0ecqba2y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q1cjfyfy': {
      'en': 'Current Balance:',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6yyg4cvn': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'yhsys0kr': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // MY_CardDay
  {
    '0jx2djx3': {
      'en': 'Daily Collection',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dagxwyb4': {
      'en': 'Select Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nueehmaw': {
      'en': 'Account Number',
      'ar': '',
      'de': '',
      'es': '',
    },
    'up0ziyj1': {
      'en': 'XXXX',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u9zmheal': {
      'en': 'Balance:',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9ipz2qc7': {
      'en': '•',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MY_CardMonthR
  {
    'jpo82azs': {
      'en': 'Monthly Collection',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g7izu74k': {
      'en': 'Regular',
      'ar': '',
      'de': '',
      'es': '',
    },
    'k7384701': {
      'en': 'Select Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3kqoqaks': {
      'en': 'Account Number',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jfc1f90z': {
      'en': 'XXXX',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bow5q780': {
      'en': 'Regular',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // MY_CardMonthAdv
  {
    'rmce7tjf': {
      'en': 'Monthly Collection',
      'ar': '',
      'de': '',
      'es': '',
    },
    'otshohxj': {
      'en': 'Advance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g6bj3o78': {
      'en': 'Select Account',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dqhc1p0a': {
      'en': 'Account Number',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zqidajrz': {
      'en': 'XXXX',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a2bcp8s1': {
      'en': 'Balance:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cky3yezm': {
      'en': 'Advance',
      'ar': '•',
      'de': '•',
      'es': '•',
    },
  },
  // regAdv
  {
    'ap0stkgp': {
      'en': 'Master-Chits',
      'ar': '',
      'de': '',
      'es': '',
    },
    'bgpl6rfu': {
      'en': 'Collection-Login',
      'ar': '',
      'de': '',
      'es': '',
    },
    'm6mqrsz2': {
      'en': 'Make Sure to select the right reciept type',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rx01ger7': {
      'en': 'Regular',
      'ar': '',
      'de': '',
      'es': '',
    },
    'c4xr4fpq': {
      'en': 'Advance',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xs5jovhd': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '542bujy3': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lh2hxmhx': {
      'en': 'Current Balance:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'vj3g9qht': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ok4ai1zk': {
      'en': 'Home',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // add_transactionM
  {
    'b7xjhjdf': {
      'en': '       Add Transaction',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0z5kfd2f': {
      'en': 'Transaction Amount',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gq2154jd': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fsx1l80m': {
      'en': 'Payment Mode:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'lnuge6ci': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ogwmb6hi': {
      'en': 'Please select...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e3b7jtvl': {
      'en': 'Search for an item...',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ssbydsu7': {
      'en': 'Enter Cheque No.:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xdsy2zsb': {
      'en': 'Cheque No.',
      'ar': '',
      'de': '',
      'es': '',
    },
    '7t5dtrlq': {
      'en': 'Enter Cheque Date:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'npqvqiy2': {
      'en': 'Enter Subscriber Bank:',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zutyafqr': {
      'en': 'Subscriber Bank',
      'ar': '',
      'de': '',
      'es': '',
    },
    't90jjv6n': {
      'en': 'Inst No.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'tdibnuks': {
      'en': 'Auction Date',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4p85zjei': {
      'en': 'Inst. Amt',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0fhlfvlq': {
      'en': 'Amt. Due',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2nw9d5tx': {
      'en': 'Alloc. Amt',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uncoze1k': {
      'en': 'Balance',
      'ar': '',
      'de': '',
      'es': '',
    },
    '81px9ix1': {
      'en': 'Incentive',
      'ar': '',
      'de': '',
      'es': '',
    },
    'fzeaja5i': {
      'en': 'Penalty',
      'ar': '',
      'de': '',
      'es': '',
    },
    'd76i53ul': {
      'en': 'Amt Due',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pgitbl9': {
      'en': 'Collected Amt',
      'ar': '',
      'de': '',
      'es': '',
    },
    'x1llgc5o': {
      'en': 'Incentive Amt',
      'ar': '',
      'de': '',
      'es': '',
    },
    'jzvnkfb7': {
      'en': 'Penalty Amt',
      'ar': '',
      'de': '',
      'es': '',
    },
    'g3rk4zir': {
      'en': 'Net Amt Due',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xc46plkg': {
      'en': 'Add Transaction',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // d2
  {
    'zbcuqgip': {
      'en': 'Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ee7kxwf8': {
      'en': 'Monthly Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    '3cjqy348': {
      'en': 'Daily Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // t1d
  {
    '6ihv05w3': {
      'en': 'Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mpgh8s7w': {
      'en': 'Acct Num',
      'ar': '',
      'de': '',
      'es': '',
    },
    '90a5s2aq': {
      'en': 'Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'o8mqomgm': {
      'en': 'Collected Amt',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xs7gnmts': {
      'en': 'Date',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // t1m
  {
    '3o2ybgya': {
      'en': 'Transactions',
      'ar': '',
      'de': '',
      'es': '',
    },
    'hlbzwauf': {
      'en': 'Acct Num',
      'ar': '',
      'de': '',
      'es': '',
    },
    'zqlvyda7': {
      'en': 'Name',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z16cakxg': {
      'en': 'Collected Amt',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6k78qnp2': {
      'en': 'Date',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ux57b0d1': {
      'en': 'Payment Type',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ux4rb7ax': {
      'en': 'Incentive',
      'ar': '',
      'de': '',
      'es': '',
    },
    'kbzjwuet': {
      'en': 'Penalty',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // dataCopy
  {
    'agt17dbo': {
      'en': 'Master Chits',
      'ar': '',
      'de': '',
      'es': '',
    },
    'nonyzfdi': {
      'en': 'Configuration',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rqoru42x': {
      'en': 'Reciept No. Prefix',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2hhepite': {
      'en': 'Reset Reciept No.',
      'ar': '',
      'de': '',
      'es': '',
    },
    'cyjk1d76': {
      'en': 'Profile',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // logout
  {
    'nuqucscu': {
      'en': 'Please Enter a valid Company Name and ID',
      'ar': '',
      'de': '',
      'es': '',
    },
    'u0obisi9': {
      'en': 'OK',
      'ar': 'تسجيل الدخول',
      'de': 'Anmeldung',
      'es': 'Acceso',
    },
  },
  // logoutCopy
  {
    'mkcowo4d': {
      'en': 'Transaction Recieved',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // txtfld
  {
    'qdvto9zd': {
      'en': 'Enter the Reciept Prefix',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h4sdif16': {
      'en': 'Enter 2 letters for prefix',
      'ar': '',
      'de': '',
      'es': '',
    },
    'h54vhwij': {
      'en': 'OK',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // passCon
  {
    'n7dvb7zs': {
      'en': 'Enter the Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0vet7dtm': {
      'en': 'Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4n8h6wew': {
      'en': 'Reset Password?',
      'ar': '',
      'de': '',
      'es': '',
    },
    'y6dzukku': {
      'en': 'OK',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // passConCopy
  {
    'jgqln30y': {
      'en': 'Reset the Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4uj15yug': {
      'en': 'Old Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'e10ug4dg': {
      'en': 'New Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mn0sz0ts': {
      'en': 'Confirm Password',
      'ar': '',
      'de': '',
      'es': '',
    },
    'uf1onbw3': {
      'en': 'OK',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    'efvtwj7k': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'ec5hfa1e': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'q5ljwvfo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'j4rmwb3h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6ah1b18f': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '2kos1hen': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'wwinbqvz': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '6b6hphat': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'z64m77uk': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'gofu2m7u': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xrexc83h': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'aox3s4fb': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'l8hv5a7z': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '4pjwb70a': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '0xlokf4y': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '8twlwiwt': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '5qsg3w0x': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'xut8rdiy': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '9bzcc7t8': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'mrm0ufab': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'dde973bo': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'rupbw4cv': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    't4xzlq9q': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    '513nj4m0': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
    'a1jxfgju': {
      'en': '',
      'ar': '',
      'de': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
