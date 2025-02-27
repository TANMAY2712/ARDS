import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

void main() {
  runApp(VideoUploadApp());
}

class VideoUploadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoUploadScreen(),
    );
  }
}

class VideoUploadScreen extends StatefulWidget {
  @override
  _VideoUploadScreenState createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  File? _videoFile;
  final picker = ImagePicker();
  bool _isUploading = false;

  // Pick Video from Gallery or Camera
  Future<void> pickVideo(ImageSource source) async {
    final pickedFile = await picker.pickVideo(source: source);
    if (pickedFile != null) {
      setState(() {
        _videoFile = File(pickedFile.path);
      });
    }
  }

  // Upload Video API
  Future<void> uploadVideo() async {
    if (_videoFile == null) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Please select a video first!')),
      );
      return;
    }

    setState(() {
      _isUploading = true;
    });

    var uri = Uri.parse("https://your-api-url.com/upload"); // Change to your API endpoint
    var request = http.MultipartRequest("POST", uri);
    request.files.add(
      await http.MultipartFile.fromPath('video', _videoFile!.path),
    );

    var response = await request.send();
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Video uploaded successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Upload failed! Please try again.')),
      );
    }

    setState(() {
      _isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Video")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _videoFile != null
                ? Text("Video Selected: ${basename(_videoFile!.path)}")
                : Text("No Video Selected"),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.video_library),
                  label: Text("Pick from Gallery"),
                  onPressed: () => pickVideo(ImageSource.gallery),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  icon: Icon(Icons.videocam),
                  label: Text("Record Video"),
                  onPressed: () => pickVideo(ImageSource.camera),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isUploading ? null : uploadVideo,
              child: _isUploading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Upload Video"),
            ),
          ],
        ),
      ),
    );
  }
}
