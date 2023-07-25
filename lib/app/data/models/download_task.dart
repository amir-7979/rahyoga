import 'package:dio/dio.dart';

class DownloadTask{
  final String url;
  final String filename;
  final String courseId, sessionId;
  int progress;
  int receivedBytes = 0;
  CancelToken cancelToken = CancelToken();

  DownloadTask(this.url, this.filename, this.courseId, this.sessionId, this.progress);

}