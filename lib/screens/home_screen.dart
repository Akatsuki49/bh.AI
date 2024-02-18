import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/controllers/image_controller.dart';
import '/models/image_model.dart';
import '/models/quote_model.dart';
import '/services/api_service.dart';
import '/screens/auth/login_screen.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:emosense/widgets/filled_text_field.dart';
import 'package:emosense/widgets/message.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Message> messages = [
    Message(text: 'Hello!', isUser: false),
    Message(text: 'Hi there!', isUser: true),
    // Message(text: 'How are you?', isUser: false),
    // Message(text: 'I am fine, thank you!', isUser: true),
    // Message(text: 'What about you?', isUser: false),
    // Message(text: 'I am doing great!', isUser: true),
  ];
  final TextEditingController _messageController = TextEditingController();
  File? _imageFile;
  // bool _isLoading = false;

  // Method to take a picture using the device camera
  Future<void> _takePicture() async {
    final _picker = ImagePicker();
    final pickedImage = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
      });
    }
  }

  Future<void> sendDataToEndpoint(String message, File imageFile) async {
    try {
      // Encode the image file to base64
      List<int> imageBytes = await imageFile.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      // Prepare the data to be sent in the request body
      Map<String, dynamic> requestBody = {
        'text_input': message,
        'image': base64Image,
      };

      // Send a POST request to the endpoint
      final response = await http.post(
        // Uri.parse('http://192.168.197.1:5000/messages/face'),
        Uri.parse('http://172.16.128.173:5000/messages/face'),
        body: requestBody,
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print('Data sent successfully');
        print(response.body);
        setState(() {
          messages.add(Message(
              text: response.body,
              isUser:
                  false)); // Assuming Message is your model for displaying messages
        });
      } else {
        print('Failed to send data: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error sending data: $error');
    }
  }

  // Method to send a message and take a photo
  void _sendMessage() async {
    // Take a photo
    await _takePicture();

    // Get text message from the text controller
    final textMessage = _messageController.text;

    // Add the text message to the list of messages
    setState(() {
      messages.add(Message(text: textMessage, isUser: true));
    });

    // Clear the message input field
    _messageController.clear();

    // Send data to the endpoint
    await sendDataToEndpoint(textMessage, _imageFile!);

    // Simulate bot response with a delay
    // setState(() {
    //   _isLoading = true;
    // });
  }

  // Method to build the message input field
  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        children: [
          Expanded(
            child: FilledTextField(
              controller: _messageController,
              maxLines: 2,
              hintText: 'Type your message...',
            ),
          ),
          IconButton(
            icon: _imageFile != null
                ? Icon(Icons.camera_alt, color: Colors.grey[400])
                : Icon(Icons.camera, color: Colors.grey[400]),
            onPressed: null, // No onPressed for camera
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.grey[400]),
            // onPressed: _isLoading ? null : _sendMessage,
            onPressed: _sendMessage,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2C3836),
              Color(0xFF000000),
            ],
            stops: [0.1, 0.9],
            transform: GradientRotation(
                -13.63 * 3.14 / 180), // Convert degrees to radians
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      'assets/images/bhai.png',
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'I am here to help you',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return MessageBubble(message: messages[index]);
                      },
                    ),
                  ],
                ),
              ),
            ),
            _buildMessageInput(),
          ],
        ),
      ),
    );
  }
}
