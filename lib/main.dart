import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/repo/btn/btn_cubit.dart';
import 'package:myapp/repo/login/auth_widgert.dart';
import 'package:myapp/repo/login/auth_widget_builder.dart';
import 'package:myapp/repo/login/google_login.dart';
import 'package:myapp/repo/login/repo_login.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => BtnTiklama()),
          Provider<MyLoginServices>(create: (context) => MyLoginServices()),
          Provider<GoogleLogin>(create: (context) => GoogleLogin()),
        ],
        child: AuthWidgetBuilder(
          onPageBuilder: (context, snapshot) => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AuthWidget(snapshot: snapshot),
          ),
        ));
  }
}

// web       1:735287171844:web:c0bbf40bab3b5f4dc70e51
// android   1:735287171844:android:8dde0c1a824af925c70e51
// ios       1:735287171844:ios:f7504c9c8e90c85dc70e51

    //  SHA1: 78:F0:18:AB:6D:60:13:A4:29:5A:2D:52:8D:6F:BE:A8:94:00:C8:9D
    //  SHA256: 0A:98:A5:EF:EC:7F:10:4C:E8:AC:51:E5:81:92:CB:D7:25:98:FD:FE:3A:F2:59:A2:5C:A7:C9:5B:0E:33:F9:A5