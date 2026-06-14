import 'package:flutter/material.dart';

void main() {
  runApp(const BloodDonationApp());
}

class BloodDonationApp extends StatelessWidget {
  const BloodDonationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LifeDrop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFE53935),
          primary: const Color(0xFFE53935),
          secondary: const Color(0xFFFF7043),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8F8),
        cardTheme: CardThemeData(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const donors = [
    Donor('Aarav Sharma', 'A+', '1.2 km', 'Available now'),
    Donor('Meera Patel', 'O-', '2.8 km', 'Available tomorrow'),
    Donor('Rohan Gupta', 'B+', '4.1 km', 'Available today'),
  ];

  static const requests = [
    BloodRequest('City Care Hospital', 'O+', '2 units', 'Critical'),
    BloodRequest('Sunrise Clinic', 'AB-', '1 unit', 'Urgent'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
              sliver: SliverList.list(
                children: [
                  const _Header(),
                  const SizedBox(height: 20),
                  const _HeroCard(),
                  const SizedBox(height: 20),
                  const _QuickActions(),
                  const SizedBox(height: 26),
                  _SectionTitle(
                    title: 'Nearby donors',
                    action: 'View all',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  ...donors.map((donor) => DonorCard(donor: donor)),
                  const SizedBox(height: 18),
                  _SectionTitle(
                    title: 'Urgent requests',
                    action: 'Create request',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12),
                  ...requests.map((request) => RequestCard(request: request)),
                  const SizedBox(height: 90),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.bloodtype),
        label: const Text('Donate'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search), label: 'Find'),
          NavigationDestination(icon: Icon(Icons.favorite_border), label: 'Impact'),
          NavigationDestination(icon: Icon(Icons.person_outline), label: 'Profile'),
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
            Text(
              label,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
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
        Expanded(
          child: ActionTile(icon: Icons.add_circle_outline, label: 'Request blood'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: ActionTile(icon: Icons.calendar_month_outlined, label: 'Schedule'),
        ),
        SizedBox(width: 12),
        Expanded(
          child: ActionTile(
            icon: Icons.health_and_safety_outlined,
            label: 'Eligibility',
          ),
        ),
      ],
    );
  }
}

class ActionTile extends StatelessWidget {
  const ActionTile({super.key, required this.icon, required this.label});

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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({
    required this.title,
    required this.action,
    required this.onTap,
  });

  final String title;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
          ),
        ),
        TextButton(onPressed: onTap, child: Text(action)),
      ],
    );
  }
}

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
        subtitle: Text('${donor.distance} • ${donor.status}'),
        trailing: IconButton.filled(
          onPressed: () {},
          icon: const Icon(Icons.call_outlined),
        ),
      ),
    );
  }
}

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
                  Text(request.hospital, style: const TextStyle(fontWeight: FontWeight.w900)),
                  const SizedBox(height: 6),
                  Text(
                    '${request.units} needed • ${request.priority}',
                    style: const TextStyle(color: Colors.black54),
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

class BloodBadge extends StatelessWidget {
  const BloodBadge({super.key, required this.group});

  final String group;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(.10),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Text(
        group,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.w900,
          fontSize: 18,
        ),
      ),
    );
  }
}

class Donor {
  const Donor(this.name, this.bloodGroup, this.distance, this.status);

  final String name;
  final String bloodGroup;
  final String distance;
  final String status;
}

class BloodRequest {
  const BloodRequest(this.hospital, this.bloodGroup, this.units, this.priority);

  final String hospital;
  final String bloodGroup;
  final String units;
  final String priority;
}
