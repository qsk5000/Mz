mizaniq.online - ٮ+ﻄٮ)ٮ"ﻖ ﻣٮ"زاٮ$ٮ"ﻖ
iOS و Android ﻟـ WebView ٮ&ﻄٮ$ٮ"ﻖ
اﻟﻤٮ&ﻄﻠٮ$ﺎت
)أو أﺣﺪث 3.0.0( Flutter SDK
Android Studio أو VS Code
Xcode (ﻟـ iOS - ٮ-ﺤٮ*ﺎج Mac)
Git
ﻃريڡ & ﺔ اﻟٮ&ﺸﻌ 1 ٮ"ﻞ
ٮ+ثٮ)ٮ'ﺖ اﻟﺤﺰم .1
flutter pub get
Android ٮ+ﺸﻌ 0 ٮ'ﻞ ﻋﲆ .2
flutter run
ﻟﻠٮ5ﺸﺮ APK ٮ)ٮ5 ﺎء .3
flutter build apk --release
build/app/outputs/flutter-apk/app-release.apk :اﻟﻤﻠﻒ ﺳٮ-ﻜون ڡ1ى /
)Google Play ﻟﻠٮ5ﺸﺮ ﻋﲆ( App Bundle ٮ)ٮ5 ﺎء .4
flutter build appbundle --release
)Mac + Xcode ٮ'ﺤٮ+ﺎج( iOS ٮ)ٮ5 ﺎء .5
flutter build ios --release
ﻣﻤٮ"زات اﻟٮ&ﻄٮ$ٮ"ﻖ
ﻣٮDﺎﺷﺮة mizaniq.online ٮ-ڡ 1 ٮ*ﺢ ﻣﻮڡ*ﻊ
ﺣ D ﻤٮ-ﻠﺔ ﻋٮ1ﺪ اﻟڡ 1 ٮ*ﺢ Splash Screen ﺷﺎﺷﺔ
ﺷريﻂ ٮ*ﺤﻤٮ-ﻞ أٮJٮ1ﺎء ٮ*ﺼڡ 1 ﺢ اﻟﺼڡ 1 ﺤﺎت
)Back Button( ٮ-ﺪﻋﻢ زر اﻟﺮﺣ D وع
رﺳﺎﻟﺔ ٮ*ﺄﻛٮ-ﺪ ﻋٮ1ﺪ اﻟﺤ 1 روج ﻣﻦ اﻟٮ*ﻄٮDٮ-ﻖ
ﺷﺎﺷﺔ ﺣ 1 ﻄﺄ ﻣﻊ زر إﻋﺎدة اﻟٮ*ﺤﻤٮ-ﻞ
ٮDﺎﻟﲀﻣﻞ JavaScript ٮ-ﺪﻋﻢ
iOS و Android ٮ-ﺪﻋﻢ
ﻫٮ"كﻞ اﻟﻤﺸروع
mizaniq/
├── lib/
اﻟﻜﻮد اﻟﺮﺋﯿﺴﻲ ← main.dart ──└ │
├── android/
│ └── app/src/main/
│ └── AndroidManifest.xml
├── ios/
│ └── Runner/
│ └── Info.plist
إﻋﺪادات اﻟﻤﺸﺮوع واﻟﺤﺰم ← pubspec.yaml ──├
اﻟﺘﻮﺛﯿﻖ ← README.md ──└
ٮ&ﻌﺪٮ"ﻞ اﻟراٮ$ﻂ
:واٮDﺤﺚ ﻋﻦ lib/main.dart إذا أردت ٮ*ﻌ _ ٮ-يﺮ راٮDﻂ اﻟﻤﻮڡ*ﻊ، اڡ 1 ٮ*ﺢ
final String _url = 'https://www.mizaniq.online';
.وﻋ 1 ٮ-ّﺮه إﻟﻰ اﻟراٮDﻂ اﻟﺬي ٮ*ريﺪ
اﻟﺤﺰم اﻟﻤﺴٮ&ﺤ A ﺪﻣﺔ
اﻻﺳٮ*ﺤ ) ﺪام اﻟﺤﺰﻣﺔ
ﻋﺮض اﻟﻤﻮڡ*ﻊ داﺣ 1 ﻞ اﻟٮ*ﻄٮDٮ-ﻖ webview_flutter
إدارة اﻷٮ-ڡ * ﻮٮ1ﺎت flutter_launcher_icons
ﻟﻠﻤﺴﺎﻋﺪة
Flutter: flutter doctor ٮ*ﺄﻛﺪ ﻣﻦ ٮ*ثٮDٮ-ﺖ
flutter devices :ٮ*ﺄﻛﺪ ﻣﻦ اﻷﺣ D ﻬﺰة اﻟﻤٮ*ﺼﻠﺔ
)iOS ﻟﻠـ( Xcode و Android SDK ٮ*ﺄﻛﺪ ﻣﻦ ٮ*ثٮDٮ-ﺖ
اﻟٮ&ﺮﺣ A ٮ"ﺺ
.ﻫﺬا اﻟﻤﺸروع ﻣڡ 1 ٮ*وح اﻟﻤﺼﺪر وﻣٮ*ﺎح ﻟﻼﺳٮ*ﺤ 1 ﺪام اﻟﺤﺮ
