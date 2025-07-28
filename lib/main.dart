// lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_books_blog/models/book_review.dart';
import 'package:flutter_books_blog/page/blog_post_page.dart';
import 'package:flutter_books_blog/page/home_page.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // GoRouter configuration
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/blog/:id',
          builder: (context, state) {
            final String id = state.pathParameters['id']!;
            // In a real app, you would fetch the review from a database
            // For this example, we use mock data
            final BookReview review = BookReview.mockReviews.firstWhere(
                  (r) => r.id == id,
              orElse: () => throw Exception('Review not found'), // Handle 404
            );
            return BlogPostPage(review: review);
          },
        ),
      ],
      errorBuilder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(child: Text('Page not found: ${state.error}')),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Book Review Blog',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Inter', // Using Inter font as per instructions
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}
