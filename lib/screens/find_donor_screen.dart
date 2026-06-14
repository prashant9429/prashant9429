import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../widgets/donor_card.dart';
import '../widgets/section_title.dart';

class FindDonorScreen extends StatelessWidget {
  const FindDonorScreen({super.key});

  static const bloodGroups = ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Find a donor',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          SearchBar(
            hintText: 'Search by name, blood group, or city',
            leading: const Icon(Icons.search),
            onChanged: (_) {},
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: bloodGroups
                .map((group) => FilterChip(label: Text(group), onSelected: (_) {}))
                .toList(),
          ),
          const SizedBox(height: 26),
          const SectionTitle(title: 'Best matches near you'),
          const SizedBox(height: 12),
          ...donors.map((donor) => DonorCard(donor: donor)),
        ],
      ),
    );
  }
}
