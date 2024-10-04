import '../entities/countdown_item.dart';

abstract class CountdownRepository {
  Future<List<CountdownItem>> getCountdownItems(int page);
}
