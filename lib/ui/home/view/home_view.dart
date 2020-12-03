import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:multicamp_unsplash/core/base_view.dart';
import 'package:multicamp_unsplash/model/unsplash_image.dart';
import 'package:multicamp_unsplash/ui/home/component/image_tile.dart';
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
      builder: (context, value) => buildScaffold,
      model: HomeViewModel(),
    );
  }

  Scaffold get buildScaffold {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          buildSliverAppBar,
          buildSliverStaggeredGrid,
        ],
      ),
    );
  }

  SliverAppBar get buildSliverAppBar {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      backgroundColor: Colors.white,
      title: buildSearchField,
      actions: [buildIconButtonClose],
    );
  }

  TextField get buildSearchField {
    return TextField(
      controller: viewModel.searchController,
      decoration: InputDecoration(hintText: "Ara...", border: InputBorder.none),
      onSubmitted: (String keyword) => viewModel.loadImages(keyword),
    );
  }

  IconButton get buildIconButtonClose {
    return IconButton(
      onPressed: () => viewModel.resetImages(),
      icon: Icon(Icons.close, color: Colors.black),
    );
  }

  Widget get buildSliverStaggeredGrid {
    return SliverPadding(
      padding: EdgeInsets.all(15),
      sliver: Observer(builder: (_) {
        return viewModel.loadingImages
            ? SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()))
            : SliverStaggeredGrid.countBuilder(
                crossAxisCount: 2,
                itemBuilder: (BuildContext context, int index) =>
                    buildImageTile(index),
                itemCount: viewModel.images.length,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                staggeredTileBuilder: (int index) {
                  return buildStaggeredTile(viewModel.images[index]);
                },
              );
      }),
    );
  }

  StaggeredTile buildStaggeredTile(UnsplashImage image) {
    double aspectRatio = image.height / image.width;
    double columnWidth = MediaQuery.of(context).size.width / 2;
    return StaggeredTile.extent(1, aspectRatio * columnWidth);
  }

  Widget buildImageTile(int index) {
    return FutureBuilder(
      future: viewModel.loadImage(index),
      builder: (context, snapshot) => ImageTileWidget(image: snapshot.data),
    );
  }
}
