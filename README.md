# LifeDrop Blood Donation App

LifeDrop is a Flutter mobile app concept for blood donation communities. It helps users find nearby donors, respond to urgent hospital requests, schedule donations, and track the lives they have helped save.

## Features

- Modern Material 3 Flutter UI with a red donation-focused theme.
- Home dashboard with donor impact stats and next eligibility reminder.
- Quick actions for requesting blood, scheduling a donation, and checking eligibility.
- Nearby donor search with blood-group filters and donor availability cards.
- Urgent hospital request cards with blood group, unit count, priority, location, and help action.
- Upcoming donation drive cards with dates, locations, and remaining slots.
- Impact screen for lives helped, completed donations, and requests answered.
- Profile screen for donor ID, eligibility, preferred radius, and emergency alerts.
- Bottom navigation for Home, Find, Impact, and Profile sections.
- Lightweight HTML preview in `preview/index.html` for environments without Flutter installed.

## Getting Started

Install Flutter, then run:

```bash
flutter pub get
flutter run
```

Run tests with:

```bash
flutter test
```

## Preview Without Flutter

If Flutter is not installed, you can view the static visual preview with:

```bash
python3 -m http.server 8765 --directory preview
```

Then open <http://127.0.0.1:8765/index.html> in your browser.

## Project Structure

```text
lib/main.dart                 # Main app entry point
lib/data/sample_data.dart     # Sample donors, requests, and donation drives
lib/models/                  # Data models for donors, requests, and drives
lib/screens/                 # Home, search, impact, profile, and app shell screens
lib/theme/app_theme.dart      # Shared Material theme
test/widget_test.dart         # Widget smoke and navigation tests
preview/index.html            # Static app preview for non-Flutter environments
web/                          # Flutter web metadata
```
