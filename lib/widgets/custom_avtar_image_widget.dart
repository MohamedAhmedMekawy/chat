import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_app/resource/assets_manager.dart';
import 'package:chat_app/resource/color_manager.dart';
import 'package:flutter/material.dart';

class CustomAvtarImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double radius;
  final bool imageAsset;
  final Color? backgroundColor;
  final Widget? child;
  final BlendMode? blendMode;

  const CustomAvtarImageWidget({
    super.key,
    this.imageUrl,
    this.imageAsset = false,
    this.blendMode,
    required this.radius,
    this.backgroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return imageAsset
        ? CircleAvatar(
            radius: radius,
            backgroundColor: backgroundColor ?? ColorManager.lightWhiteColor,
            backgroundImage: const AssetImage(ImageAssets.teamImg),
            child: child,
          )
        : CachedNetworkImage(
            imageUrl: '$imageUrl',
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            imageBuilder: (context, imageProvider) => CircleAvatar(
              radius: radius,
              backgroundColor: backgroundColor ?? ColorManager.lightWhiteColor,
              backgroundImage: imageProvider,
              child: child,
            ),
            colorBlendMode: blendMode,
            // placeholder: (context, url) => CustomSkeletonCircle(
            //   width: radius * 2,
            //   maxHeight: radius,
            //   minHeight: radius,
            // ),
            errorWidget: (context, url, error) => CircleAvatar(
              radius: radius,
              backgroundColor: backgroundColor ?? ColorManager.lightWhiteColor,
              // backgroundImage: const AssetImage(ImageAssets.defualtAvtarImg),
              child: child,
            ),
          );
  }
}
