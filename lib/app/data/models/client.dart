import '../services/storage_service.dart';
final StorageService _storageService =  StorageService();

class Client {

  Client({
    required this.id,
    required this.username,
    required this.email,
    required this.tokens,
  });
  late final int id;
  late final String username;
  late final String email;
  late final Tokens tokens;

  Client.fromJson(Map<String, dynamic> json){
    /*id = json['id'];
    username = json['username'];
    email = json['email'];*/
    tokens = Tokens.fromJson(json['tokens']);
  }

  void writeClientInfo() {
    /*_storageService.writeData('id', id.toString());
    _storageService.writeData('username', username);
    _storageService.writeData('email', email);*/
    tokens.writeToken();
  }

  void removeClientInfo()=> _storageService.deleteAllData();
}

class Tokens {
  Tokens({
    required this.refresh,
    required this.access,
    required this.username,
    required this.email,
    required this.image,
    required this.enable,
    required this.accessTime,
    required this.refreshTime,
  });
  late final String refresh;
  late final String access;
  late final String username;
  late final String email;
  late final String image;
  late final bool enable;
  late final int accessTime;
  late final int refreshTime;

  Tokens.fromJson(Map<String, dynamic> json){
    refresh = json['refresh'];
    access = json['access'];
    username = json['username'];
    email = json['email'];
    image = json['image'];
    enable = json['enable'];
    accessTime = json['access_time'];
    refreshTime = json['refresh_time'];
  }

  void writeToken() {
    _storageService.writeData('refresh', refresh);
    _storageService.writeData('access', access);
    _storageService.writeData('access_time', accessTime.toString());
    _storageService.writeData('refresh_time', refreshTime.toString());
    _storageService.writeData('image', image);

  }
}