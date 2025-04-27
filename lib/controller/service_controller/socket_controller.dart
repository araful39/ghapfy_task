import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket _socket;
  bool _connected = false;
  final String userId = '42'; // Replace with actual user ID from your auth system

  factory SocketService() => _instance;

  SocketService._internal() {
    _initSocket();
  }

  void _initSocket() {
    // Correct the URL format - remove the incorrect 'ws://' prefix from HTTPS
    final serverUrl = 'https://task.theghapfy.com';
    
    _socket = IO.io(serverUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
      'query': {'userId': userId}, // Pass userId as query parameter
      'path': '/socket.io', // Standard Socket.IO endpoint
      'secure': true, // Required for HTTPS
      'reconnection': true,
      'reconnectionAttempts': 5,
      'reconnectionDelay': 1000,
    });

    // Setup event listeners
    _socket.onConnect((_) {
      _connected = true;
      print('Socket connected with ID: ${_socket.id}');
    });

    _socket.onDisconnect((_) {
      _connected = false;
      print('Socket disconnected');
    });

    _socket.onConnectError((err) => print('Connection error: $err'));
    _socket.onError((err) => print('Socket error: $err'));
  }

  // Join a specific post's comment room
  void joinPostRoom(int postId) {
    if (_connected) {
      _socket.emit('join:post', {'postId': postId, 'userId': userId});
    }
  }

  // Leave a post's comment room
  void leavePostRoom(int postId) {
    if (_connected) {
      _socket.emit('leave:post', {'postId': postId, 'userId': userId});
    }
  }

  // Listen for new comments on a post
  void listenForComments(void Function(dynamic) callback) {
    _socket.on('comment:new', callback);
  }

  // Stop listening for comments
  void stopListeningForComments() {
    _socket.off('comment:new');
  }

  // Send a new comment
  void sendComment(int postId, String commentText) {
    if (_connected) {
      _socket.emit('comment:create', {
        'postId': postId,
        'text': commentText,
        'userId': userId,
        'timestamp': DateTime.now().toIso8601String(),
      });
    }
  }

  void dispose() {
    _socket.disconnect();
    _socket.dispose();
  }
}