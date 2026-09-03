import 'package:flutter/material.dart';
import 'album_4grid_preview.dart';

class Album4GridPreviewExampleSimple extends StatelessWidget {
  const Album4GridPreviewExampleSimple({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final providers = [
      NetworkImage('https://picsum.photos/400?image=101'),
      NetworkImage('https://picsum.photos/400?image=102'),
      NetworkImage('https://picsum.photos/400?image=103'),
      NetworkImage('https://picsum.photos/400?image=104'),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false, // <- remove DEBUG banner
      home: Scaffold(
        appBar: AppBar(title: const Text('Album 4-grid (fast browse)')),
        body: Center(
          child: SizedBox(
            width: 200,
            child: Album4GridPreviewSimple(
              thumbnails: providers,
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Open album')),
              ),
              gap: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
