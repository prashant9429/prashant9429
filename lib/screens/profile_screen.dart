import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const CircleAvatar(radius: 44, child: Text('P', style: TextStyle(fontSize: 32))),
          const SizedBox(height: 12),
          const Center(
            child: Text('Prashant', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          ),
          const Center(child: Text('A+ donor • Pune')),
          const SizedBox(height: 24),
          _ProfileTile(icon: Icons.badge_outlined, title: 'Donor ID', value: 'LD-2026-1042'),
          _ProfileTile(
            icon: Icons.monitor_heart_outlined,
            title: 'Eligibility',
            value: 'Eligible in 18 days',
          ),
          _ProfileTile(icon: Icons.location_on_outlined, title: 'Preferred radius', value: '5 km'),
          _ProfileTile(icon: Icons.emergency_outlined, title: 'Emergency alerts', value: 'Enabled'),
        ],
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({required this.icon, required this.title, required this.value});

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w800)),
        subtitle: Text(value),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
