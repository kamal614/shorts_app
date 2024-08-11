import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../controllers/video_player_controller.dart';

class VideoPlayerWidget extends StatelessWidget {
  final int index;

  const VideoPlayerWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final reelsController = Provider.of<ReelsController>(context);
    final controller = reelsController.getVideoController(index);

    return GestureDetector(
      onTap: () {
        reelsController.togglePlayPause(index);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: controller != null && controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  )
                : const CircularProgressIndicator(),
          ),
          if (reelsController.isVideoPaused(index))
            Icon(
              Icons.play_arrow,
              size: 100,
              color: Colors.white.withOpacity(0.8),
            ),
        ],
      ),
    );
  }
}
