import 'package:f11_chatapp_auth_and_push/core/models/chat_user.dart';
import 'package:f11_chatapp_auth_and_push/core/services/auth/auth_service.dart';
import 'package:f11_chatapp_auth_and_push/pages/auth_page.dart';
import 'package:f11_chatapp_auth_and_push/pages/chat_page.dart';
import 'package:f11_chatapp_auth_and_push/pages/loading_page.dart';
import 'package:flutter/material.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        //gera elementos ChatUser
        stream: AuthService()
            .userChanges, //stream de dados - com essa stream vai escolher a tela que deve ser carregada
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage(); //autenticando
          } else {
            //se tem usuario vai para ChatPage, caso contrario AuthPage
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
      ),
    );
  }
}
