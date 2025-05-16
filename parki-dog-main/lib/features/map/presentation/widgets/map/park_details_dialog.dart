import 'package:flutter/material.dart';
import 'package:parki_dog/features/map/data/models/place_details.dart';

class ParkDetailsDialog extends StatelessWidget {
  final PlaceDetails details;

  const ParkDetailsDialog({super.key, required this.details});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(details.result?.name ?? 'Park'), // Access name from Result
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Rating: ${details.result?.rating ?? 'N/A'}'), // Access rating from Result
          Text('Address: ${details.result?.formattedAddress ?? 'Unknown'}'), // Access formattedAddress from Result
          const SizedBox(height: 10),
          if (details.result?.reviews != null) // Access reviews from Result
            ...details.result!.reviews!.map((r) => ListTile(
                  title: Text(r.authorName ?? ''),
                  subtitle: Text(r.text ?? ''),
                  trailing: Text('${r.rating ?? ''}⭐'),
                )),
        ],
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close')),
      ],
    );
  }
}
