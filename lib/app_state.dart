import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = const FlutterSecureStorage();
    await _safeInitAsync(() async {
      _prefix = await secureStorage.getString('ff_prefix') ?? _prefix;
    });
    await _safeInitAsync(() async {
      _collectID = await secureStorage.getInt('ff_collectID') ?? _collectID;
    });
    await _safeInitAsync(() async {
      _recieptNo = await secureStorage.getInt('ff_recieptNo') ?? _recieptNo;
    });
    await _safeInitAsync(() async {
      _pass = await secureStorage.getString('ff_pass') ?? _pass;
    });
    await _safeInitAsync(() async {
      _company = await secureStorage.getString('ff_company') ?? _company;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _prefix = '';
  String get prefix => _prefix;
  set prefix(String value) {
    _prefix = value;
    secureStorage.setString('ff_prefix', value);
  }

  void deletePrefix() {
    secureStorage.delete(key: 'ff_prefix');
  }

  int _collectID = 0;
  int get collectID => _collectID;
  set collectID(int value) {
    _collectID = value;
    secureStorage.setInt('ff_collectID', value);
  }

  void deleteCollectID() {
    secureStorage.delete(key: 'ff_collectID');
  }

  int _recieptNo = 1;
  int get recieptNo => _recieptNo;
  set recieptNo(int value) {
    _recieptNo = value;
    secureStorage.setInt('ff_recieptNo', value);
  }

  void deleteRecieptNo() {
    secureStorage.delete(key: 'ff_recieptNo');
  }

  String _pass = 'masterchitsptspl8';
  String get pass => _pass;
  set pass(String value) {
    _pass = value;
    secureStorage.setString('ff_pass', value);
  }

  void deletePass() {
    secureStorage.delete(key: 'ff_pass');
  }

  String _company = '';
  String get company => _company;
  set company(String value) {
    _company = value;
    secureStorage.setString('ff_company', value);
  }

  void deleteCompany() {
    secureStorage.delete(key: 'ff_company');
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return const CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: const ListToCsvConverter().convert([value]));
}
