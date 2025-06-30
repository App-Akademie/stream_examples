class Location {
  final double latitude;
  final double longitude;

  Location(this.latitude, this.longitude);

  @override
  String toString() {
    return 'Latitude: $latitude, Longitude: $longitude';
  }
}
