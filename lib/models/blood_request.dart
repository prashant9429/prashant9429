class BloodRequest {
  const BloodRequest({
    required this.hospital,
    required this.bloodGroup,
    required this.units,
    required this.priority,
    required this.location,
    required this.requiredBy,
  });

  final String hospital;
  final String bloodGroup;
  final String units;
  final String priority;
  final String location;
  final String requiredBy;
}
