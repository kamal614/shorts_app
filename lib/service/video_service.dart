import '../models/video_model.dart';

class VideoService {
  final List<Video> _videos = [
    Video(
        url:
            'https://vod.api.video/vod/vi4LxqbXX1Ijk9g81fSYzEOa/hls/manifest.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/e10523f2-5b24-42b9-87c1-0b79231074d1/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/35c7aead-13da-4b6a-8a8b-a3a177ce3541/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/6d6bc494-3b7f-4815-b0ed-39e410d48cee/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/d26b51cf-9133-4eb6-96f7-c7a732bafb1a/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/bd4fa95c-83d5-45e0-bd70-47726c75ce5a/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/9fb25d4d-7db2-40cd-a428-cbd56e39a80e/playlist.m3u8'),
    Video(
        url:
            'https://vod.api.video/vod/vi4LxqbXX1Ijk9g81fSYzEOa/hls/manifest.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/e10523f2-5b24-42b9-87c1-0b79231074d1/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/35c7aead-13da-4b6a-8a8b-a3a177ce3541/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/6d6bc494-3b7f-4815-b0ed-39e410d48cee/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/d26b51cf-9133-4eb6-96f7-c7a732bafb1a/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/bd4fa95c-83d5-45e0-bd70-47726c75ce5a/playlist.m3u8'),
    Video(
        url:
            'https://vz-2e447ac5-c14.b-cdn.net/9fb25d4d-7db2-40cd-a428-cbd56e39a80e/playlist.m3u8'),
  ];

  List<Video> getVideos() {
    return _videos;
  }
}
