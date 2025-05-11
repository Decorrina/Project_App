// File: lib/chat_api.dart

import 'dart:convert';
import 'package:flutter/foundation.dart';   // <-- Add this
import 'package:http/http.dart' as http;

class ChatApi {
  static const _apiKey = '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';
  static const _apiUrl = 'https://openrouter.ai/api/v1/chat/completions';

  static Future<String> getBotResponse(String userMessage) async {
    try {
      final response = await http.post(
        Uri.parse(_apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_apiKey',
        },
        body: jsonEncode({
          "model": "mistralai/mistral-7b-instruct",
          "messages": [
            {"role": "system", "content": "You are a helpful assistant."},
            {"role": "user", "content": userMessage},
          ]
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'].trim();
      } else {
        debugPrint('OpenRouter error: ${response.statusCode} ${response.body}');
        return "Sorry, I couldn't get a response from the AI.";
      }
    } catch (e) {
      debugPrint('API exception: $e');
      return "Something went wrong. Please try again.";
    }
  }
}
