// lib/widgets/custom_text_layout.dart

import 'package:flutter/material.dart';

class CustomTextLayout extends StatelessWidget {
  final String layoutType;
  final List<String> contentParagraphs;
  final Color textColor;
  final Color accentColor;
  final String? imageUrl; // Optional image for certain layouts

  const CustomTextLayout({
    super.key,
    required this.layoutType,
    required this.contentParagraphs,
    required this.textColor,
    required this.accentColor,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    switch (layoutType) {
      case 'two_column':
        return _buildTwoColumnLayout(context);
      case 'image_left':
        return _buildImageLeftLayout(context);
      case 'default':
      default:
        return _buildDefaultLayout();
    }
  }

  Widget _buildDefaultLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contentParagraphs.map((paragraph) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Text(
            paragraph,
            style: TextStyle(
              fontSize: 18,
              height: 1.6,
              color: textColor.withOpacity(0.9),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTwoColumnLayout(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth > 768;

    if (isLargeScreen) {
      // Divide content into two halves for two columns
      final int halfLength = (contentParagraphs.length / 2).ceil();
      final List<String> firstHalf = contentParagraphs.sublist(0, halfLength);
      final List<String> secondHalf = contentParagraphs.sublist(halfLength);

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: firstHalf.map((paragraph) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0, right: 20.0),
                child: Text(
                  paragraph,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    color: textColor.withOpacity(0.9),
                  ),
                ),
              )).toList(),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: secondHalf.map((paragraph) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  paragraph,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    color: textColor.withOpacity(0.9),
                  ),
                ),
              )).toList(),
            ),
          ),
        ],
      );
    } else {
      // Fallback to single column on smaller screens
      return _buildDefaultLayout();
    }
  }

  Widget _buildImageLeftLayout(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth > 768;

    if (isLargeScreen && imageUrl != null) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 300, // Fixed width for image column
            margin: const EdgeInsets.only(right: 24.0, bottom: 16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: Icon(Icons.broken_image, color: Colors.grey[600]),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: contentParagraphs.map((paragraph) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  paragraph,
                  style: TextStyle(
                    fontSize: 18,
                    height: 1.6,
                    color: textColor.withOpacity(0.9),
                  ),
                ),
              )).toList(),
            ),
          ),
        ],
      );
    } else {
      // Fallback to image above text or default layout on smaller screens
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    imageUrl!,
                    width: MediaQuery.of(context).size.width * 0.8, // Responsive width
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: Icon(Icons.broken_image, color: Colors.grey[600]),
                    ),
                  ),
                ),
              ),
            ),
          _buildDefaultLayout(),
        ],
      );
    }
  }
}
