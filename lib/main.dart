import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholar_chat/Provicers/user_data_provider.dart';
import 'package:scholar_chat/pages/chat_screen.dart';
import 'package:scholar_chat/pages/sign_up_page/sign_up_screen.dart';
import 'package:scholar_chat/pages/signin_page/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Provicers/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ScholarChatApp());
}

class ScholarChatApp extends StatelessWidget {
  int x = 5;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (context) => AuthService()),
        Provider<UserProvider>(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        routes: {
          SignUpScreen.id: (context) => SignUpScreen(),
          SigninScreen.id: (context) => SigninScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
        initialRoute: SigninScreen.id,
      ),
    );
  }
}
