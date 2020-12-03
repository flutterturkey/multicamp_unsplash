import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:media_store/media_store.dart';
import 'package:multicamp_unsplash/model/unsplash_image.dart';
import 'package:multicamp_unsplash/network/unsplash_api.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

class ImageTileWidget extends StatelessWidget {
  final UnsplashImage image;

  const ImageTileWidget({this.image});

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: buildCachedNetworkImage(context),
      );
    } else {
      return buildPlaceHolder;
    }
  }

  Widget buildCachedNetworkImage(BuildContext ctx) {
    return GestureDetector(
      onTap: () => showDialog(
        context: ctx,
        builder: (context) => Builder(
            builder: (context) => GestureDetector(
                  onTap: () async {
                    await downloadImage(context, image.downloadUrl).then(
                        (result) => Toast.show(
                            result
                                ? 'İndirme işlemi başarıyla tamamlandı'
                                : 'Yazma izni alınamadı!',
                            ctx));

                    Navigator.of(context).pop();
                  },
                  child: CachedNetworkImage(
                    fit: BoxFit.fitHeight,
                    height: image.height,
                    width: image.width,
                    progressIndicatorBuilder: (context, url, downloadProgress) {
                      return Center(
                          child: CircularProgressIndicator(
                        value: downloadProgress.progress,
                      ));
                    },
                    imageUrl: image.fullUrl,
                  ),
                )),
      ),
      child: CachedNetworkImage(
        placeholder: (context, url) => buildPlaceHolder,
        fit: BoxFit.fitHeight,
        height: image.height,
        width: image.width,
        errorWidget: (context, url, object) => buildErrorWidget(),
        imageUrl: image.smallUrl,
      ),
    );
  }

  Container buildErrorWidget() => Container(
        color: Colors.grey[200],
        child: Center(
          child: Icon(Icons.broken_image_rounded),
        ),
      );

  Container get buildPlaceHolder => Container(color: Colors.grey[200]);

  Future<bool> downloadImage(context, String imgUrl) async {
    PermissionStatus storagePerm = await Permission.storage.request();
    if (storagePerm.isGranted) {
      Toast.show('İndirme işlemi başladı...', context);
      final downloadLink = await UnsplashAPI.getDownloadLink(imgUrl);
      final response = await http.get(downloadLink);
      Toast.show('İndirme işlemi devam ediyor...', context);
      final result = await MediaStore.saveImage(Uint8List.fromList(response.bodyBytes));
      print(result);
      return true;
    } else {
      return false;
    }
  }
}
