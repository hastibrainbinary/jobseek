import 'package:flutter/material.dart';
import 'package:jobseek/utils/app_style.dart';
import 'package:jobseek/utils/asset_res.dart';

class VideoJoiningScreen extends StatelessWidget {
  const VideoJoiningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetRes.videoJoinMen), fit: BoxFit.cover),
          ),
        ),
        const Positioned(
          height: 120,
          top: 270,
          left: 120,
          child: Image(
            image: AssetImage(AssetRes.chatbox_Men_Image),
          ),
        ),
        Positioned(
          top: 400,
          left: 140,
          child: Text(
            "AirBNB",
            style: appTextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
          top: 440,
          left: 120,
          child: Text(
            "Joining Interview ...",
            style: appTextStyle(fontWeight: FontWeight.w400, fontSize: 14),
          ),
        ),
        Positioned(
          top: 680,
          left: 110,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xff950D00).withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Image(
                  image: AssetImage(
                    AssetRes.call_decaline,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 25),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: const Color(0xff4000BB).withOpacity(0.3),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Padding(
                padding: EdgeInsets.all(18.0),
                child: Image(
                  image: AssetImage(AssetRes.callIcon),
                ),
              ),
            ),
          ]),
        ),
      ],
    ));
  }
}
