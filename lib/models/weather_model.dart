class Weather {
  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
  });
  final String cityName;
  final double temperature;
  final String mainCondition;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'] as String,
      temperature: (json['main']['temp'] as num).toDouble(),
      mainCondition: json['weather'][0]['main'] as String,
    );
  }
}
