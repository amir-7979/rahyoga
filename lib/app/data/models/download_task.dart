import 'package:dio/dio.dart';

class DownloadTask{
  final String url;
   final int courseId, sessionId;
  int progress;
  int receivedBytes = 0;
  CancelToken cancelToken = CancelToken();

  DownloadTask(this.url, this.courseId, this.sessionId, this.progress);
}