import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Personal Profile', home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Personal Profile'), automaticallyImplyLeading: false),
      body: Container(
        padding: EdgeInsets.all(16.0),
        color: Colors.grey.shade200,
        child: Column(
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.transparent,
              child: Image.network(
                'https://blog.ippon.fr/content/images/2023/09/RGFzaGF0YXJfRGV2ZWxvcGVyX092ZXJJdF9jb2xvcl9QR19zaGFkb3c-.png',
                loadingBuilder: (
                  BuildContext context,
                  Widget child,
                  ImageChunkEvent? loadingProgress,
                ) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                    ),
                  );
                },
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                  return Icon(Icons.broken_image);
                },
              ),
            ),
            SizedBox(height: 20.0),
            ProfileTile(title: 'Name', trailing: 'Ayodele Gabriel Adeleye'),
            ProfileTile(title: 'Bio', trailing: 'Flutter Developer'),
            ProfileTile(
              title: 'Skills',
              trailing: 'Blow bubbles,\n write codes',
            ),
            ProfileTile(title: 'Contact Info', trailing: 'gabemandev@gmail.com'),
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({super.key, required this.title, required this.trailing});

  final String title;
  final String trailing;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(
            trailing,
            style: TextStyle(fontWeight: FontWeight.w500),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
