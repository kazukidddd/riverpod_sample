import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleWidget(),
    );
  }
}

final countProvider = StateProvider<SS>((ref) {
  return SS(10);
});

class SS {
  SS(
    this.aa,
  );
  int aa = 10;

  int bb = 0;
}

class SampleWidget extends ConsumerWidget {
  const SampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(countProvider);
    StateController<SS> counter = ref.read(countProvider.state);
    return Scaffold(
      appBar: AppBar(title: const Text('ExampleScreen')),
      body: Center(
        child: Text('count is ${count.aa}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.update((state) {
            // state.aa += 100;
            // return state; だとstateの変化を検知できなくてwidget更新されない
            // ディープコピーしてあげる必要がある
            return SS(state.aa += 100);
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
