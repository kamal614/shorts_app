import 'package:flutter/material.dart';
import 'package:shorts/service/video_service.dart';
import 'package:video_player/video_player.dart';
import '../models/video_model.dart';

class ReelsController with ChangeNotifier {
  final VideoService _videoService = VideoService();
  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, bool> _isVideoPaused = {};
  int _currentIndex = 0;

  List<Video> get videos => _videoService.getVideos();

  int get currentIndex => _currentIndex;

  VideoPlayerController? getVideoController(int index) {
    return _videoControllers[index];
  }

  bool isVideoPaused(int index) {
    return _isVideoPaused[index] ?? false;
  }

  void updateCurrentIndex(int index) {
    _currentIndex = index;
    _initializeControllers(_currentIndex);
    _disposeControllers(_currentIndex);
    _playCurrentVideo();
    notifyListeners();
  }

  void _initializeControllers(int index) {
    for (int i = index - 2; i <= index + 2; i++) {
      if (i >= 0 && i < videos.length && _videoControllers[i] == null) {
        _videoControllers[i] =
            VideoPlayerController.networkUrl(Uri.parse(videos[i].url))
              ..initialize().then((_) {
                notifyListeners();
                _videoControllers[i]!.setLooping(true);
                if (i == _currentIndex) {
                  _videoControllers[i]!.play();
                  _isVideoPaused[i] = false;
                  notifyListeners();
                }
              });
      }
    }
  }

  void _disposeControllers(int index) {
    for (int i = 0; i < videos.length; i++) {
      if ((i < index - 2 || i > index + 2) && _videoControllers[i] != null) {
        _videoControllers[i]!.dispose();
        _videoControllers.remove(i);
        _isVideoPaused.remove(i);
      }
    }
  }

  void togglePlayPause(int index) {
    final controller = _videoControllers[index];
    if (controller != null) {
      if (controller.value.isPlaying) {
        controller.pause();
        _isVideoPaused[index] = true;
      } else {
        controller.play();
        _isVideoPaused[index] = false;
      }
      notifyListeners();
    }
  }

  void _playCurrentVideo() {
    _videoControllers[_currentIndex]?.play();
    _isVideoPaused[_currentIndex] = false;
  }

  @override
  void dispose() {
    _videoControllers.forEach((key, controller) {
      controller.dispose();
    });
    super.dispose();
  }
}
