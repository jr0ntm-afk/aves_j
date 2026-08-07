// Copyright (c) 2026
// Add a 2x2 album preview widget for Aves

import 'dart:typed_data';
import 'package:flutter/material.dart';

/// 2x2 四宫格相册预览 Widget
/// imageThumbProviders: 用于渲染缩略图的 ImageProvider 列表（优先推荐传入已缓存/缩略图 provider）
class Album4GridPreview extends StatelessWidget {
  final List<ImageProvider> imageThumbProviders;
  final VoidCallback? onTap;
  final double spacing;
  final double borderRadius;
  final Color placeholderColor;

  const Album4GridPreview({
    Key? key,
    required this.imageThumbProviders,
    this.onTap,
    this.spacing = 2.0,
    this.borderRadius = 4.0,
    this.placeholderColor = const Color(0xFFE0E0E0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 取最多四张 provider
    final thumbs = imageThumbProviders.take(4).toList();

    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1, // 保持正方形
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Container(
            color: Colors.black12,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: spacing,
                crossAxisSpacing: spacing,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                if (index < thumbs.length) {
                  final provider = thumbs[index];
                  return DecoratedBox(
                    decoration: BoxDecoration(color: Colors.black12),
                    child: Image(
                      image: provider,
                      fit: BoxFit.cover,
                      errorBuilder: (c, e, s) => Container(color: placeholderColor),
                    ),
                  );
                } else {
                  // 占位
                  return Container(color: placeholderColor);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

/// 透明占位图（1x1 PNG bytes），用于占位场景
final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A,
  0x00, 0x00, 0x00, 0x0D, 0x49, 0x48, 0x44, 0x52,
  0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01,
  0x08, 0x06, 0x00, 0x00, 0x00, 0x1F, 0x15, 0xC4,
  0x89, 0x00, 0x00, 0x00, 0x0A, 0x49, 0x44, 0x41,
  0x54, 0x78, 0x9C, 0x63, 0x60, 0x00, 0x00, 0x00,
  0x02, 0x00, 0x01, 0xE2, 0x21, 0xBC, 0x33, 0x00,
  0x00, 0x00, 0x00, 0x49, 0x45, 0x4E, 0x44, 0xAE,
]);
