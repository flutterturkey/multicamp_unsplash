// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$keywordAtom = Atom(name: '_HomeViewModelBase.keyword');

  @override
  String get keyword {
    _$keywordAtom.reportRead();
    return super.keyword;
  }

  @override
  set keyword(String value) {
    _$keywordAtom.reportWrite(value, super.keyword, () {
      super.keyword = value;
    });
  }

  final _$imagesAtom = Atom(name: '_HomeViewModelBase.images');

  @override
  List<UnsplashImage> get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<UnsplashImage> value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  final _$loadingImagesAtom = Atom(name: '_HomeViewModelBase.loadingImages');

  @override
  bool get loadingImages {
    _$loadingImagesAtom.reportRead();
    return super.loadingImages;
  }

  @override
  set loadingImages(bool value) {
    _$loadingImagesAtom.reportWrite(value, super.loadingImages, () {
      super.loadingImages = value;
    });
  }

  final _$loadImageAsyncAction = AsyncAction('_HomeViewModelBase.loadImage');

  @override
  Future<UnsplashImage> loadImage(int index) {
    return _$loadImageAsyncAction.run(() => super.loadImage(index));
  }

  final _$loadImagesAsyncAction = AsyncAction('_HomeViewModelBase.loadImages');

  @override
  Future<void> loadImages([String keyword]) {
    return _$loadImagesAsyncAction.run(() => super.loadImages(keyword));
  }

  final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase');

  @override
  void resetImages() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.resetImages');
    try {
      return super.resetImages();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
keyword: ${keyword},
images: ${images},
loadingImages: ${loadingImages}
    ''';
  }
}
