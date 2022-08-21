import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/address.dart';
import 'package:riverpod_sample/zip_input_screen.dart';

final messagesFamily =
    FutureProvider.family<AddressJsonObject, String>((ref, id) async {
  try {
    final ww =
        await Dio().get('https://zipcloud.ibsnet.co.jp/api/search?zipcode=$id');
    final json = jsonDecode(ww.data);
    if (json.values.elementAt(1) == null) {
      throw '取得失敗しました。';
    }
    return AddressJsonObject.fromJson(json.values.elementAt(1)[0]);
  } catch (e) {
    rethrow;
  }
});

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AdressScreen')),
      body: const AddressBodyScreen(),
    );
  }
}

class AddressBodyScreen extends ConsumerWidget {
  const AddressBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StateController<String> texts =
        ref.read(stringControllerStateProvider.state);
    final response = ref.watch(messagesFamily(texts.state));
    return response.when(
      data: ((data) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("address1: ${response.value?.address1}"),
              Text("address2: ${response.value?.address2}"),
              Text("address3: ${response.value?.address3}"),
              Text("kana1: ${response.value?.kana1}"),
              Text("kana2: ${response.value?.kana2}"),
              Text("kana3: ${response.value?.kana3}"),
              Text("prefcode: ${response.value?.prefcode}"),
              Text("zipcode: ${response.value?.zipcode}"),
            ],
          ),
        );
      }),
      error: (error, stackTrace) => Text('Error: $error'),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
