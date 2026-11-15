import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> getOpenRouterResponse(String userInput) async {
  const endpoint = 'https://openrouter.ai/api/v1/chat/completions';

  final headers = {
    'Authorization':
      String.fromEnvironment('OPENROUTER_API_KEY'),
    'Content-Type': 'application/json'
  };

  final body = jsonEncode({
    'model': 'gpt-3.5-turbo',
    'prompt': userInput,
    'max_tokens': 100,
    'temperature': 0.7,
  });
  final response = await http.post(
    Uri.parse(endpoint),
    headers: headers,
    body: body,
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);

    return data['choices'][0]['text'];
  } else {
    throw Exception('Failed to get response: ${response.body}');
  }
}
