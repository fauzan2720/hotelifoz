class PaymentModel {
  final int index;
  final String name;
  final String iconUrl;

  PaymentModel({
    required this.index,
    required this.name,
    required this.iconUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'name': name,
      'iconUrl': iconUrl,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      index: map['index']?.toInt() ?? 0,
      name: map['name'] ?? '',
      iconUrl: map['iconUrl'] ?? '',
    );
  }
}
