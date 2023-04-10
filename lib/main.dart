import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myapp/repo/btn/btn_cubit.dart';
import 'package:myapp/repo/login/auth_widgert.dart';
import 'package:myapp/repo/login/auth_widget_builder.dart';
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
        ],
        child: AuthWidgetBuilder(
          onPageBuilder: (context, snapshot) => MaterialApp(
            home: AuthWidget(snapshot: snapshot),
          ),
        ));
  }
}

// web       1:735287171844:web:c0bbf40bab3b5f4dc70e51
// android   1:735287171844:android:8dde0c1a824af925c70e51
// ios       1:735287171844:ios:f7504c9c8e90c85dc70e51