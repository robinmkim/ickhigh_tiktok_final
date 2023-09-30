import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ickhigh_tiktok_final/common/darkmode/models/darkmode_model.dart';
import 'package:ickhigh_tiktok_final/common/darkmode/repos/darkmode_repo.dart';

class DarkmodeViewModel extends Notifier<DarkmodeModel> {
  final DarkmodeRepository _repository;

  DarkmodeViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value);
    state = DarkmodeModel(isDark: value);
  }

  @override
  DarkmodeModel build() {
    return DarkmodeModel(
      isDark: _repository.isDark(),
    );
  }
}

final darkmodeProvider = NotifierProvider<DarkmodeViewModel, DarkmodeModel>(
    () => throw UnimplementedError());
