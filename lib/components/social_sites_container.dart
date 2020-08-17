import 'package:flutter/material.dart';

class SocialSitesContainer extends StatelessWidget {
  final assetImage;
  SocialSitesContainer(this.assetImage);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(assetImage),
            )));
  }
}
