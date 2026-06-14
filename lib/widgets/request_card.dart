import 'package:flutter/material.dart';

import '../models/blood_request.dart';
import 'blood_badge.dart';

class RequestCard extends StatelessWidget {
  const RequestCard({super.key, required this.request});

  final BloodRequest request;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            BloodBadge(group: request.bloodGroup),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    request.hospital,
                    style: const TextStyle(fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '${request.units} • ${request.priority} • ${request.requiredBy}',
                    style: const TextStyle(color: Colors.black54),
                  ),
                  Text(
                    request.location,
                    style: const TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ),
            FilledButton(onPressed: () {}, child: const Text('Help')),
          ],
        ),
      ),
    );
  }
}
