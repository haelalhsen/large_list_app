import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/countdown_item.dart';

class CountdownListItem extends StatefulWidget {
  final CountdownItem item;

  const CountdownListItem({required this.item});

  @override
  _CountdownListItemState createState() => _CountdownListItemState();
}

class _CountdownListItemState extends State<CountdownListItem> {
  late int remainingTime;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.item.remainingTime;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Dispose the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Item ${widget.item.id}'),
      subtitle: Text('Time remaining: ${remainingTime}s'),
      // leading: Image.network(widget.item.gifUrl),
       leading: CachedNetworkImage(
         imageUrl: widget.item.gifUrl,
         placeholder: (context, url) => const CircularProgressIndicator(),
         errorWidget: (context, url, error) => const Icon(Icons.error),
       ),
    );
  }
}
