import 'package:f11_chatapp_auth_and_push/core/models/chat_massage.dart';
import 'package:f11_chatapp_auth_and_push/core/models/chat_user.dart';
import 'package:f11_chatapp_auth_and_push/core/services/chat/chat_firebase_service.dart';
import 'package:f11_chatapp_auth_and_push/core/services/chat/chat_mock_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();
  Future<ChatMessage?> save(String text, ChatUser user);

  factory ChatService() {
    //return ChatMockService();
    return ChatFirebaseService();
  }
}
