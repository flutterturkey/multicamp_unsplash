import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:multicamp_unsplash/core/base_view_model.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  init() {}
}
