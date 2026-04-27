import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/message.dart';

class ChatApiException implements Exception {
  final String message;
  ChatApiException(this.message);

  @override
  String toString() => message;
}

class ChatService {
  static const String _baseUrl = 'https://api.durjoyai.com';
  static const String _apiKey = 'sk-LvqSBOf80jxFCYNvf6vPpQ';
  static const String _model = 'durjoy-kotha-1';

  static const String _systemPrompt =
      'You are Durjoy, a friendly and helpful AI assistant. '
      'Keep your answers clear, concise, and easy to understand. '
      'Use relevant emojis naturally throughout your replies to make them '
      'feel warm and expressive (for example: 👋 when greeting, 😊 when being '
      'friendly, 💡 for ideas, ✅ for confirmations, ⚠️ for warnings, 🚀 for '
      'excitement). Do not overuse them — usually 1 to 3 per reply is enough.';

  Future<String> sendMessage(List<Message> history) async {
    final uri = Uri.parse('$_baseUrl/v1/chat/completions');

    final body = {
      'model': _model,
      'messages': [
        {'role': 'system', 'content': _systemPrompt},
        ...history.map((m) => m.toApiJson()).toList(),
      ],
      'temperature': 0.7,
    };

    try {
      final response = await http
          .post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode(body),
      )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode < 200 || response.statusCode >= 300) {
        throw ChatApiException(
          'Server returned ${response.statusCode}. Please try again.',
        );
      }

      final decoded = jsonDecode(utf8.decode(response.bodyBytes));
      final choices = decoded['choices'];
      if (choices is! List || choices.isEmpty) {
        throw ChatApiException('No response from the assistant.');
      }

      final messageObj = choices.first['message'];
      final content = messageObj?['content'];
      if (content is! String || content.trim().isEmpty) {
        throw ChatApiException('Empty response from the assistant.');
      }

      return content.trim();
    } on SocketException {
      throw ChatApiException('No internet connection. Please check your network.');
    } on TimeoutException {
      throw ChatApiException('The request timed out. Please try again.');
    } on FormatException {
      throw ChatApiException('Unexpected response from the server.');
    } on ChatApiException {
      rethrow;
    } catch (_) {
      throw ChatApiException('Something went wrong. Please try again.');
    }
  }
}