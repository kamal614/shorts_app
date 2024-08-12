// 'https://vod.api.video/vod/vi4LxqbXX1Ijk9g81fSYzEOa/hls/manifest.m3u8',// 'https://vz-2e447ac5-c14.b-cdn.net/e10523f2-5b24-42b9-87c1-0b79231074d1/playlist.m3u8',// 'https://vz-2e447ac5-c14.b-cdn.net/35c7aead-13da-4b6a-8a8b-a3a177ce3541/playlist.m3u8',// 'https://vz-2e447ac5-c14.b-cdn.net/6d6bc494-3b7f-4815-b0ed-39e410d48cee/playlist.m3u8',// 'https://vz-2e447ac5-c14.b-cdn.net/d26b51cf-9133-4eb6-96f7-c7a732bafb1a/playlist.m3u8',// 'https://vz-2e447ac5-c14.b-cdn.net/bd4fa95c-83d5-45e0-bd70-47726c75ce5a/playlist.m3u8',// 'https://vz-2e447ac5-c14.b-cdn.net/9fb25d4d-7db2-40cd-a428-cbd56e39a80e/playlist.m3u8'
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsVideoPlayerScreenOG extends StatefulWidget {
  const ReelsVideoPlayerScreenOG({super.key});
  @override
  _ReelsVideoPlayerScreenOGState createState() =>
      _ReelsVideoPlayerScreenOGState();
}

class _ReelsVideoPlayerScreenOGState extends State<ReelsVideoPlayerScreenOG> {
  final List<String> videoUrls = [
    'https://vod.api.video/vod/vi4LxqbXX1Ijk9g81fSYzEOa/hls/manifest.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/e10523f2-5b24-42b9-87c1-0b79231074d1/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/35c7aead-13da-4b6a-8a8b-a3a177ce3541/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/6d6bc494-3b7f-4815-b0ed-39e410d48cee/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/d26b51cf-9133-4eb6-96f7-c7a732bafb1a/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/bd4fa95c-83d5-45e0-bd70-47726c75ce5a/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/9fb25d4d-7db2-40cd-a428-cbd56e39a80e/playlist.m3u8',
    'https://vod.api.video/vod/vi4LxqbXX1Ijk9g81fSYzEOa/hls/manifest.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/e10523f2-5b24-42b9-87c1-0b79231074d1/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/35c7aead-13da-4b6a-8a8b-a3a177ce3541/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/6d6bc494-3b7f-4815-b0ed-39e410d48cee/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/d26b51cf-9133-4eb6-96f7-c7a732bafb1a/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/bd4fa95c-83d5-45e0-bd70-47726c75ce5a/playlist.m3u8',
    'https://vz-2e447ac5-c14.b-cdn.net/9fb25d4d-7db2-40cd-a428-cbd56e39a80e/playlist.m3u8'
  ];
  late PageController _pageController;
  int _currentIndex = 0;
  final Map<int, VideoPlayerController> _videoControllers = {};
  final Map<int, bool> _isVideoPaused = {};
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    _initializeControllers(_currentIndex);
  }

  void _initializeControllers(int index) {
    for (int i = index - 2; i <= index + 2; i++) {
      if (i >= 0 && i < videoUrls.length && _videoControllers[i] == null) {
        _videoControllers[i] =
            VideoPlayerController.networkUrl(Uri.parse(videoUrls[i]))
              ..initialize().then((_) {
                setState(() {});
                _videoControllers[i]!.setLooping(true);
                if (i == _currentIndex) {
                  _videoControllers[i]!.play();
                  _isVideoPaused[i] = false;
                }
              });
      }
    }
  }

  void _disposeControllers(int index) {
    for (int i = 0; i < videoUrls.length; i++) {
      if ((i < index - 2 || i > index + 2) && _videoControllers[i] != null) {
        _videoControllers[i]!.dispose();
        _videoControllers.remove(i);
        _isVideoPaused.remove(i);
      }
    }
  }

  @override
  void dispose() {
    _disposeAllControllers();
    _pageController.dispose();
    super.dispose();
  }

  void _disposeAllControllers() {
    _videoControllers.forEach((key, controller) {
      controller.dispose();
    });
    _videoControllers.clear();
    _isVideoPaused.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: videoUrls.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _initializeControllers(_currentIndex);
            _disposeControllers(_currentIndex);
            _videoControllers[_currentIndex]!.play();
            _isVideoPaused[_currentIndex] = false;
          });
        },
        itemBuilder: (context, index) {
          _initializeControllers(index);
          return GestureDetector(
            onTap: () {
              setState(() {
                if (_videoControllers[index]!.value.isPlaying) {
                  _videoControllers[index]!.pause();
                  _isVideoPaused[index] = true;
                } else {
                  _videoControllers[index]!.play();
                  _isVideoPaused[index] = false;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: _videoControllers[index] != null &&
                          _videoControllers[index]!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio:
                              _videoControllers[index]!.value.aspectRatio,
                          child: VideoPlayer(_videoControllers[index]!),
                        )
                      : const CircularProgressIndicator(),
                ),
                if (_isVideoPaused[index] ?? false)
                  Icon(
                    Icons.play_arrow,
                    size: 100,
                    color: Colors.white.withOpacity(0.8),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
