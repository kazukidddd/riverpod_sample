import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

class AddressScreen extends ConsumerWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textControllerProvider = ref.watch(textControllerStateProvider);
    StateController<TextEditingController> texts =
        ref.read(textControllerStateProvider.state);
    return Scaffold(
      appBar: AppBar(title: const Text('AddressScreen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textControllerProvider,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              onChanged: (value) {
                texts.update((state) {
                  return TextEditingController(text: value);
                });
              },
            ),
            Text(texts.state.text),
          ],
        ),
      ),
    );
  }
}
