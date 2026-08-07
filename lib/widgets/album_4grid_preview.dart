import 'package:flutter/material.dart';

/// Simple 2x2 album preview in "fast-browse" style:
/// - No rounded corners, no colored borders
/// - Square tile, 2x2 images, images use BoxFit.cover
/// - Optional small play icon overlay for video thumbnails
class Album4GridPreviewSimple extends StatelessWidget {
  final List<ImageProvider> thumbnails; // up to 4 preferred; if more, take first 4
  final VoidCallback? onTap;
  final double gap; // small gap between images, default 1.0 for compact look
  final bool showPlayIconForVideo; // if true, caller must pass VideoIndicator items some other way

  const Album4GridPreviewSimple({
    Key? key,
    required this.thumbnails,
    this.onTap,
    this.gap = 1.0,
    this.showPlayIconForVideo = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ImageProvider> imgs = List<ImageProvider>.from(thumbnails);
    // only take up to 4; simpler: if fewer than 4, show what we have (no duplication)
    final int itemCount = 4;
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: ClipRect(
          child: Container(
            color: Colors.black, // background between thumbnails (fast-browse like)
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: gap,
                crossAxisSpacing: gap,
              ),
              itemCount: itemCount,
              itemBuilder: (context, index) {
                if (index < imgs.length) {
                  return _ThumbCell(
                    image: imgs[index],
                    showPlayIcon: false, // caller can change logic to mark videos
                  );
                } else {
                  // empty cell: keep it minimal (black background)
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _ThumbCell extends StatelessWidget {
  final ImageProvider image;
  final bool showPlayIcon;

  const _ThumbCell({
    Key? key,
    required this.image,
    this.showPlayIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Container with DecorationImage to ensure cover behavior and minimal layout
    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Use DecorationImage to avoid extra widget nesting
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (showPlayIcon)
            Center(
              child: Icon(
                Icons.play_circle_filled,
                color: Colors.white70,
                size: 36,
              ),
            ),
        ],
      ),
    );
  }
}
