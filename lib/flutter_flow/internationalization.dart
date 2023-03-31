import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ta', 'hi'];

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
    String? taText = '',
    String? hiText = '',
  }) =>
      [enText, taText, hiText][languageIndex] ?? '';

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
  // Visualization
  {
    '7722bocc': {
      'en': 'Visualisations',
      'hi': 'विज़ुअलाइज़ेशन',
      'ta': 'காட்சிப்படுத்தல்கள்',
    },
    '1wkp929t': {
      'en': 'Monthly',
      'hi': 'महीने के',
      'ta': 'மாதாந்திர',
    },
    'agxxm0ar': {
      'en': 'Monthly limit',
      'hi': 'मासिक सीमा',
      'ta': 'மாதாந்திர வரம்பு',
    },
    'y2bz7s5m': {
      'en': 'Amount spent:  22,600',
      'hi': 'खर्च की गई राशि: 22,600',
      'ta': 'செலவழித்த தொகை: 22,600',
    },
    'tyhi29y8': {
      'en': 'Limit set:  50,000',
      'hi': 'सीमा निर्धारित: 50,000',
      'ta': 'வரம்பு நிர்ணயம்: 50,000',
    },
    'wqdi55zg': {
      'en': '32%',
      'hi': '32%',
      'ta': '32%',
    },
    '0weec0zh': {
      'en': '48%',
      'hi': '48%',
      'ta': '48%',
    },
    '6tsy2r5d': {
      'en': '65%',
      'hi': '65%',
      'ta': '65%',
    },
    'k26hv07h': {
      'en': '40%',
      'hi': '40%',
      'ta': '40%',
    },
    'cwbfijtn': {
      'en': '80%',
      'hi': '80%',
      'ta': '80%',
    },
    'htrn94ms': {
      'en': 'Your expenses',
      'hi': 'आपके खर्चे',
      'ta': 'உங்கள் செலவுகள்',
    },
    'vxm9srze': {
      'en': 'Summary of your expenses',
      'hi': 'आपके खर्चों का सारांश',
      'ta': 'உங்கள் செலவுகளின் சுருக்கம்',
    },
    'kydpb6b4': {
      'en': 'Last 7 days',
      'hi': 'पिछले 7 दिन',
      'ta': 'கடந்த 7 நாட்கள்',
    },
    '6ffw244j': {
      'en': 'Monthly limit',
      'hi': 'मासिक सीमा',
      'ta': 'மாதாந்திர வரம்பு',
    },
    'jdux6rtu': {
      'en': 'Amount spent : 3,200',
      'hi': 'खर्च की गई राशि : 3,200',
      'ta': 'செலவழித்த தொகை: 3,200',
    },
    't17ng0pb': {
      'en': 'Limit set : 20,000',
      'hi': 'सीमा निर्धारित: 20,000',
      'ta': 'வரம்பு நிர்ணயம்: 20,000',
    },
    '78w87cej': {
      'en': '32%',
      'hi': '32%',
      'ta': '32%',
    },
    'qev3btre': {
      'en': '40%',
      'hi': '40%',
      'ta': '40%',
    },
    '9w86fjdi': {
      'en': '80%',
      'hi': '80%',
      'ta': '80%',
    },
    'pifpoxy5': {
      'en': '65%',
      'hi': '65%',
      'ta': '65%',
    },
    '8p9ac834': {
      'en': '48%',
      'hi': '48%',
      'ta': '48%',
    },
    '5f5eneaq': {
      'en': 'Your expenses',
      'hi': 'आपके खर्चे',
      'ta': 'உங்கள் செலவுகள்',
    },
    '7agcq28h': {
      'en': 'Summary of your expenses',
      'hi': 'आपके खर्चों का सारांश',
      'ta': 'உங்கள் செலவுகளின் சுருக்கம்',
    },
    'xvg8i454': {
      'en': '__',
      'hi': '__',
      'ta': '__',
    },
  },
  // paymentSuccess
  {
    'piuze15f': {
      'en': 'Payment Confirmed!',
      'hi': 'भुगतान की पुष्टि हो गई है!',
      'ta': 'கட்டன சேவை உறுபடுத்தப்பட்டது!',
    },
    'xvs38hq4': {
      'en': '₹425.24',
      'hi': '₹425.24',
      'ta': '₹425.24',
    },
    'enuor7di': {
      'en':
          'Your payment has been confirmed, it may take 1-2 hours in order for your payment to go through and show up in your transation list.',
      'hi':
          'आपके भुगतान की पुष्टि हो गई है, आपका भुगतान पूरा होने और आपकी लेन-देन सूची में दिखाई देने में 1-2 घंटे लग सकते हैं।',
      'ta':
          'உங்கள் பணம் செலுத்தப்பட்டது உறுதிசெய்யப்பட்டது, உங்கள் பணம் செலுத்தி உங்கள் பரிமாற்றப் பட்டியலில் காண்பிக்க 1-2 மணிநேரம் ஆகலாம்.',
    },
    '9lqacec2': {
      'en': 'Mastercard Ending in 4021',
      'hi': 'मास्टरकार्ड 4021 में समाप्त हो रहा है',
      'ta': 'மாஸ்டர்கார்டு 4021 இல் முடிவடைகிறது',
    },
    'ff8nhd0n': {
      'en': '₹425.24',
      'hi': '₹425.24',
      'ta': '₹425.24',
    },
    '1llrcp3t': {
      'en': 'Go Home',
      'hi': 'घर जाओ',
      'ta': 'வீட்டிற்கு செல்',
    },
  },
  // SetPin
  {
    'pc8bczjf': {
      'en': 'Set your Pin',
      'hi': 'अपना पिन सेट करें',
      'ta': 'உங்கள் பின்னை அமைக்கவும்',
    },
    '80z0ddni': {
      'en': 'This code helps keep your account safe and secure.',
      'hi': 'यह कोड आपके खाते को सुरक्षित रखने में मदद करता है।',
      'ta':
          'இந்தக் குறியீடு உங்கள் கணக்கைப் பாதுகாப்பாகவும் பாதுகாப்பாகவும் வைத்திருக்க உதவுகிறது.',
    },
    'pwsrn4mn': {
      'en': 'Confirm your Pin',
      'hi': 'अपने पिन की पुष्टि करें',
      'ta': 'உங்கள் பின்னை உறுதிப்படுத்தவும்',
    },
    't0gr9773': {
      'en': 'Confirm & Continue',
      'hi': 'पुष्टि करें और जारी रखें',
      'ta': 'உறுதிசெய்து தொடரவும்',
    },
    'lp9savd5': {
      'en': 'Enter Pin Code Below',
      'hi': 'नीचे पिन कोड दर्ज करें',
      'ta': 'பின் குறியீட்டை கீழே உள்ளிடவும்',
    },
    'jzxqgk30': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // transactionhistory
  {
    '9om6iph8': {
      'en': 'Rs. 17,593.00',
      'hi': 'रु. 17,593.00',
      'ta': 'ரூ. 17,593.00',
    },
    'auvlckli': {
      'en': 'Balance',
      'hi': 'संतुलन',
      'ta': 'இருப்பு',
    },
    '4e3oee0a': {
      'en': 'Recent Transactions',
      'hi': 'हाल ही के लेनदेन',
      'ta': 'சமீபத்திய பரிவர்த்தனைகள்',
    },
    'wa16u8qp': {
      'en': 'Mar. 14, 2023',
      'hi': 'मार्च 14, 2023',
      'ta': 'மார்ச் 14, 2023',
    },
    '0dj33rhx': {
      'en': '**** 3291',
      'hi': '**** 3291',
      'ta': '**** 3291',
    },
    'hetmsaci': {
      'en': 'Rs. 247',
      'hi': 'रु. 247',
      'ta': 'ரூ. 247',
    },
    '604c8jll': {
      'en': 'Mar. 12, 2022',
      'hi': 'मार्च 12, 2022',
      'ta': 'மார்ச் 12, 2022',
    },
    '2pq883xb': {
      'en': '**** 3291',
      'hi': '**** 3291',
      'ta': '**** 3291',
    },
    'dob79whh': {
      'en': 'Rs. 500',
      'hi': 'रु. 500',
      'ta': 'ரூ. 500',
    },
    'ucczgfo5': {
      'en': 'Mar. 4, 2022',
      'hi': 'मार्च 4, 2022',
      'ta': 'மார்ச் 4, 2022',
    },
    'ctre55z2': {
      'en': '**** 3291',
      'hi': '**** 3291',
      'ta': '**** 3291',
    },
    'i2zqigc7': {
      'en': 'Rs. 20',
      'hi': 'रु. 20',
      'ta': 'ரூ. 20',
    },
    'bs2s4enq': {
      'en': 'Feb. 21, 2022',
      'hi': 'फरवरी 21, 2022',
      'ta': 'பிப். 21, 2022',
    },
    'id6slsnh': {
      'en': '**** 3291',
      'hi': '**** 3291',
      'ta': '**** 3291',
    },
    'hf9jhcpi': {
      'en': 'Rs. 100',
      'hi': 'रु. 100',
      'ta': 'ரூ. 100',
    },
    'wvnmn4nl': {
      'en': 'Jan. 14, 2022',
      'hi': '14 जनवरी, 2022',
      'ta': 'ஜன. 14, 2022',
    },
    'zw6k9gql': {
      'en': '**** 3291',
      'hi': '**** 3291',
      'ta': '**** 3291',
    },
    'biwpolpb': {
      'en': 'Rs. 1000',
      'hi': 'रु. 1000',
      'ta': 'ரூ. 1000',
    },
    'p8j10727': {
      'en': 'Transactions',
      'hi': 'लेनदेन',
      'ta': 'பரிவர்த்தனைகள்',
    },
    'jhm42z0m': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // UserHome
  {
    'iz77ewd8': {
      'en': 'Welcome,',
      'hi': 'स्वागत,',
      'ta': 'வரவேற்பு,',
    },
    '6oeb6otn': {
      'en': 'Andrew',
      'hi': 'एंड्रयू',
      'ta': 'ஆண்ட்ரூ',
    },
    'zv1ucilf': {
      'en': 'Your latest updates are below.',
      'hi': 'आपके नवीनतम अपडेट नीचे हैं।',
      'ta': 'உங்களின் சமீபத்திய புதுப்பிப்புகள் கீழே உள்ளன.',
    },
    'k3wx3xia': {
      'en': 'Andrew',
      'hi': 'एंड्रयू',
      'ta': 'ஆண்ட்ரூ',
    },
    'tdmsyr1l': {
      'en': 'Balance',
      'hi': 'संतुलन',
      'ta': 'இருப்பு',
    },
    'a7c71uuo': {
      'en': '₹17,593',
      'hi': '₹17,593',
      'ta': '₹17,593',
    },
    'iqm3sjuf': {
      'en': 'andrewtate@okicici',
      'hi': 'andrewtate@okicici',
      'ta': 'andrewtate@okicici',
    },
    '0uu29fck': {
      'en': '05/25',
      'hi': '05/25',
      'ta': '05/25',
    },
    'slg0ve09': {
      'en': 'Quick Service',
      'hi': 'त्वरित सेवा',
      'ta': 'விரைவான சேவை',
    },
    '973zn8vn': {
      'en': 'Transfer',
      'hi': 'स्थानांतरण',
      'ta': 'இடமாற்றம்',
    },
    'bqddhcg3': {
      'en': 'Activity',
      'hi': 'गतिविधि',
      'ta': 'செயல்பாடு',
    },
    '2swvshc1': {
      'en': ' Bank',
      'hi': 'किनारा',
      'ta': 'வங்கி',
    },
    '1f3og2zl': {
      'en': 'Schemes',
      'hi': 'योजनाओं',
      'ta': 'திட்டங்கள்',
    },
    'eg9suvet': {
      'en': 'History',
      'hi': 'इतिहास',
      'ta': 'வரலாறு',
    },
    '7foirzoh': {
      'en': 'Reward',
      'hi': 'ईएमआई',
      'ta': 'EMI',
    },
    'dylexlv2': {
      'en': 'Charities',
      'hi': 'दान',
      'ta': 'தொண்டு நிறுவனங்கள்',
    },
    't52zxw4l': {
      'en': 'Be the change you wish to see in the world !',
      'hi': 'खुद वो बदलाव बनिए जो आप दुनिया में देखना चाहते हैं!',
      'ta': 'உலகில் நீங்கள் காண விரும்பும் மாற்றமாக இருங்கள்!',
    },
    '60cgx9ab': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // Welcum
  {
    'h975h115': {
      'en': 'Welcome Philan !',
      'hi': 'आपका स्वागत है फिलन!',
      'ta': 'பிலானை வரவேற்கிறோம்!',
    },
    'nc3dlude': {
      'en':
          'Looking for a payment solution that not only delivers seamless transactions but also has an exciting user interface? Look no further! Our payment platform combines security and style to provide you with a hassle-free payment experience. Say goodbye to clunky interfaces and hello to effortless payments with a touch of flair. Get started today and see the difference for yourself!',
      'hi':
          'एक ऐसे भुगतान समाधान की तलाश है जो न केवल निर्बाध लेनदेन प्रदान करे बल्कि एक रोमांचक यूजर इंटरफेस भी हो? आगे कोई तलाश नहीं करें! हमारा भुगतान प्लेटफ़ॉर्म आपको परेशानी मुक्त भुगतान अनुभव प्रदान करने के लिए सुरक्षा और शैली को जोड़ता है। भद्दे इंटरफेस को अलविदा कहें और सहजता के स्पर्श के साथ आसान भुगतान का स्वागत करें। आज ही शुरू करें और अपने लिए अंतर देखें!',
      'ta':
          'தடையற்ற பரிவர்த்தனைகளை வழங்குவதோடு மட்டுமல்லாமல், அற்புதமான பயனர் இடைமுகத்தையும் கொண்ட கட்டணத் தீர்வைத் தேடுகிறீர்களா? மேலும் பார்க்க வேண்டாம்! எங்களின் பேமெண்ட் பிளாட்ஃபார்ம் பாதுகாப்பு மற்றும் ஸ்டைலை ஒருங்கிணைத்து உங்களுக்கு தொந்தரவு இல்லாத கட்டண அனுபவத்தை வழங்குகிறது. தந்திரமான இடைமுகங்களுக்கு குட்பை சொல்லுங்கள், மேலும் திறமையுடன் எளிதாக பணம் செலுத்துங்கள். இன்றே தொடங்குங்கள் மற்றும் வித்தியாசத்தை நீங்களே பாருங்கள்!',
    },
    'n9ipe9gr': {
      'en': 'Donation reminder',
      'hi': 'दान अनुस्मारक',
      'ta': 'நன்கொடை நினைவூட்டல்',
    },
    '9hnuc3ed': {
      'en':
          'By making a small donation through our platform, you have the power to create a tremendous impact on society. Every Rupee donated has the potential to make a meaningful difference in the lives of those in need.',
      'hi':
          'हमारे मंच के माध्यम से एक छोटा सा दान करके, आपके पास समाज पर जबरदस्त प्रभाव पैदा करने की शक्ति है। दान किए गए प्रत्येक रुपये में जरूरतमंद लोगों के जीवन में सार्थक बदलाव लाने की क्षमता है।',
      'ta':
          'எங்கள் தளத்தின் மூலம் ஒரு சிறிய நன்கொடை வழங்குவதன் மூலம், சமுதாயத்தில் மிகப்பெரிய தாக்கத்தை உருவாக்கும் சக்தி உங்களுக்கு உள்ளது. நன்கொடையாக வழங்கப்படும் ஒவ்வொரு ரூபாயும் தேவைப்படுவோரின் வாழ்வில் அர்த்தமுள்ள மாற்றத்தை ஏற்படுத்தும் ஆற்றல் கொண்டது.',
    },
    'bslcxq39': {
      'en': 'Visualise expenses',
      'hi': 'खर्चों की कल्पना करें',
      'ta': 'செலவுகளைக் காட்சிப்படுத்தவும்',
    },
    'pia6kkd7': {
      'en':
          'Ever thought you had spent too much money and had a hard time realizing it late? No problem, we have got your back. Now with our app\'s new functionality, you can now visualize how much money you have spent and where you have spent.',
      'hi':
          'क्या आपने कभी सोचा है कि आपने बहुत अधिक पैसा खर्च किया है और इसे देर से समझने में कठिनाई हो रही है? कोई बात नहीं, हमें आपकी पीठ मिल गई है। अब हमारे ऐप की नई कार्यक्षमता के साथ, अब आप कल्पना कर सकते हैं कि आपने कितना पैसा खर्च किया है और आपने कहाँ खर्च किया है।',
      'ta':
          'நீங்கள் எப்போதாவது அதிக பணத்தை செலவழித்தீர்கள் என்று நினைத்தீர்களா? பரவாயில்லை, நாங்கள் உங்கள் ஆதரவைப் பெற்றுள்ளோம். இப்போது எங்கள் பயன்பாட்டின் புதிய செயல்பாட்டின் மூலம், நீங்கள் எவ்வளவு பணம் செலவழித்தீர்கள், எங்கு செலவழித்தீர்கள் என்பதை இப்போது பார்க்கலாம்.',
    },
    '6jy19b8l': {
      'en': 'Get started',
      'hi': 'शुरू हो जाओ',
      'ta': 'தொடங்குங்கள்',
    },
    '2hgdjb6s': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // PhoneNo
  {
    'l10cw8n9': {
      'en': 'Phone Number',
      'hi': 'फ़ोन नंबर',
      'ta': 'தொலைபேசி எண்',
    },
    'piufchgg': {
      'en': 'Type in your phone number which is linked with your bank ',
      'hi': 'अपना फ़ोन नंबर टाइप करें जो आपके बैंक से जुड़ा हुआ है',
      'ta': 'உங்கள் வங்கியுடன் இணைக்கப்பட்டுள்ள உங்கள் ஃபோன் எண்ணை உள்ளிடவும்',
    },
    'j4fiiurg': {
      'en': 'Your Phone Number',
      'hi': 'आपका फोन नंबर',
      'ta': 'உங்கள் தொலைபேசி எண்',
    },
    'jm9rtfsr': {
      'en': 'Please enter a valid number...',
      'hi': 'कृपया सही अंक दर्ज करें...',
      'ta': 'சரியான எண்ணை உள்ளிடவும்...',
    },
    'klz9nzwy': {
      'en': 'Verify',
      'hi': 'सत्यापित करना',
      'ta': 'சரிபார்க்கவும்',
    },
    'xhut7336': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // OtpVerification
  {
    '6ieg6io8': {
      'en': 'Enter Your OTP Below',
      'hi': 'अपना ओटीपी नीचे दर्ज करें',
      'ta': 'உங்கள் OTPயை கீழே உள்ளிடவும்',
    },
    'ffx1dl67': {
      'en': 'Confirm your Code',
      'hi': 'अपने कोड की पुष्टि करें',
      'ta': 'உங்கள் குறியீட்டை உறுதிப்படுத்தவும்',
    },
    'gxqvkgd0': {
      'en': 'Confirm & Continue',
      'hi': 'पुष्टि करें और जारी रखें',
      'ta': 'உறுதிசெய்து தொடரவும்',
    },
    '4xpq2kj4': {
      'en': 'OTP Verification',
      'hi': 'ओटीपी सत्यापन',
      'ta': 'OTP சரிபார்ப்பு',
    },
    'uxj50n6b': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // Investment
  {
    'wfy8hwcw': {
      'en': 'Investment schemes',
      'hi': 'निवेश योजनाएं',
      'ta': 'முதலீட்டு திட்டங்கள்',
    },
    'o8cjcz9w': {
      'en': 'By Government of India',
      'hi': 'भारत सरकार द्वारा',
      'ta': 'இந்திய அரசாங்கத்தால்',
    },
    '1wzqexqf': {
      'en': 'Schemes',
      'hi': 'योजनाओं',
      'ta': 'திட்டங்கள்',
    },
    '09azw531': {
      'en': 'Public Provident Fund\n(PPF)',
      'hi': 'सामान्य भविष्य निधि\n(पीपीएफ)',
      'ta': 'பொது வருங்கால வைப்பு நிதி\n(பிபிஎஃப்)',
    },
    'iiwe6iom': {
      'en':
          'Deposit up to Rs. 1.5 lakh per annum and earn tax-free interest on your investment. The tenure of the PPF account is 15 years, and it can be extended for another 5 years',
      'hi':
          'रुपये तक जमा करें। 1.5 लाख प्रति वर्ष और अपने निवेश पर कर-मुक्त ब्याज अर्जित करें। पीपीएफ खाते की अवधि 15 साल है और इसे 5 साल के लिए और बढ़ाया जा सकता है',
      'ta':
          'ரூ. வரை வைப்பு. ஆண்டுக்கு 1.5 லட்சம் மற்றும் உங்கள் முதலீட்டிற்கு வரி இல்லாத வட்டியைப் பெறுங்கள். PPF கணக்கின் காலம் 15 ஆண்டுகள், மேலும் 5 ஆண்டுகளுக்கு நீட்டிக்கப்படலாம்',
    },
    'xwmlqr47': {
      'en': 'Invest',
      'hi': 'निवेश करना',
      'ta': 'முதலீடு செய்யுங்கள்',
    },
    'y1fk47tu': {
      'en': 'National Savings Certificate (NSC)',
      'hi': 'राष्ट्रीय बचत प्रमाणपत्र (एनएससी)',
      'ta': 'தேசிய சேமிப்புச் சான்றிதழ் (NSC)',
    },
    'o7o1wgjy': {
      'en':
          'Savings bond scheme which allows to invest in a fixed deposit-like scheme for a period of 5 or 10 years. The interest rate on NSC is fixed, and the investment is eligible for tax benefits.',
      'hi':
          'बचत बांड योजना जो सावधि जमा जैसी योजना में 5 या 10 वर्ष की अवधि के लिए निवेश करने की अनुमति देती है। एनएससी पर ब्याज दर तय है, और निवेश कर लाभ के लिए पात्र है।',
      'ta':
          '5 அல்லது 10 வருட காலத்திற்கு நிலையான வைப்பு போன்ற திட்டத்தில் முதலீடு செய்ய அனுமதிக்கும் சேமிப்பு பத்திர திட்டம். NSC மீதான வட்டி விகிதம் நிர்ணயிக்கப்பட்டுள்ளது, மேலும் முதலீடு வரிச் சலுகைகளுக்குத் தகுதியானது.',
    },
    '91x4youu': {
      'en': 'Invest',
      'hi': 'निवेश करना',
      'ta': 'முதலீடு செய்யுங்கள்',
    },
    'p0a97xs7': {
      'en': 'Sukanya Samriddhi Yojana\n (SSY)',
      'hi': 'सुकन्या समृद्धि योजना\n (एसएसवाई)',
      'ta': 'சுகன்யா சம்ரித்தி யோஜனா\n (SSY)',
    },
    't4002hoe': {
      'en':
          'Aimed at promoting the welfare of the girl child. The scheme allows individuals to open an account in the name of their daughter and deposit up to Rs. 1.5 lakh per annum. ',
      'hi':
          'बालिका कल्याण को बढ़ावा देने के उद्देश्य से। यह योजना व्यक्तियों को अपनी बेटी के नाम पर खाता खोलने और रुपये तक जमा करने की अनुमति देती है। 1.5 लाख प्रति वर्ष।',
      'ta':
          'பெண் குழந்தைகளின் நலனை மேம்படுத்துவதை நோக்கமாகக் கொண்டது. இந்தத் திட்டம் தனிநபர்கள் தங்கள் மகளின் பெயரில் ஒரு கணக்கைத் திறந்து ரூ. ஆண்டுக்கு 1.5 லட்சம்.',
    },
    'kbhzsiwc': {
      'en': 'Invest',
      'hi': 'निवेश करना',
      'ta': 'முதலீடு செய்யுங்கள்',
    },
    'ww72rjja': {
      'en': 'Overview',
      'hi': 'अवलोकन',
      'ta': 'கண்ணோட்டம்',
    },
    's58b012w': {
      'en': 'Investment market',
      'hi': 'निवेश बाजार',
      'ta': 'முதலீட்டு சந்தை',
    },
    'w30z6oaw': {
      'en': 'Indian Stock exchange',
      'hi': 'भारतीय स्टॉक एक्सचेंज',
      'ta': 'இந்திய பங்குச் சந்தை',
    },
    '7ow29hh0': {
      'en': 'Learning how to invest',
      'hi': 'सीखना कैसे निवेश करना है',
      'ta': 'எப்படி முதலீடு செய்வது என்று கற்றுக்கொள்வது',
    },
    '4wim12mw': {
      'en': 'Financial updates',
      'hi': 'वित्तीय अद्यतन',
      'ta': 'நிதி புதுப்பிப்புகள்',
    },
    't24bc5ht': {
      'en': 'Financial experts',
      'hi': 'वित्तीय विशेषज्ञ',
      'ta': 'நிதி நிபுணர்கள்',
    },
    '3jhrqsk1': {
      'en': 'Tutorials',
      'hi': 'ट्यूटोरियल',
      'ta': 'பயிற்சிகள்',
    },
    'nhs7r6xr': {
      'en': 'Stock market',
      'hi': 'शेयर बाजार',
      'ta': 'பங்குச் சந்தை',
    },
    '9ablt5f0': {
      'en': 'Frequently Asked Questions',
      'hi': 'अक्सर पूछे जाने वाले प्रश्नों',
      'ta': 'அடிக்கடி கேட்கப்படும் கேள்விகள்',
    },
    '97f027ck': {
      'en': 'News updates',
      'hi': 'नए अपडेट',
      'ta': 'செய்தி புதுப்பிப்புகள்',
    },
    'mv1yy27x': {
      'en': 'Budget for 2023  released',
      'hi': '2023 का बजट जारी',
      'ta': '2023க்கான பட்ஜெட் வெளியிடப்பட்டது',
    },
    'mjdwajdx': {
      'en': 'announced by the financial minister\nand RBI',
      'hi': 'वित्त मंत्री द्वारा घोषित\nऔर आरबीआई',
      'ta': 'நிதி அமைச்சர் அறிவித்தார்\nமற்றும் ஆர்.பி.ஐ',
    },
    '1fdex7e8': {
      'en': 'No tax on agricultural products',
      'hi': 'कृषि उत्पादों पर कोई कर नहीं',
      'ta': 'விவசாயப் பொருட்களுக்கு வரி இல்லை',
    },
    'k57p013b': {
      'en': 'indian farmers celebrate by burning ...',
      'hi': 'आग लगा कर जश्न मनाते भारतीय किसान...',
      'ta': 'இந்திய விவசாயிகள் எரித்து கொண்டாடுகிறார்கள்...',
    },
    'hm17wyli': {
      'en': 'Election for 2024',
      'hi': '2024 के लिए चुनाव',
      'ta': '2024க்கான தேர்தல்',
    },
    'h3ovfjme': {
      'en': 'Pime minister election ',
      'hi': 'पिम मंत्री चुनाव',
      'ta': 'பிரதமர் தேர்தல்',
    },
    '3n7m2g8h': {
      'en': 'Invest',
      'hi': 'निवेश करना',
      'ta': 'முதலீடு செய்யுங்கள்',
    },
  },
  // paymentpage
  {
    '1xtpf7ts': {
      'en': 'Enter amount',
      'hi': 'राशि डालें',
      'ta': 'தொகையை உள்ளிடவும்',
    },
    'jqlilyqv': {
      'en': '1000₹',
      'hi': '1000₹',
      'ta': '1000₹',
    },
    '0jk2mcc9': {
      'en': 'Paying for',
      'hi': 'के लिए भुगतान',
      'ta': 'செலுத்துகிறது',
    },
    'lonvu3v8': {
      'en': 'Shopping',
      'hi': 'खरीदारी',
      'ta': 'கடையில் பொருட்கள் வாங்குதல்',
    },
    'gri1mjvb': {
      'en': 'Food',
      'hi': 'खाना',
      'ta': 'உணவு',
    },
    'p38rwf41': {
      'en': 'Travel',
      'hi': 'यात्रा',
      'ta': 'பயணம்',
    },
    '49jlgrn4': {
      'en': 'Entertainent',
      'hi': 'मनोरंजक',
      'ta': 'பொழுதுபோக்கு',
    },
    '63cqzw5u': {
      'en': 'Bills',
      'hi': 'विधेयकों',
      'ta': 'பில்கள்',
    },
    '1a6mq8fl': {
      'en': 'Other',
      'hi': 'अन्य',
      'ta': 'மற்றவை',
    },
    's550u3xz': {
      'en': 'Charity Name',
      'hi': 'दान का नाम',
      'ta': 'தொண்டு பெயர்',
    },
    'd20md1zp': {
      'en': '[Price]',
      'hi': '[कीमत]',
      'ta': '[விலை]',
    },
    'ccl50q2v': {
      'en': 'Subtotal',
      'hi': 'उप-योग',
      'ta': 'கூட்டுத்தொகை',
    },
    '3wzsngt1': {
      'en': '1000',
      'hi': '1000',
      'ta': '1000',
    },
    'pa65oshz': {
      'en': 'Total',
      'hi': 'कुल',
      'ta': 'மொத்தம்',
    },
    'sad2l9yw': {
      'en': '1010',
      'hi': '1010',
      'ta': '1010',
    },
    'hmwzuv66': {
      'en': 'Donate',
      'hi': 'दान देना',
      'ta': 'தானம் செய்',
    },
    'clr3dvga': {
      'en': '10',
      'hi': '10',
      'ta': '10',
    },
    's9jbemc8': {
      'en': 'Pay now',
      'hi': 'अब भुगतान करें',
      'ta': 'இப்போது செலுத்த',
    },
    'h3bcskbd': {
      'en': 'Payment page',
      'hi': 'भुगतान पृष्ठ',
      'ta': 'பணம் செலுத்தும் பக்கம்',
    },
    '3t6p6pog': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // PaymentPin
  {
    '7iby5vhy': {
      'en': 'Enter Your Security Pin',
      'hi': 'अपना सुरक्षा पिन दर्ज करें',
      'ta': 'உங்கள் பாதுகாப்பு பின்னை உள்ளிடவும்',
    },
    'as5j2k4s': {
      'en': 'Confirm & Continue',
      'hi': 'पुष्टि करें और जारी रखें',
      'ta': 'உறுதிசெய்து தொடரவும்',
    },
    'gooa65wg': {
      'en': 'Enter Pin',
      'hi': 'पिन दर्ज करें',
      'ta': 'பின்னை உள்ளிடவும்',
    },
    'atiysf3q': {
      'en': 'Home',
      'hi': 'घर',
      'ta': 'வீடு',
    },
  },
  // profile
  {
    '0xh5k3aq': {
      'en': 'Andrew',
      'hi': 'एंड्रयू',
      'ta': 'ஆண்ட்ரூ',
    },
    'nwuft4c9': {
      'en': 'Balance',
      'hi': 'संतुलन',
      'ta': 'இருப்பு',
    },
    '6cs60v2b': {
      'en': '₹17,593',
      'hi': '₹17,593',
      'ta': '₹17,593',
    },
    '0tbp0h7z': {
      'en': 'andrewtate@okicici',
      'hi': 'andrewtate@okicici',
      'ta': 'andrewtate@okicici',
    },
    '6cff3m1b': {
      'en': 'Phone Number Linked',
      'hi': 'फ़ोन नंबर जुड़ा हुआ है',
      'ta': 'தொலைபேசி எண் இணைக்கப்பட்டுள்ளது',
    },
    'jbz2d02o': {
      'en': '*******417',
      'hi': '*******417',
      'ta': '*******417',
    },
    'bckhhhoi': {
      'en': 'Bank Name',
      'hi': 'बैंक का नाम',
      'ta': 'வங்கி பெயர்',
    },
    'k32ihxat': {
      'en': 'ICICI Bank 0035',
      'hi': 'आईसीआईसीआई बैंक 0035',
      'ta': 'ஐசிஐசிஐ வங்கி 0035',
    },
    'vw2ttbou': {
      'en': 'Savings Account\nPrimary',
      'hi': 'बचत खाता\nप्राथमिक',
      'ta': 'சேமிப்பு கணக்கு\nமுதன்மை',
    },
    'u6ff280h': {
      'en': 'Language',
      'hi': 'भाषा',
      'ta': 'மொழி',
    },
    '8aut0zms': {
      'en': 'Tamil',
      'hi': 'तामिल',
      'ta': 'தமிழ்',
    },
    '9nc11032': {
      'en': 'English',
      'hi': 'अंग्रेज़ी',
      'ta': 'ஆங்கிலம்',
    },
    '81uwkmpk': {
      'en': 'Hindi',
      'hi': 'हिंदी',
      'ta': 'ஹிந்தி',
    },
    'ulg4fo57': {
      'en': 'Theme',
      'hi': 'थीम',
      'ta': 'தீம்',
    },
    'e18twkv7': {
      'en': 'Light',
      'hi': 'रोशनी',
      'ta': 'ஒளி',
    },
    'wsw0k8u8': {
      'en': 'Dark',
      'hi': 'अँधेरा',
      'ta': 'இருள்',
    },
    't5g0jj89': {
      'en': 'Details',
      'hi': 'विवरण',
      'ta': 'விவரங்கள்',
    },
  },
].reduce((a, b) => a..addAll(b));
