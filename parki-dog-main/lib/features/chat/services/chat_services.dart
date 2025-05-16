import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

typedef NewMessageCallback = void Function(Map<String, dynamic> message);
typedef TypingCallback = void Function(Map<String, dynamic> data);
typedef StopTypingCallback = void Function(Map<String, dynamic> data);

class SocketService {
  late io.Socket _socket;

  // Optional: Expose the socket if needed
  io.Socket get socket => _socket;

  /// Connect to the Socket.IO server.
  ///
  /// Pass your token and optionally callbacks for events.
  void connect({
    required String token,
    required String chatId,
    required NewMessageCallback onNewMessage,
    TypingCallback? onTyping,
    StopTypingCallback? onStopTyping,
  }) {
    // Initialize the socket connection. Adjust the URL and options as needed.
    _socket = io.io(
      'https://m-alnagar.onrender.com',
      <String, dynamic>{
        'transports': ['websocket'],
        'upgrade': false,
        'auth': {'token': token},
      },
    );

    _socket.onConnect((_) {
      debugPrint('Socket connected');
      // Join the chat room (similar to socket.emit('joinChat', chatId) in your HTML)
      _socket.emit('joinChat', chatId);
    });

    // Listen for new messages
    _socket.on('newMessage', (data) {
      // data is expected to be a Map<String, dynamic>
      if (data is Map<String, dynamic>) {
        debugPrint('New message received: $data');
        onNewMessage(data);
      }
    });

    // Listen for typing events
    _socket.on('typing', (data) {
      if (data is Map<String, dynamic>) {
        debugPrint('Typing: $data');
        if (onTyping != null) {
          onTyping(data);
        }
      }
    });

    // Listen for stopTyping events
    _socket.on('stopTyping', (data) {
      if (data is Map<String, dynamic>) {
        debugPrint('Stop typing: $data');
        if (onStopTyping != null) {
          onStopTyping(data);
        }
      }
    });

    _socket.onDisconnect((_) => debugPrint('Socket disconnected'));
    _socket.onError((error) => debugPrint('Socket error: $error'));
  }

  /// Emit a typing event.
  void emitTyping({required String chatId, required Map<String, dynamic> user}) {
    _socket.emit('typing', {'chatId': chatId, 'user': user});
  }

  /// Emit a stopTyping event.
  void emitStopTyping({required String chatId, required String userId}) {
    _socket.emit('stopTyping', {'chatId': chatId, 'userId': userId});
  }

  /// Dispose the socket when not needed.
  void dispose() {
    _socket.dispose();
  }
}
