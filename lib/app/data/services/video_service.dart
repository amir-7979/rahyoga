import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:rahyoga/app/data/services/database_service.dart';
import '../../../core/values/consts.dart';
import 'package:path_provider/path_provider.dart';

import '../models/download_task.dart';

class VideoService extends GetxService {
  late final Directory videoDir;
  final dio = Dio();
  final DataBaseService dataBaseService = Get.find<DataBaseService>();
  CancelToken _cancelToken = CancelToken();
  List<DownloadTask> downloadTasks = [];

  VideoService() {
    /*videoDir = Directory('${appDirectory.path}/movie');
     if (!videoDir.existsSync()) {
       videoDir.createSync(recursive: true);
     }*/
  }

  Future<bool> downloadVideoFile(name, course, session, url, Function(int) onProgress) async {
    DownloadTask downloadTask = DownloadTask(url, name, course, session, 0);
    downloadTasks.add(downloadTask);

    appDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDirectory.path;
    print(appDirectory);
    final movieFileName = '${course}_${session}.mp3';
    final movieFilePath = '$appDocumentsPath/$movieFileName';

    try {
      await dio.download(url, movieFilePath, cancelToken: downloadTask.cancelToken,
          onReceiveProgress: (receivedBytes, totalBytes) {
        if (totalBytes != -1) {
          onProgress((receivedBytes / totalBytes * 100).toInt());
          print('${receivedBytes / totalBytes * 100} ---- $totalBytes');
          downloadTask.progress = (receivedBytes / totalBytes * 100).toInt();
        }
      },
        options: Options(
          responseType: ResponseType.stream,
          headers: {'range': 'bytes=${downloadTask.receivedBytes}'},
        ),/* queryParameters: {
          'Accept': 'application/json',
          'Authorization': 'Bearer 45925|sNRc42M4z8JwnpMbp20HPeeH3NYbxqB7RePZq7zG'}*/
      );

      final movieMetadata = {
        'name': downloadTask.filename,
        'course': downloadTask.courseId,
        'session': downloadTask.sessionId,
      };
      await dataBaseService.insertVideo(movieMetadata);
      print('File downloaded and saved at: $movieFilePath');
      var response = await dataBaseService.getAllVideo();
      print(response.toString());
      return true;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }


  Future<bool> retryDownloadVideoFile(name, course, session, url, Function(int) onProgress) async {
    DownloadTask downloadTask = DownloadTask(url, name, course, session, 0);
    downloadTasks.add(downloadTask);

    appDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDirectory.path;
    print(appDirectory);
    final movieFileName = '${course}_${session}.mp3';
    final movieFilePath = '$appDocumentsPath/$movieFileName';
    int downloaded = File(movieFilePath).lengthSync();
    try {
      await dio.download(url, movieFilePath, cancelToken: downloadTask.cancelToken,
        onReceiveProgress: (receivedBytes, totalBytes) {
          if (totalBytes != -1) {
            onProgress((receivedBytes / totalBytes * 100).toInt());
            print('${receivedBytes / totalBytes * 100} ---- $totalBytes');
            downloadTask.progress = (receivedBytes / totalBytes * 100).toInt();
          }
        },

        /* queryParameters: {
          'Accept': 'application/json',
          'Authorization': 'Bearer 45925|sNRc42M4z8JwnpMbp20HPeeH3NYbxqB7RePZq7zG'}*/
      );

      final movieMetadata = {
        'name': downloadTask.filename,
        'course': downloadTask.courseId,
        'session': downloadTask.sessionId,
      };
      await dataBaseService.insertVideo(movieMetadata);
      print('File downloaded and saved at: $movieFilePath');
      var response = await dataBaseService.getAllVideo();
      print(response.toString());
      return true;
    } catch (error) {
      print(error.toString());
      return false;
    }
  }


  void cancelDownload(index) {
    downloadTasks[index].cancelToken.cancel("Download cancelled by user");
  }


  Future<List<Map<String, dynamic>>> getAllVideo() async =>
      await dataBaseService.getAllVideo();
/*

  Future<void> deleteVideoFile(course, session,) async {
    final mDir = Directory('$videoDir/$course/$session');
    final movieFileName = '${course}_${session}.mp3';
    final movieFilePath = '${mDir.path}/$movieFileName';
    final file = File(movieFilePath);
    if (file.existsSync()) {
      await file.delete();
    }
    await dataBaseService.deleteVideo(course, session);
  }

  Future<String?> findVideoFile(course, session,) async {
    final mDir = Directory('$videoDir/$course/$session');
    final movieFileName = '${course}_${session}.mp3';
    final movieFilePath = '${mDir.path}/$movieFileName';
    bool isExist =  await dataBaseService.videoExists(course, session);
    return isExist ? movieFilePath : null;
  }
*/
}
