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
  List<DownloadTask> downloadTasks = [];
  late final String appDocumentsPath;

  VideoService() {
    init();
  }

  Future init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    appDocumentsPath = directory.path;
  }

  Future<bool> downloadVideoFile(int course, int session, String url, Function(int) onProgress, int progress) async {
    var downloadTask = findTask(course, session);
    if (downloadTask == null) {
      print('new task');
      downloadTask = DownloadTask(url, course, session, progress, onProgress);
      downloadTasks.add(downloadTask);
    }

    if (appDocumentsPath.isEmpty) {
      await init();
    }

    final movieFilePath = '$appDocumentsPath/${course}_${session}.mp4';

    try {
      await download(url, movieFilePath, downloadTask, onProgress);
      return await saveToDatabase(downloadTask, movieFilePath);
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<void> download(url, String movieFilePath, DownloadTask downloadTask,
      onProgress) async {
    if(downloadTask.cancelToken.isCancelled){
      print('cancelToken.isCancelled');
      downloadTask.cancelToken = CancelToken();
    }
    await dio.download(
      url,
      movieFilePath,
      cancelToken: downloadTask.cancelToken,
      onReceiveProgress: (receivedBytes, totalBytes) {
        if (totalBytes != -1) {
          onProgress(receivedBytes* 100 ~/ totalBytes);
          print('${receivedBytes * 100 / totalBytes } ---- $totalBytes');
          downloadTask.progress = receivedBytes * 100 ~/ totalBytes;
          downloadTask.receivedBytes = downloadTask.receivedBytes + receivedBytes;
        }
        //dio.options.headers['Range'] = 'bytes=${downloadTask.receivedBytes}-';
      },
    );
  }

  Future<bool> saveToDatabase(
      DownloadTask downloadTask, String movieFilePath) async {
    final movieMetadata = {
      'course': downloadTask.courseId,
      'session': downloadTask.sessionId,
    };
    await dataBaseService.insertVideo(movieMetadata);
    print('File downloaded and saved at: $movieFilePath');
    var response = await dataBaseService.getAllVideo();
    print(response.toString());
    downloadTasks.remove(downloadTask);
    return true;
  }

  void cancelDownload(int course, int session) =>
      downloadTasks.firstWhereOrNull((element) =>
      (element.courseId == course && element.sessionId == session))?.cancelToken.cancel("Download cancelled by user");

  void resumeDownload(DownloadTask downloadTask) => downloadVideoFile(
      downloadTask.courseId,
      downloadTask.sessionId,
      downloadTask.url,
      downloadTask.function,
      downloadTask.progress);

  DownloadTask? findTask(int course, int session) =>
      downloadTasks.firstWhereOrNull((element) =>
      (element.courseId == course && element.sessionId == session));

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
