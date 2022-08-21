import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/address_screen.dart';

final textControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController(text: '');
});

final stringControllerStateProvider = StateProvider<String>((ref) {
  return '';
});

class ZipInputScreen extends ConsumerWidget {
  const ZipInputScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textControllerProvider = ref.watch(textControllerStateProvider);
    StateController<String> texts =
        ref.watch(stringControllerStateProvider.state);
    return Scaffold(
      appBar: AppBar(title: const Text('ZipInputScreen')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textControllerProvider,
              keyboardType: TextInputType.number,
              maxLength: 7,
              textAlign: TextAlign.center,
              onChanged: (value) {
                texts.update((state) {
                  return value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () => Navigator.push<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (context) => const AddressScreen(),
                ),
              ),
              child: const Text('住所表示'),
            ),
          ],
        ),
      ),
    );
  }
}
