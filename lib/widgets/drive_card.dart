import 'package:flutter/material.dart';

import '../models/donation_drive.dart';

class DriveCard extends StatelessWidget {
  const DriveCard({super.key, required this.drive});

  final DonationDrive drive;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            Icon(Icons.event_available, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(drive.title, style: const TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text('${drive.date} • ${drive.location}'),
                  Text('${drive.slotsLeft} donor slots left'),
                ],
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
