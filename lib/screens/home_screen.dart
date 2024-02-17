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

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final ImageController _imageController = ImageController();
//   final ApiService _apiService = ApiService();
//   late ImageModel _currentImage;
//   late QuoteModel _currentQuote;
//   late TextEditingController _textController;
//   bool _isLoading = false;
//   bool _isCameraEnabled = false;

//   @override
//   void initState() {
//     _textController = TextEditingController();
//     _initializeData();
//     _startAutoCapture();
//     super.initState();
//   }

//   Future<void> _initializeData() async {
//     // Dummy image data (replace with actual image capture logic)
//     final dummyImageData = 'dummy_image_data';
//     // Dummy quotes (replace with actual quote generation logic)
//     final dummyQuotes = [
//       "Quote 1",
//       "Quote 2",
//       "Quote 3",
//       "Quote 4",
//       "Quote 5",
//     ];
//     setState(() {
//       _currentImage = ImageModel(data: dummyImageData);
//       _currentQuote = QuoteModel(quotes: dummyQuotes);
//     });
//   }

//   Future<void> _captureAndGenerate() async {
//     setState(() {
//       _isLoading = true;
//     });
//     final image = await _imageController.captureImage();
//     final emotion = ''; // Call emotion analysis API to get emotion from image
//     final quotes = await _apiService.generateQuotes(emotion);
//     setState(() {
//       _currentImage = image;
//       _currentQuote = QuoteModel(quotes: quotes);
//       _isLoading = false;
//     });
//   }

//   void _startAutoCapture() {
//     // Timer to auto-capture image every 15 seconds
//     const Duration autoCaptureInterval = Duration(seconds: 15);
//     Timer.periodic(autoCaptureInterval, (timer) {
//       if (_isCameraEnabled && !_isLoading) {
//         _captureAndGenerate();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('EmoSense'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.logout),
//             onPressed: () {
//               // Logout logic
//               FirebaseAuth.instance.signOut();
//               // Navigate back to the login screen
//               Navigator.pushAndRemoveUntil(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//                 (route) => false,
//               );
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Current Emotion: ${_currentImage.data}',
//             ), // Display current emotion
//             SizedBox(height: 20),
//             Column(
//               children: _currentQuote.quotes
//                   .map((quote) => Text(quote))
//                   .toList(), // Display quotes
//             ),
//             SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _textController,
//                       enabled: !_isLoading,
//                       decoration: InputDecoration(
//                         hintText: 'How are you feeling?',
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   ElevatedButton(
//                     onPressed: _isLoading ? null : _captureAndGenerate,
//                     child:
//                         _isLoading ? CircularProgressIndicator() : Text('Send'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }
// }
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart' show join;
// import 'package:path_provider/path_provider.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late CameraController _controller;
//   late XFile? _imageFile;
//   final TextEditingController _messageController = TextEditingController();
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     final firstCamera = cameras.first;
//     _controller = CameraController(
//       firstCamera,
//       ResolutionPreset.medium,
//     );
//     await _controller.initialize();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   Future<void> _takePicture() async {
//     try {
//       final path = join(
//         (await getTemporaryDirectory()).path,
//         '${DateTime.now()}.png',
//       );
//       await _controller.takePicture();
//       setState(() {
//         _imageFile = XFile(path);
//       });
//     } catch (e) {
//       print('Error taking picture: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome to bh.ai'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 _buildChatMessage('Welcome to bh.ai', true),
//                 _buildChatMessage('How are you feeling today?', false),
//               ],
//             ),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }

//   Widget _buildChatMessage(String message, bool isBotMessage) {
//     return ListTile(
//       leading: isBotMessage ? CircleAvatar(child: Icon(Icons.chat)) : null,
//       title: Text(message),
//     );
//   }

//   Widget _buildMessageInput() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _messageController,
//               decoration: InputDecoration(
//                 hintText: 'Type your message...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: _imageFile != null
//                 ? Image.file(File(_imageFile!.path))
//                 : Icon(Icons.camera_alt),
//             onPressed: _imageFile != null ? null : _takePicture,
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: _isLoading ? null : _sendMessage,
//           ),
//         ],
//       ),
//     );
//   }

//   void _sendMessage() {
//     if (_messageController.text.isEmpty) return;

//     setState(() {
//       _isLoading = true;
//     });

//     _takePicture().then((_) {
//       // Simulate sending message to backend
//       Future.delayed(Duration(seconds: 2), () {
//         // Simulate receiving response from backend
//         setState(() {
//           _isLoading = false;
//           _messageController.clear();
//           _imageFile = null;
//         });
//       });
//     });
//   }
// }
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
  bool _isLoading = false;

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
        print(response);
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
    setState(() {
      _isLoading = true;
    });
    Timer(Duration(seconds: 8), () {
      // Add a typing indicator message
      setState(() {
        messages.add(Message(
          text: 'Bot is typing...',
          isUser: false,
        ));
      });
    });
    Timer(Duration(seconds: 4), () {
      // Simulate bot response
      setState(() {
        messages.add(Message(text: 'Bot response', isUser: false));
        _isLoading = false;
      });
    });
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
            onPressed: _isLoading ? null : _sendMessage,
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
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:camera/camera.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _messageController = TextEditingController();
//   CameraController? _cameraController;
//   File? _imageFile;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }

//   // Method to initialize the camera
//   Future<void> _initializeCamera() async {
//     final cameras = await availableCameras();
//     final frontCamera = cameras.firstWhere(
//       (camera) => camera.lensDirection == CameraLensDirection.front,
//     );
//     _cameraController = CameraController(
//       frontCamera,
//       ResolutionPreset.high,
//     );
//     await _cameraController!.initialize();
//   }

//   // Method to take a picture using the device camera
//   Future<void> _takePicture() async {
//     final image = await _cameraController!.takePicture();

//     setState(() {
//       _imageFile = File(image.path);
//     });
//   }

//   // Method to send a message and automatically take a photo
//   void _sendMessage() async {
//     // Automatically take a photo
//     await _takePicture();

//     // Implement sending message logic here
//     // For now, just clear the message input
//     setState(() {
//       _messageController.clear();
//       _imageFile = null; // Reset image file
//     });
//   }

//   // Method to build the message input field
//   Widget _buildMessageInput() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _messageController,
//               decoration: InputDecoration(
//                 hintText: 'Type your message...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: _imageFile != null
//                 ? Icon(Icons.camera_alt)
//                 : Icon(Icons.camera),
//             onPressed: null, // No onPressed for camera
//           ),
//           IconButton(
//             icon: Icon(Icons.send),
//             onPressed: _isLoading ? null : _sendMessage,
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Welcome to bh.ai'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: Text('Chat Messages will be displayed here'),
//             ),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     super.dispose();
//   }
// }
