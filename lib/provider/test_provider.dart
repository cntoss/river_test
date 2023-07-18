import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, int>((ref) {
  return Counter();
});

class Counter extends StateNotifier<int> {
  Counter() : super(0);
  void increment() => state++;
}

final counterProvider1 = StateNotifierProvider((ref) {
  return Counter1();
});

class Counter1 extends StateNotifier<int> {
  Counter1() : super(0);

  void increment() => state++;
}


final helloWordProvider = Provider((ref) => 'Hello Word');

class HelloConsumer extends ConsumerWidget {
  const HelloConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(ref.watch(helloWordProvider));
  }
}
