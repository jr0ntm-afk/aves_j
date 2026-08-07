import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:aves/widgets/album_4grid_preview.dart';

void main() {
  testWidgets('Album4GridPreviewSimple renders exactly 4 tiles (2x2)', (tester) async {
    final providers = [
      NetworkImage('https://example.com/1.png'),
      NetworkImage('https://example.com/2.png'),
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
