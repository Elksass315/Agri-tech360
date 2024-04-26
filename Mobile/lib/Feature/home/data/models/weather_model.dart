class WeatherModel {
  final double minTemp;
  final double maxTemp;
  final String date;
  final String icon;

  WeatherModel({
    required this.minTemp,
    required this.maxTemp,
    required this.date,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      minTemp: json['min_temp'].toDouble(),
      maxTemp: json['max_temp'].toDouble(),
      date: json['date'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min_temp': minTemp,
      'max_temp': maxTemp,
      'date': date,
      'icon': icon,
    };
  }
}
