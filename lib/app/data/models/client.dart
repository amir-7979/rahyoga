import 'package:get/get.dart';
import '../services/storage_service.dart';

class Client extends GetxService{

  late  String _refresh;
  late  String _access;
  late  String _username;
  late  String _email;
  late  String _image;
  late  bool _isActive;
  late  int _accessTime;
  late  int _refreshTime;
  static final Client _instance = Client._internal();
  final StorageService _storageService = Get.find<StorageService>();

  String get access => _access;
  int get accessTime => _accessTime;

  factory Client() => _instance;
  Client._internal() {
    _refresh = "";
    _access = "";
    _username = "";
    _email = "";
    _image = "";
    _isActive = false;
    _accessTime = 0;
    _refreshTime = 0;
  }

  fromJson(Map<String, dynamic> json){
    _refresh = json['refresh'];
    _access = json['access'];
    _username = json['username'];
    _email = json['email'];
    _image = json['image'];
    _isActive = json['is_active'];
    _accessTime = json['access_time'];
    _refreshTime = json['refresh_time'];
    _writeClientInfo();
  }

  void _writeClientInfo() {
    _storageService.writeData('refresh', _refresh);
    _storageService.writeData('access', _access);
    _storageService.writeData('access_time', _accessTime.toString());
    _storageService.writeData('refresh_time', _refreshTime.toString());
    _storageService.writeData('image', _image);
    _storageService.writeData('username', _username);
    _storageService.writeData('is_active', _isActive);
    _storageService.writeData('email', _email);

  }

  void removeClientInfo()=> _storageService.deleteAllData();
}