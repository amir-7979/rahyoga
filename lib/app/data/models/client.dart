import 'package:get/get.dart';
import '../services/storage_service.dart';

class Client extends GetxService{

  late  String _refresh;
  late  String _access;
  late  String _username;
  late  String _email;
  late  String _image;
  late  int _accessTime;
  late  int _refreshTime;
  static Client _instance = Client._internal();
  final StorageService _storageService = Get.find<StorageService>();

  String get access => _access;
  String get refresh => _refresh;
  int get accessTime => _accessTime;

  factory Client() => _instance;
  Client._internal() {
    _refresh = "";
    _access = "";
    _username = "";
    _email = "";
    _image = "";
    _accessTime = 0;
    _refreshTime = 0;
  }

  fromJson(Map<String, dynamic> json){
    _refresh = json['refresh'];
    _access = json['access'];
    _username = json['username'];
    _email = json['email'];
    _image = json['image'];
    _accessTime = json['access_time'].runtimeType == String ? int.parse(json['access_time']) : json['access_time'];
    _refreshTime = json['refresh_time'].runtimeType ==String ? int.parse(json['refresh_time']) : json['refresh_time'];
    _writeClientInfo();
  }

  void _writeClientInfo() {
    _storageService.writeData('refresh', _refresh);
    _storageService.writeData('access', _access);
    _storageService.writeData('access_time', _accessTime.toString());
    _storageService.writeData('refresh_time', _refreshTime.toString());
    _storageService.writeData('image', _image);
    _storageService.writeData('username', _username);
    _storageService.writeData('email', _email);

  }

  Future<void> readClientInfo() async {
    fromJson(await _storageService.readAllData());
  }

  void removeClientInfo() {
    _storageService.deleteAllData();
    Client._internal();
  }

  @override
  String toString() {
    return 'Client{_refresh: $_refresh, _access: $_access, _username: $_username, _email: $_email, _image: $_image, _accessTime: $_accessTime, _refreshTime: $_refreshTime}';
  }
}