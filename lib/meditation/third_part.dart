import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ThirdPart extends StatelessWidget {
  ThirdPart({Key? key}) : super(key: key);
  // final Uri _url = Uri.parse('https://youtu.be/Kk7--moip1w');

  // Future<void> _launchUrl() async {
  //   if (!await launchUrl(_url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.maxFinite,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Start your meditation session: ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextButton(
              onPressed: () async {
                final spotifyUrl =
                    'https://open.spotify.com/playlist/1mHjmHjgzRWhX2wJ3VqWZR?si=f0c740f74ca84ed4';

                // Check if Spotify is installed
                if (await canLaunch(spotifyUrl)) {
                  // Launch the url which will open Spotify
                  launch(spotifyUrl);
                }
              },
              child: Text("Launch Url"),
            )
          ],
        ),
      ),
    );
  }
}
