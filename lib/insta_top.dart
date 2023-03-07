import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shumpo_chaen/app_view_model.dart';

final postTextareaControllerStateProvider = StateProvider.autoDispose((ref) {
  return TextEditingController();
});

class InstaTop extends HookConsumerWidget {
  const InstaTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(appViewModel.notifier);
    final state = ref.watch(appViewModel);
    var _value = '';

    var _resWidget = state.imageList
        .map((e) => Card(
        child: e['media_url'] != null
            ? Image(image: NetworkImage(e['media_url']))
            : Container(
          width: double.infinity,
          height: 60,
          alignment: Alignment.center,
          child: const Text('写真準備中'),
        )))
        .toList();

    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          Flexible(child: TextField(
                            onChanged: (value) {
                              _value = value;
                            },
                          )),
                          IconButton(
                              onPressed: () {
                                notifier.fetchImage(_value);
                              },
                              icon: const Icon(Icons.search))
                        ],
                      )))),
          Expanded(
              flex: 8,
              child: SingleChildScrollView(
                  child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(children: _resWidget),
                      )))),
        ],
      ),
    );
  }
}