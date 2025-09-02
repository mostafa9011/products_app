import 'package:hive_flutter/hive_flutter.dart';

part 'rating.g.dart';

@HiveType(typeId: 1)
class Rating extends HiveObject {
  @HiveField(0)
  double rate;
  @HiveField(1)
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rate: (json['rate'] as num).toDouble(),
        count: json['count'] as int,
      );
}
