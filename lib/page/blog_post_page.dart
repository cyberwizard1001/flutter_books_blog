// lib/pages/blog_post_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_books_blog/models/book_review.dart';

import 'package:flutter_books_blog/widget/custom_text_layout.dart';

class BlogPostPage extends StatelessWidget {
  final BookReview review;

  const BlogPostPage({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(review.title, style: TextStyle(color: review.textColor)),
        backgroundColor: review.primaryColor,
        iconTheme: IconThemeData(color: review.textColor), // Back button color
      ),
      body: Container(
        color: review.primaryColor, // Background color based on theme
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
                maxWidth: 900), // Max width for blog content
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Book Cover and Title Section
                  Center(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            review.coverImageUrl,
                            height: 300,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              height: 300,
                              width: 200,
                              color: Colors.grey[300],
                              child: Icon(Icons.broken_image,
                                  color: Colors.grey[600]),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          review.title,
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: review.textColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'by ${review.author}',
                          style: TextStyle(
                            fontSize: 24,
                            fontStyle: FontStyle.italic,
                            color: review.textColor.withOpacity(0.8),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Chip(
                          label: Text(review.genre,
                              style: TextStyle(color: review.primaryColor)),
                          backgroundColor: review.accentColor,
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),

                  // Synopsis
                  Text(
                    'Synopsis:',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: review.textColor,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    review.synopsis,
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                      color: review.textColor.withOpacity(0.9),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Main Content with Custom Layouts
                  Text(
                    'Full Review:',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: review.textColor,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Use CustomTextLayout based on review.layoutType
                  CustomTextLayout(
                    layoutType: review.layoutType,
                    contentParagraphs: review.contentParagraphs,
                    textColor: review.textColor,
                    accentColor: review.accentColor,
                    // Example image for image_left layout
                    imageUrl: review.id == '3'
                        ? 'https://placehold.co/400x250/F0F8FF/000000?text=Jane+Austen'
                        : null,
                  ),

                  const SizedBox(height: 60),
                  Center(
                    child: Text(
                      'End of Review',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: review.textColor.withOpacity(0.7),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
