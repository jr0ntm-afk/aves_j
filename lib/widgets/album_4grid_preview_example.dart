import 'package:flutter/material.dart';
import 'album_4grid_preview.dart';

/// Example widget demonstrating how to use Album4GridPreview.
/// Replace the example providers with the project's thumbnail providers when integrating.
class Album4GridPreviewExample extends StatelessWidget {
  const Album4GridPreviewExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example image providers. Replace with project's thumbnail ImageProviders.
    final providers = [
      NetworkImage('https://picsum.photos/200?image=10'),
      NetworkImage('https://picsum.photos/200?image=20'),
      NetworkImage('https://picsum.photos/200?image=30'),
      NetworkImage('https://picsum.photos/200?image=40'),
    ];

    return SizedBox(
      width: 120,
      child: Album4GridPreview(
        imageThumbProviders: providers,
        onTap: () {
          // open album
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Open album')));
        },
      ),
    );
  }
}
