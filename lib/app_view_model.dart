import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shumpo_chaen/app_repository.dart';
import 'package:shumpo_chaen/app_state.dart';

final appViewModel = StateNotifierProvider<AppViewModel, AppState>(
        (_) => AppViewModel(AppRepository()));

class AppViewModel extends StateNotifier<AppState> {
  AppViewModel(this.repository) : super(const AppState());

  final AppRepository repository;

  Future<void> fetchImage(String text) async {
    final imageList = await repository.fetchInstagram(text);

    print('debug: fetchImage');
    print(imageList);

    state = state.copyWith(imageList: imageList);
  }
}