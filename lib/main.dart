import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(const HeloisaApp());

class HeloisaApp extends StatelessWidget {
  const HeloisaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assistente Heloísa',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: const ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final _messages = <Map<String, String>>[];
  bool _loading = false;

  static const _backendUrl = 'https://memoriaitaboraiense.shop';

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': text});
      _loading = true;
    });
    _controller.clear();

    try {
      final res = await http.post(
        Uri.parse(_backendUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': text}),
      );
      final data = jsonDecode(res.body);
      setState(() {
        _messages.add({'role': 'heloisa', 'text': data['reply'] ?? '...'});
      });
    } catch (e) {
      setState(() {
        _messages.add({'role': 'heloisa', 'text': 'Não consegui responder agora.'});
      });
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assistente Heloísa')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final m = _messages[i];
                final isUser = m['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.brown.shade200 : Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(m['text'] ?? ''),
                  ),
                );
              },
            ),
          ),
          if (_loading) const LinearProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Escreva para a Heloísa...',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _send(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _loading ? null : _send,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
