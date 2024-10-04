import '../../domain/entities/countdown_item.dart';

class CountdownItemModel extends CountdownItem {
  CountdownItemModel({
    required int id,
    required int remainingTime,
    required String gifUrl,
  }) : super(id: id, remainingTime: remainingTime, gifUrl: gifUrl);

  factory CountdownItemModel.fromJson(Map<String, dynamic> json) {
    return CountdownItemModel(
      id: json['id'],
      remainingTime: json['remainingTime'],
      gifUrl: json['gifUrl'],
    );
  }
}
