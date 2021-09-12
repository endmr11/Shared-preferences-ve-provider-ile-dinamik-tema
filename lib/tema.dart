import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.grey,
  accentColor: Colors.black,
  primaryColorLight: Colors.white,
);

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  accentColor: Colors.deepPurple,
  primaryColorLight: Colors.white,
);

class ThemeColorData with ChangeNotifier {
  static SharedPreferences? _sharedPrefObjesi;

  bool _temaAcikMi = true;

//GETTER
  bool get isLight => _temaAcikMi;
//GETTER
  ThemeData get temaRengi {
    return _temaAcikMi ? light : dark;
  }

//SETTER
  void degistirTema() {
    _temaAcikMi = !_temaAcikMi;
    kaydetTemayiSharedPrefe(_temaAcikMi);
    notifyListeners();
  }

  Future<void> yaratSharedPrefObjesi() async {
    _sharedPrefObjesi = await SharedPreferences.getInstance();
  }

  void kaydetTemayiSharedPrefe(bool deger) {
    _sharedPrefObjesi?.setBool('temaVeri', deger);
  }

  Future<void> yukleTemayiSharedPreften() async {
    //await createSharedPrefObject();
    _temaAcikMi = _sharedPrefObjesi?.getBool('temaVeri') ?? true;
  }
}
