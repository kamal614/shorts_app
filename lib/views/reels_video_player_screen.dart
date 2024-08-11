import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shorts/controllers/video_player_controller.dart';
import 'widget/video_player_widget.dart';

class ReelsVideoPlayerScreen extends StatelessWidget {
  const ReelsVideoPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<ReelsController>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: PageController(initialPage: videoProvider.currentIndex),
        itemCount: videoProvider.videos.length,
        onPageChanged: (index) {
          videoProvider.updateCurrentIndex(index);
        },
        itemBuilder: (context, index) {
          return VideoPlayerWidget(index: index);
        },
      ),
    );
  }
}
