import 'package:flutter/foundation.dart';
import 'package:new_instagram/models/user.dart';

enum MediaType {
  image,
  video,
}
class Story {
  final String url;
  final MediaType media;
  final Duration duration;

  const Story({
    @required this.url,
    @required this.media,
    @required this.duration,
  });
}
