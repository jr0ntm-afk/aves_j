# Pull Request: feat: add 4-grid album preview

This PR adds a new widget that shows a 2x2 thumbnail preview for album tiles. It includes an example widget to demonstrate usage.

Files added:
- lib/widgets/album_4grid_preview.dart
- lib/widgets/album_4grid_preview_example.dart

Integration notes
- Replace existing single-thumbnail album tiles with `Album4GridPreview` and pass a `List<ImageProvider>` of thumbnail providers (prefer cached/thumbnail providers for performance).
- The example uses NetworkImage for demo only.

Testing
- Verify scrolling performance and memory usage on device.
- Verify behavior when fewer than 4 images exist in an album.

Revert
- Remove files or revert the commit on branch album-4grid-preview.
