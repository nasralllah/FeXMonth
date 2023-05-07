class ShippingOption {
  final int id;
  final String title;
   var costPerKm;
  final int weight;
  final String time;

  ShippingOption({
    required this.id,
    required this.title,
    required this.costPerKm,
    required this.weight,
    required this.time,
  });
  factory ShippingOption.fromJson(Map<String, dynamic> json) {
    return ShippingOption(
      id: json['id'],
      title: json['title'],
      costPerKm: json['cost_per_km'],
      weight: json['weight'],
      time: json['time'],
    );
  }
}

