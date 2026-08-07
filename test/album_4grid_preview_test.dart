import 'dart:typed_data';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:aves/widgets/album_4grid_preview.dart';

void main() {
  testWidgets('Album4GridPreviewSimple renders exactly 4 tiles (2x2)', (tester) async {
    // 1x1 transparent PNG bytes to avoid network dependency
    final transparent = Uint8List.fromList(<int>[
      0x89,0x50,0x4E,0x47,0x0D,0x0A,0x1A,0x0A,
      0x00,0x00,0x00,0x0D,0x49,0x48,0x44,0x52,
      0x00,0x00,0x00,0x01,0x00,0x00,0x00,0x01,
      0x08,0x06,0x00,0x00,0x00,0x1F,0x15,0xC4,
      0x89,0x00,0x00,0x00,0x0A,0x49,0x44,0x41,
      0x54,0x78,0x9C,0x63,0x60,0x00,0x00,0x00,
      0x02,0x00,0x01,0xE2,0x21,0xBC,0x33,0x00,
      0x00,0x00,0x00,0x49,0x45,0x4E,0x44,0xAE,
    ]);

    final providers = [
      MemoryImage(transparent),
      MemoryImage(transparent),
    ];

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: SizedBox(width: 200, child: Album4GridPreviewSimple(thumbnails: providers)),
      ),
    ));

    // Allow layout to settle
    await tester.pumpAndSettle();

    // Verify GridView exists
    expect(find.byType(GridView), findsOneWidget);

    // Verify exactly 4 tile containers are present and have the expected keys
    for (var i = 0; i < 4; i++) {
      expect(find.byKey(Key('album_tile_$i')), findsOneWidget);
    }
  });
}
