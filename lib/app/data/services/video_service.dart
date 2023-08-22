import 'dart:async';
import 'dart:io';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rahyoga/app/data/services/database_service.dart';

import '../models/download_task.dart';

class VideoService extends GetxService {
  late final Directory videoDir;
  final dio = Dio();
  final DataBaseService dataBaseService = Get.find<DataBaseService>();
  List<DownloadTask> downloadTasks = [];
  late final String appDocumentsPath;
  final StreamController<List<DownloadTask>> streamDownloadTasks = BehaviorSubject<List<DownloadTask>>();

  StreamController<List<DownloadTask>> get downloadTasksStream => streamDownloadTasks;

  VideoService() {
    init();
  }

  Future init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    appDocumentsPath = directory.path;
  }

  Future<bool> downloadVideoFile(int course, int session, String url, int progress) async {
    var downloadTask = findTask(course, session);
    print(downloadTask?.sessionId);
    if (downloadTask == null) {
      downloadTask = DownloadTask(url, course, session, progress);
      downloadTasks.add(downloadTask);
    }
    if (appDocumentsPath.isEmpty) {
      await init();
    }
    final movieFilePath = '$appDocumentsPath/${course}_${session}.mp4';
    try {
      await download(movieFilePath, downloadTask);
      return await saveToDatabase(downloadTask, movieFilePath);
    } catch (error) {
      print(error.toString());
      return false;
    }
  }

  Future<void> download(String movieFilePath, DownloadTask downloadTask) async {
    if(downloadTask.cancelToken.isCancelled){
      downloadTask.cancelToken = CancelToken();
    }
    await dio.download(
      downloadTask.url,
      movieFilePath,
      cancelToken: downloadTask.cancelToken,
      onReceiveProgress: (receivedBytes, totalBytes) {
        if (totalBytes != -1) {
          print(receivedBytes * 100 ~/ totalBytes);
          downloadTask.progress = receivedBytes * 100 ~/ totalBytes;
          downloadTask.receivedBytes = downloadTask.receivedBytes + receivedBytes;
          streamDownloadTasks.add(downloadTasks);
        }
        //dio.options.headers['Range'] = 'bytes=${downloadTask.receivedBytes}-';
      },
    );
  }

  Future<bool> saveToDatabase(
      DownloadTask downloadTask, String movieFilePath) async {
    try {
      final movieMetadata = {
        'course': downloadTask.courseId,
        'session': downloadTask.sessionId,
      };
      await dataBaseService.insertVideo(movieMetadata);
      downloadTasks.remove(downloadTask);
      print('download finished');
      print(await dataBaseService.getAllVideo().toString());
      return true;
    }catch(err){
      return false;
    }
  }

  void cancelDownload(int course, int session) {
    DownloadTask? task = downloadTasks.firstWhereOrNull((element) =>
      (element.courseId == course && element.sessionId == session));
    if(task != null) {
      task.cancelToken.cancel("Download cancelled by user");
      downloadTasks.remove(task);
    }
  }


  /*void resumeDownload(DownloadTask downloadTask) => downloadVideoFile(
      downloadTask.courseId,
      downloadTask.sessionId,
      downloadTask.url,
      downloadTask.function,
      downloadTask.progress);
*/
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
