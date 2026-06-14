import 'package:flutter/material.dart';

class ImpactScreen extends StatelessWidget {
  const ImpactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          Text('Your impact', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900)),
          SizedBox(height: 18),
          _ImpactMetric(icon: Icons.favorite, value: '12', label: 'Lives helped'),
          _ImpactMetric(icon: Icons.water_drop, value: '4', label: 'Donations completed'),
          _ImpactMetric(icon: Icons.groups, value: '3', label: 'Requests answered'),
          SizedBox(height: 18),
          Card(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Keep donating every eligible cycle to build a stronger emergency '
                'blood network for your city.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ImpactMetric extends StatelessWidget {
  const _ImpactMetric({required this.icon, required this.value, required this.label});

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
        subtitle: Text(label),
      ),
    );
  }
}
