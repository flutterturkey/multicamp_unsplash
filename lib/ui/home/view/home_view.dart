import 'package:flutter/material.dart';
import 'package:multicamp_unsplash/core/base_view.dart';
import 'package:multicamp_unsplash/ui/home/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model) {
        model.init();
        model.setContext(context);
        viewModel = model;
      },
      builder: (context, value) => Scaffold(),
      model: HomeViewModel(),
    );
  }
}
