import 'package:flutter/material.dart';

void main() {
  runApp(PhotoShareApp());
}

class PhotoShareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Share App',
      theme: ThemeData.dark(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String caption = '';
  ImageProvider? image;

  void pickFromCamera() {
    // TODO: Implement real camera logic (not available in browser)
    setState(() {
      image = AssetImage('assets/placeholder_camera.png');
    });
  }

  void pickFromGallery() {
    // TODO: Implement real gallery logic (not available in browser)
    setState(() {
      image = AssetImage('assets/placeholder_gallery.png');
    });
  }

  void shareToAll() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Pretending to share to all: $caption")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photo Share App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.camera_alt),
                    label: Text("Camera"),
                    onPressed: pickFromCamera,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.photo),
                    label: Text("Gallery"),
                    onPressed: pickFromGallery,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            image != null
                ? Image(image: image!, height: 200)
                : Container(
                    height: 200,
                    color: Colors.grey[900],
                    child: Center(child: Text("No image selected")),
                  ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Write your caption...",
                filled: true,
                fillColor: Colors.black12,
                border: OutlineInputBorder(),
              ),
              onChanged: (text) => setState(() => caption = text),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: shareToAll,
              icon: Icon(Icons.share),
              label: Text("Share to All"),
              style: ElevatedButton.styleFrom(minimumSize: Size.fromHeight(50)),
            ),
          ],
        ),
      ),
    );
  }
}
