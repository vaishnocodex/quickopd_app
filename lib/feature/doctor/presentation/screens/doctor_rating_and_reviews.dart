import 'package:flutter/material.dart';
import 'package:quick_opd/core/common/common_list_wrapper.dart';
import 'package:quick_opd/core/extensions/integer_sizedbox_extension.dart';
import 'package:quick_opd/core/themes/app_font.dart';
import 'package:quick_opd/feature/doctor/presentation/widgets/patient_review_card_widget.dart';

class DoctorRatingAndReviews extends StatelessWidget {
  final double averageRating;
  final int totalReviews;
  DoctorRatingAndReviews({
    super.key,
    required this.averageRating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            averageRating.toStringAsFixed(1),
            style: boldTextStyle(size: 36),
          ),
          5.sHeight,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return Icon(
                index < averageRating ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 24,
              );
            }),
          ),
          5.sHeight,
          Text(
            "Based on $totalReviews reviews",
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          12.sHeight,
          const Divider(thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Patient Reviews (158)",
                style: boldTextStyle(),
              ),
            ),
          ),
          CommonListWrapper<PatientRating>(
            physics: const BouncingScrollPhysics(),
            listType: ListType.gridView,
            gridSpacing: 0,
            gridCrossAxisCount: 1,
            items: sampleReviews,
            itemBuilder: (context, item) {
              return GestureDetector(
                onTap: () {},
                child: PatientReviewCard(
                    item: item,
                    name: (data) => data.name,
                    date: (data) => data.date,
                    rating: (data) => data.rating.toString(),
                    reviewText: (data) => data.reviewText,
                    profileImage: (data) => data.profileImage),
              );
            },
          ),
        ],
      ),
    );
  }

  final List<PatientRating> sampleReviews = [
    PatientRating(
      name: "John Doe",
      date: "Feb 9, 2025",
      rating: 4.5,
      reviewText: "Great doctor! Very professional.",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "Jane Smith",
      date: "Feb 8, 2025",
      rating: 5.0,
      reviewText: "Had an amazing experience. Highly recommended!",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "Michael Johnson",
      date: "Feb 7, 2025",
      rating: 4.0,
      reviewText: "Good service but had to wait a little longer.",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "Emily Davis",
      date: "Feb 6, 2025",
      rating: 3.5,
      reviewText: "Doctor was nice, but the clinic was crowded.",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "Robert Brown",
      date: "Feb 5, 2025",
      rating: 5.0,
      reviewText: "Best doctor in town. Super knowledgeable!",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "Jessica Wilson",
      date: "Feb 4, 2025",
      rating: 4.8,
      reviewText: "Excellent service and very kind staff.",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "David Martinez",
      date: "Feb 3, 2025",
      rating: 3.0,
      reviewText: "The doctor was good, but the appointment was rushed.",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "Sophia Anderson",
      date: "Feb 2, 2025",
      rating: 4.2,
      reviewText: "Happy with the treatment. Will visit again!",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "James Thomas",
      date: "Feb 1, 2025",
      rating: 2.5,
      reviewText: "Was expecting a better experience.",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
    PatientRating(
      name: "Olivia Taylor",
      date: "Jan 31, 2025",
      rating: 4.7,
      reviewText: "Very polite and experienced doctor. Highly satisfied!",
      profileImage:
          "https://thumb.photo-ac.com/74/74ab571f2c541b5bd22c46c0f89c6d32_t.jpeg",
    ),
  ];
}

class PatientRating {
  final String name;
  final String date;
  final double rating;
  final String reviewText;
  final String profileImage;

  PatientRating({
    required this.name,
    required this.date,
    required this.rating,
    required this.reviewText,
    required this.profileImage,
  });

  /// Factory method to create an instance from JSON
  factory PatientRating.fromJson(Map<String, dynamic> json) {
    return PatientRating(
      name: json['name'] ?? 'Anonymous',
      date: json['date'] ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      reviewText: json['reviewText'] ?? '',
      profileImage: json['profileImage'] ?? '',
    );
  }

  /// Convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'date': date,
      'rating': rating,
      'reviewText': reviewText,
      'profileImage': profileImage,
    };
  }
}
