class Review {
  final String? authorName;
  final int? rating;
  final String? text;
  final String? relativeTimeDescription;

  Review({
    this.authorName,
    this.rating,
    this.text,
    this.relativeTimeDescription,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      authorName: json['author_name'] as String?,
      rating: json['rating'] as int?,
      text: json['text'] as String?,
      relativeTimeDescription: json['relative_time_description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author_name': authorName,
      'rating': rating,
      'text': text,
      'relative_time_description': relativeTimeDescription,
    };
  }
}