import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player_new/audio/audio_model.dart';

import 'audio/audio_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Songs available:',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 24),
            ...audioData
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => AudioPage(
                              model: e,
                            ),
                          ),
                        );
                      },
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          e.imageUrl,
                        ),
                        radius: 90,
                      ),
                    ),
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
