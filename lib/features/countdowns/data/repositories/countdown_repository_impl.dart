import '../../domain/entities/countdown_item.dart';
import '../../domain/repositories/countdown_repository.dart';
import '../models/countdown_item_model.dart';

class CountdownRepositoryImpl implements CountdownRepository {
  @override
  Future<List<CountdownItem>> getCountdownItems(int page) async {
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 50));
    // Mock 1000 items, with each page returning 100 items.
    List<CountdownItem> items = List.generate(
      100,
          (index) => CountdownItemModel(
        id: page * 100 + index,
        remainingTime: 60,
        gifUrl: 'https://media.giphy.com/media/gwlUG7XTkdhJLaM5R7/giphy.gif',
      ),
    );
    return items;
  }
}
