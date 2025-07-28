// lib/models/book_review.dart

import 'package:flutter/material.dart';

class BookReview {
  final String id;
  final String title;
  final String author;
  final String genre;
  final String coverImageUrl;
  final String synopsis;
  final List<String> contentParagraphs; // For main blog content
  final Color primaryColor; // For background/accent
  final Color textColor;    // For text color
  final Color accentColor;  // For secondary accents
  final String layoutType;  // e.g., 'default', 'two_column', 'image_left'

  BookReview({
    required this.id,
    required this.title,
    required this.author,
    required this.genre,
    required this.coverImageUrl,
    required this.synopsis,
    required this.contentParagraphs,
    required this.primaryColor,
    required this.textColor,
    required this.accentColor,
    this.layoutType = 'default',
  });

  // Example static data (replace with actual data source)
  static List<BookReview> get mockReviews => [
    BookReview(
      id: '1',
      title: 'The Midnight Library',
      author: 'Matt Haig',
      genre: 'Fantasy',
      coverImageUrl: 'https://placehold.co/300x450/A7C7E7/000000?text=Midnight+Library',
      synopsis: 'A captivating story about choices and regrets.',
      contentParagraphs: [
        'Nora Seed finds herself in the Midnight Library, a place between life and death, where she can try on different versions of her life.',
        'Each book in the library offers a chance to undo a regret and see how things might have been different.',
        'This novel explores themes of existentialism, mental health, and the infinite possibilities of life.',
        'It\'s a thought-provoking read that encourages readers to embrace life\'s imperfections and find joy in the present.',
      ],
      primaryColor: const Color(0xFF333366), // Deep Indigo
      textColor: const Color(0xFFE0E0E0),    // Light Gray
      accentColor: const Color(0xFFF0E68C),  // Khaki
      layoutType: 'default',
    ),
    BookReview(
      id: '2',
      title: 'Dune',
      author: 'Frank Herbert',
      genre: 'Science Fiction',
      coverImageUrl: 'https://placehold.co/300x450/D2B48C/000000?text=Dune',
      synopsis: 'An epic tale of political intrigue, ecology, and human evolution.',
      contentParagraphs: [
        'Set in the distant future, Dune tells the story of Paul Atreides, whose family takes control of the desert planet Arrakis, the only source of the most valuable substance in the universe, "the spice".',
        'The novel explores complex themes of politics, religion, ecology, and human evolution.',
        'Its intricate world-building and philosophical depth have made it a cornerstone of science fiction literature.',
        'The struggle for control over Arrakis and the spice leads to epic battles and profound revelations.',
      ],
      primaryColor: const Color(0xFF8B4513), // Saddle Brown
      textColor: const Color(0xFFF5DEB3),    // Wheat
      accentColor: const Color(0xFFDAA520),  // Goldenrod
      layoutType: 'two_column',
    ),
    BookReview(
      id: '3',
      title: 'Pride and Prejudice',
      author: 'Jane Austen',
      genre: 'Classic Romance',
      coverImageUrl: 'https://placehold.co/300x450/F0F8FF/000000?text=Pride+Prejudice',
      synopsis: 'A timeless story of love, class, and societal expectations.',
      contentParagraphs: [
        'The story follows the main character, Elizabeth Bennet, as she deals with issues of manners, upbringing, morality, education, and marriage in the society of the landed gentry of the British Regency.',
        'Elizabeth is the second of five daughters of Mr. and Mrs. Bennet, who live in Longbourn.',
        'The novel is a classic of English literature, beloved for its witty dialogue and memorable characters.',
        'It explores the complexities of social status and the pursuit of happiness in 19th-century England.',
      ],
      primaryColor: const Color(0xFFF8F8FF), // Ghost White
      textColor: const Color(0xFF4682B4),    // Steel Blue
      accentColor: const Color(0xFFDDA0DD),  // Plum
      layoutType: 'image_left',
    ),
  ];
}
