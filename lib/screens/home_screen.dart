import 'package:flutter/material.dart';

import '../data/sample_data.dart';
import '../widgets/donor_card.dart';
import '../widgets/drive_card.dart';
import '../widgets/request_card.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 90),
            sliver: SliverList.list(
              children: [
                const _Header(),
                const SizedBox(height: 20),
                const _HeroCard(),
                const SizedBox(height: 20),
                const _QuickActions(),
                const SizedBox(height: 26),
                const SectionTitle(title: 'Nearby donors', action: 'View all'),
                const SizedBox(height: 12),
                ...donors.map((donor) => DonorCard(donor: donor)),
                const SizedBox(height: 18),
                const SectionTitle(title: 'Urgent requests', action: 'Create request'),
                const SizedBox(height: 12),
                ...bloodRequests.map((request) => RequestCard(request: request)),
                const SizedBox(height: 18),
                const SectionTitle(title: 'Upcoming drives'),
                const SizedBox(height: 12),
                ...donationDrives.map((drive) => DriveCard(drive: drive)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.12),
          child: Icon(
            Icons.volunteer_activism,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(width: 14),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back, Prashant',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 4),
              Text('Pune, Maharashtra', style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
        IconButton.filledTonal(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none),
        ),
      ],
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [color, const Color(0xFFFF6F61)]),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.28),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your blood can save lives',
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Book your next donation, respond to urgent requests, '
            'and track your impact in one place.',
            style: TextStyle(color: Colors.white70, height: 1.45),
          ),
          SizedBox(height: 22),
          Row(
            children: [
              _StatChip(label: 'Lives saved', value: '12'),
              SizedBox(width: 12),
              _StatChip(label: 'Next eligible', value: '18 days'),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.18),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 3),
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: _ActionTile(icon: Icons.add_circle_outline, label: 'Request blood')),
        SizedBox(width: 12),
        Expanded(child: _ActionTile(icon: Icons.calendar_month_outlined, label: 'Schedule')),
        SizedBox(width: 12),
        Expanded(child: _ActionTile(icon: Icons.health_and_safety_outlined, label: 'Eligibility')),
      ],
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
        child: Column(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}
