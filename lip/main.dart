import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
WidgetsFlutterBinding.ensureInitialized();
SystemChrome.setSystemUIOverlayStyle(
const SystemUiOverlayStyle(
statusBarColor: Colors.transparent,
statusBarIconBrightness: Brightness.dark,
,)
;)
runApp(const MizaniqApp());
}
class MizaniqApp extends StatelessWidget {
const MizaniqApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
,'ﻣﯿﺰاﻧﯿﻖ' :title
debugShowCheckedModeBanner: false,
theme: ThemeData(
colorScheme: ColorScheme.fromSeed(
seedColor: const Color(0xFF1A73E8),
brightness: Brightness.light,
,)
useMaterial3: true,
,)
home: const SplashScreen(),
;)
}
}
// =================== Splash Screen ===================
class SplashScreen extends StatefulWidget {
const SplashScreen({super.key});
@override
State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>
with SingleTickerProviderStateMixin {
late AnimationController _controller;
late Animation<double> _fadeAnimation;
late Animation<double> _scaleAnimation;
@override
void initState() {
super.initState();
_controller = AnimationController(
duration: const Duration(milliseconds: 1500),
vsync: this,
);
_fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
CurvedAnimation(parent: _controller, curve: Curves.easeIn),
_scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
);
);
_controller.forward();
Timer(const Duration(seconds: 2), () {
if (mounted) {
Navigator.of(context).pushReplacement(
PageRouteBuilder(
pageBuilder: (_, __, ___) => const WebViewScreen(),
transitionsBuilder: (_, animation, __, child) =>
FadeTransition(opacity: animation, child: child),
transitionDuration: const Duration(milliseconds: 500),
),
);
}
});
}
@override
void dispose() {
_controller.dispose();
super.dispose();
}
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xFF1A73E8),
body: Center(
child: FadeTransition(
opacity: _fadeAnimation,
child: ScaleTransition(
scale: _scaleAnimation,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Container(
width: 120,
height: 120,
decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(30),
boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.2),
blurRadius: 20,
offset: const Offset(0, 10),
,)
,]
,)
child: const Center(
child: Text(
,'م'
style: TextStyle(
fontSize: 64,
fontWeight: FontWeight.bold,
color: Color(0xFF1A73E8),
,)
,)
,)
,)
const SizedBox(height: 24),
const Text(
,'ﻣﯿﺰاﻧﯿﻖ'
style: TextStyle(
fontSize: 32,
fontWeight: FontWeight.bold,
color: Colors.white,
letterSpacing: 1.2,
,)
,)
const SizedBox(height: 8),
Text(
'mizaniq.online',
style: TextStyle(
fontSize: 14,
color: Colors.white.withOpacity(0.8),
),
),
const SizedBox(height: 48),
const SizedBox(
width: 40,
height: 40,
child: CircularProgressIndicator(
color: Colors.white,
strokeWidth: 3,
),
),
],
),
),
),
),
);
}
}
// =================== WebView Screen ===================
class WebViewScreen extends StatefulWidget {
const WebViewScreen({super.key});
@override
State<WebViewScreen> createState() => _WebViewScreenState();
}
class _WebViewScreenState extends State<WebViewScreen> {
late final WebViewController _controller;
bool _isLoading = true;
bool _hasError = false;
double _loadingProgress = 0;
final String _url = 'https://www.mizaniq.online';
@override
void initState() {
super.initState();
_initWebView();
}
void _initWebView() {
_controller = WebViewController()
..setJavaScriptMode(JavaScriptMode.unrestricted)
..setBackgroundColor(Colors.white)
..setNavigationDelegate(
NavigationDelegate(
onPageStarted: (url) {
setState(() {
_isLoading = true;
_hasError = false;
_loadingProgress = 0;
});
},
onProgress: (progress) {
setState(() => _loadingProgress = progress / 100);
},
onPageFinished: (url) {
setState(() {
_isLoading = false;
_loadingProgress = 1;
});
},
onWebResourceError: (error) {
setState(() {
_isLoading = false;
_hasError = true;
});
},
onNavigationRequest: (request) {
return NavigationDecision.navigate;
},
),
)
..loadRequest(Uri.parse(_url));
}
void _loadPage() {
setState(() {
_isLoading = true;
_hasError = false;
});
_controller.loadRequest(Uri.parse(_url));
}
@override
Widget build(BuildContext context) {
return PopScope(
canPop: false,
onPopInvoked: (didPop) async {
if (!didPop) {
final canGoBack = await _controller.canGoBack();
if (canGoBack) {
_controller.goBack();
} else {
if (context.mounted) {
showDialog(
context: context,
builder: (ctx) => AlertDialog(
,)'ﺧﺮوج'(title: const Text
,)'ھﻞ ﺗﺮﯾﺪ اﻟﺨﺮوج ﻣﻦ اﻟﺘﻄﺒﯿﻖ؟'(content: const Text
actions: [
TextButton(
onPressed: () => Navigator.of(ctx).pop(),
,)'ﻻ'(child: const Text
,)
TextButton(
onPressed: () => SystemNavigator.pop(),
,)'ﻧﻌﻢ'(child: const Text
,)
,]
,)
;)
}
}
}
,}
child: Scaffold(
body: SafeArea(
child: Stack(
children: [
// Error screen
if (_hasError)
_buildErrorWidget()
// WebView
else
WebViewWidget(controller: _controller),
// Loading progress bar
if (_isLoading && !_hasError)
Positioned(
top: 0,
left: 0,
right: 0,
child: LinearProgressIndicator(
value: _loadingProgress,
minHeight: 3,
backgroundColor: Colors.transparent,
valueColor: const AlwaysStoppedAnimation<Color>(
Color(0xFF1A73E8),
,)
,)
,)
,]
,)
,)
,)
;)
}
Widget _buildErrorWidget() {
return Center(
child: Padding(
padding: const EdgeInsets.all(32),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
Icon(Icons.error_outline_rounded, size: 80, color: Colors.red[300]),
const SizedBox(height: 24),
const Text(
ر ﺗﺤﻤﯿﻞ اﻟﺼﻔﺤﺔ'
ّ
,'ﺗﻌﺬ
style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
textAlign: TextAlign.center,
,)
const SizedBox(height: 12),
Text(
.ﺣﺪث ﺧﻄﺄ أﺛﻨﺎء ﺗﺤﻤﯿﻞ اﻟﻤﻮﻗﻊ. ﯾﺮﺟﻰ اﻟﺘﺤﻘﻖ ﻣﻦ اﺗﺼﺎﻟﻚ ﺑﺎﻹﻧﺘﺮﻧﺖ واﻟﻤﺤﺎوﻟﺔ ﻣﺮة أﺧﺮى'
style: TextStyle(fontSize: 14, color: Colors.grey[600]),
textAlign: TextAlign.center,
,)
const SizedBox(height: 32),
ElevatedButton.icon(
onPressed: _loadPage,
icon: const Icon(Icons.refresh),
,)'إﻋﺎدة اﻟﺘﺤﻤﯿﻞ'(label: const Text
style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xFF1A73E8),
foregroundColor: Colors.white,
padding:
const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(12),
,)
,)
,)
,]
,)
,)
}
}
);
