import 'package:flutter/cupertino.dart';
import 'package:pixel_app/widget/round_base_image.dart';

class RoundAssetImage extends RoundBaseImage {
  const RoundAssetImage({super.key, required super.imageUrl, super.radius});

  @override
  ImageProvider getImage(String url) {
    return AssetImage(url);
  }
}
