import '../models/blood_request.dart';
import '../models/donation_drive.dart';
import '../models/donor.dart';

const donors = [
  Donor(
    name: 'Aarav Sharma',
    bloodGroup: 'A+',
    distance: '1.2 km',
    status: 'Available now',
    city: 'Pune',
    donations: 8,
  ),
  Donor(
    name: 'Meera Patel',
    bloodGroup: 'O-',
    distance: '2.8 km',
    status: 'Available tomorrow',
    city: 'Kothrud',
    donations: 12,
  ),
  Donor(
    name: 'Rohan Gupta',
    bloodGroup: 'B+',
    distance: '4.1 km',
    status: 'Available today',
    city: 'Baner',
    donations: 5,
  ),
];

const bloodRequests = [
  BloodRequest(
    hospital: 'City Care Hospital',
    bloodGroup: 'O+',
    units: '2 units',
    priority: 'Critical',
    location: 'Shivajinagar',
    requiredBy: 'Before 6 PM',
  ),
  BloodRequest(
    hospital: 'Sunrise Clinic',
    bloodGroup: 'AB-',
    units: '1 unit',
    priority: 'Urgent',
    location: 'Wakad',
    requiredBy: 'Today',
  ),
];

const donationDrives = [
  DonationDrive(
    title: 'Weekend Mega Blood Camp',
    location: 'Phoenix Marketcity',
    date: 'Sun, 23 Jun',
    slotsLeft: 18,
  ),
  DonationDrive(
    title: 'College Donor Drive',
    location: 'COEP Auditorium',
    date: 'Tue, 25 Jun',
    slotsLeft: 32,
  ),
];
