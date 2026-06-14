import 'package:flutter/material.dart';

import '../models/donor.dart';
import 'blood_badge.dart';

class DonorCard extends StatelessWidget {
  const DonorCard({super.key, required this.donor});

  final Donor donor;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        leading: BloodBadge(group: donor.bloodGroup),
        title: Text(donor.name, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(
          '${donor.distance} • ${donor.city} • ${donor.status}\n'
          '${donor.donations} lifetime donations',
        ),
        isThreeLine: true,
        trailing: IconButton.filled(
          onPressed: () {},
          icon: const Icon(Icons.call_outlined),
        ),
      ),
    );
  }
}
