import 'package:flutter/material.dart';
import 'package:parki_dog/features/map/export/map_export.dart';

class CheckInScreen extends StatelessWidget {
  final String parkName;
  final String location;
  final List<String> imageUrls;
  final String distance;
  final String time;
  final String duration;
  final bool isOpenNow;
  final int rating;
  final int ratingCount;
  final List<Map<String, dynamic>> reviews;

  const CheckInScreen({
    super.key,
    required this.parkName,
    required this.location,
    required this.imageUrls,
    required this.distance,
    required this.time,
    required this.duration,
    required this.isOpenNow,
    required this.rating,
    required this.ratingCount,
    this.reviews = const [],
  });

  String _getNextOpeningTime() {
    final now = DateTime.now();
    print('Current time: ${now.hour}:${now.minute}');

    final openHour = 8;
    final closeHour = 19;

    final currentHour = now.hour;
    final currentMinute = now.minute;
    final currentTimeInMinutes = currentHour * 60 + currentMinute;
    final openTimeInMinutes = openHour * 60;
    final closeTimeInMinutes = closeHour * 60;

    print('Current time in minutes: $currentTimeInMinutes');
    print('Open time in minutes: $openTimeInMinutes');
    print('Close time in minutes: $closeTimeInMinutes');

    if (currentTimeInMinutes >= openTimeInMinutes && currentTimeInMinutes <= closeTimeInMinutes) {
      print('Within operating hours');
      return 'Open - Closes at 7:00 PM';
    } else {
      print('Outside operating hours');
      return 'Closed - Opens at 8:00 AM';
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Navigated to CheckInScreen: $parkName');
    print('Image URLs: $imageUrls');
    print('Distance: $distance, Time: $time');
    print('Location: $location');
    print('Rating: $rating, Rating Count: $ratingCount');
    print('Reviews: $reviews');
    print('Duration: $duration');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(parkName),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(AppDouble.d16),
          child: ElevatedButton(
            onPressed: () {
              selectDateTimePopup(
                context,
                title: LocaleKeys.checkIn_checkingIn,
                onDateTimeChanged: (time) {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    if (context.mounted) {
                      checkedInSuccessfullyDialog(context);
                    }
                  });
                },
                subTitle: LocaleKeys.checkIn_datePickerSubTitle,
                isDatePickerMode: false,
              );
            },
            child: const Text(LocaleKeys.checkIn_checkIn).tr(),
          ),
        ),
        body: Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height - kToolbarHeight - kBottomNavigationBarHeight),
          child: ListView(
            padding: const EdgeInsets.all(AppDouble.d16),
            children: [
              if (imageUrls.isNotEmpty)
                AppSliderView(
                  imagesUrls: imageUrls,
                  width: 1.sw - 20,
                  height: 230,
                )
              else
                Container(
                  height: 230,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Text('No images available'),
                  ),
                ),
              const SizedBox(height: AppDouble.d16),
              ParkInfoRow(
                duration: duration,
                ratingCount: ratingCount,
                rating: rating,
                parkName: parkName,
                safetyLabel: 'Safe',
              ),
              const SizedBox(height: AppDouble.d8),
              DistanceTimeNotifyMeRow(
                distance: distance,
                time: time,
                transportationType: 'bus',
              ),
              const CheckInDivider(),
              LocationRow(
                onNavigate: () {
                  // TODO: Implement navigation, e.g., open Google Maps
                  // final url = 'https://www.google.com/maps/dir/?api=1&destination=${Uri.encodeComponent(location)}';
                  // launchUrl(Uri.parse(url));
                },
                location: location,
              ),
              const SizedBox(height: AppDouble.d16),
              Row(
                children: [
                  Icon(
                    Icons.access_time,
                    size: 20,
                    color: Colors.grey[600],
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _getNextOpeningTime(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              const CheckInDivider(),
              const Text(
                'Recent Check-Ins',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: AppDouble.d8),
              reviews.isEmpty
                  ? const Text('No reviews available')
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        final authorName = review['author_name'] ?? 'Anonymous';
                        // Assuming a profile URL or ID is available; adjust based on your data
                        final profileUrl = review['author_profile_url'] ?? 'https://via.placeholder.com/40'; // Fallback image
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(profileUrl),
                            onBackgroundImageError: (_, __) {
                              print('Failed to load profile image for $authorName');
                            },
                          ),
                          title: Text(authorName),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(
                                  5,
                                  (i) => Icon(
                                    i < (review['rating'] ?? 0)
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: Colors.yellow,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Text(review['text'] ?? ''),
                              Text(review['time'] ?? ''),
                            ],
                          ),
                          trailing: const Text('Safe'),
                        );
                      },
                      separatorBuilder: (context, index) => const CheckInDivider(),
                      itemCount: reviews.length,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}