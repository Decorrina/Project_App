import 'package:flutter/material.dart';
import 'package:graduation_project/AI%20Model/chat_api.dart';
import 'package:graduation_project/AI%20Model/models/Message.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];
  final TextEditingController _controller = TextEditingController();
  bool _showChatInput = false;
  bool _collectingRoomInfo = false;
  bool _isTyping = false;
  Map<String, dynamic> _roomQuery = {};
  int _roomStep = 0;

  final List<Map<String, dynamic>> _initialOptions = [
    {"label": "What is StudentHousing Hub?", "icon": Icons.info},
    {"label": "Search Rooms with AI Model", "icon": Icons.search},
    {"label": "Chat with AI", "icon": Icons.chat},
  ];

  void _handleOptionSelected(String option) {
    if (option == "What is StudentHousing Hub?") {
      _addBotMessage("StudentHub helps students find rooms near universities easily by filtering preferences like price, type, and location.");
    } else if (option == "Search Rooms with AI Model") {
      setState(() {
        _collectingRoomInfo = true;
        _roomQuery = {};
        _roomStep = 0;
      });
      _askNextRoomStep();
    } else if (option == "Chat with AI") {
      setState(() {
        _showChatInput = true;
      });
    }
  }

  void _askNextRoomStep() {
    List<String> prompts = [
      "Enter minimum price:",
      "Enter maximum price:",
      "Resident type (male/female):",
      "Room size (small/medium/large):"
    ];
    _addBotMessage(prompts[_roomStep]);
  }

  void _handleRoomResponse(String text) async {
    switch (_roomStep) {
      case 0:
        _roomQuery['min_price'] = int.tryParse(text);
        break;
      case 1:
        _roomQuery['max_price'] = int.tryParse(text);
        break;
      case 2:
        _roomQuery['resident_type'] = text.toLowerCase();
        break;
      case 3:
        _roomQuery['room_size'] = text.toLowerCase();
        break;
    }
    _roomStep++;

    if (_roomStep < 4) {
      _askNextRoomStep();
    } else {
      setState(() {
        _collectingRoomInfo = false;
      });
      await _searchRoomsWithModel();
    }
  }

  int _convertRoomSize(String size) {
    switch (size.toLowerCase()) {
      case 'small':
        return 1;
      case 'medium':
        return 2;
      case 'large':
        return 3;
      default:
        return 2;
    }
  }

  Future<void> _searchRoomsWithModel() async {
    _addBotMessage("Searching rooms based on your preferences...");
    try {
      final response = await http.post(
        Uri.parse("http://127.0.0.1:5000/recommend"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "min_price": _roomQuery['min_price'],
          "max_price": _roomQuery['max_price'],
          "gender": _roomQuery['resident_type'],
          "room_size": _convertRoomSize(_roomQuery['room_size']),
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data.isEmpty) {
          _addBotMessage("No rooms matched your preferences.");
        } else {
          String formatted = data.map<String>((room) =>
              "- ${room['Title']} | ${room['Price']} | ${room['Gender']} | ${room['No_Beds']} beds").join("\n");
          _addBotMessage("Found ${data.length} room(s):\n$formatted");
        }
      } else {
        _addBotMessage("Error fetching rooms: ${response.statusCode}");
      }
    } catch (e) {
      _addBotMessage("Something went wrong: $e");
    }
  }

  void _handleSubmitted(String text) {
    if (text.trim().isEmpty) return;
    _controller.clear();
    _addUserMessage(text);

    if (_collectingRoomInfo) {
      _handleRoomResponse(text);
    } else {
      _getChatbotResponse(text);
    }
  }

  void _addUserMessage(String text) {
    setState(() {
      _messages.insert(0, Message(text: text, isUser: true));
    });
  }

  void _addBotMessage(String text) {
    setState(() {
      _isTyping = false;
      _messages.insert(0, Message(text: text, isUser: false));
    });
  }

  Future<void> _getChatbotResponse(String text) async {
    setState(() {
      _isTyping = true;
    });
    final botResponse = await ChatApi.getBotResponse(text);
    _addBotMessage(botResponse);
  }

  void _goBackToMenu() {
    setState(() {
      _showChatInput = false;
      _collectingRoomInfo = false;
      _messages.clear();
      _controller.clear();
      _isTyping = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(title: Text("Chatbot")),
      body: Column(
        children: <Widget>[
          if (!_showChatInput && !_collectingRoomInfo)
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: _initialOptions.map((option) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                          child: SizedBox(
                            height: 60,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                textStyle: TextStyle(fontSize: 18),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              onPressed: () => _handleOptionSelected(option['label']),
                              icon: Icon(option['icon'], size: 24),
                              label: Text(option['label']),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : Wrap(
                      spacing: 8.0,
                      children: _initialOptions.map((option) {
                        return ElevatedButton.icon(
                          onPressed: () => _handleOptionSelected(option['label']),
                          icon: Icon(option['icon']),
                          label: Text(option['label']),
                        );
                      }).toList(),
                    ),
            ),
          if (_showChatInput || _collectingRoomInfo)
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: TextButton.icon(
                  onPressed: _goBackToMenu,
                  icon: Icon(Icons.arrow_back),
                  label: Text("Back to Menu"),
                ),
              ),
            ),
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length + (_isTyping ? 1 : 0),
              itemBuilder: (BuildContext context, int index) {
                if (_isTyping && index == 0) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text("Typing...", style: TextStyle(color: Colors.black87)),
                    ),
                  );
                }
                final Message message = _messages[_isTyping ? index - 1 : index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message.isUser ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      message.text,
                      style: TextStyle(color: message.isUser ? Colors.white : Colors.black87),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(height: 1.0),
          if (_showChatInput || _collectingRoomInfo)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: Theme.of(context).cardColor,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      onSubmitted: _handleSubmitted,
                      decoration: InputDecoration.collapsed(hintText: "Type your message"),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () => _handleSubmitted(_controller.text),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
