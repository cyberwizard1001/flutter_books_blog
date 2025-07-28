// lib/pages/home_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_books_blog/models/book_review.dart';
import 'package:flutter_books_blog/widget/book_review_card.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BookReview> reviews = BookReview.mockReviews;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Review Blog', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey[50]!, Colors.blueGrey[100]!],
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200), // Max width for content
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300.0, // Max width for each item
                  childAspectRatio: 0.7, // Aspect ratio of card (height slightly taller than width)
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                ),
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return BookReviewCard(
                    review: review,
                    onTap: () {
                      context.go('/blog/${review.id}');
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
