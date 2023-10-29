import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app_flutter/data/local/secure/secure_storage_manager.dart';
import 'package:weather_app_flutter/data/local/storage/storage_constants.dart';
import 'package:weather_app_flutter/data/local/storage/storage_manager.dart';
import 'package:weather_app_flutter/routes/page_names.dart';
import 'auth_state.dart';

class AuthController extends GetxController {
  static AuthController find = Get.find();
  Rxn<AuthState> authState = Rxn<AuthState>();
  int tabindex = 0;
  String balance = '0';

  Stream<AuthState?> get stream => authState.stream;
  AuthState? get state => authState.value;

  var storage = StorageManager();
  var secureStorage = SecureStorageManager();

  UserInfo? get user {
    final user = storage.get<Map<String, dynamic>>(StorageName.USERS);
    if (user != null) {
      return UserInfo.fromJson(user);
    } else {
      return null;
    }
  }

  @override
  void onInit() async {
    authState.value = const AuthState(appStatus: AppType.INITIAL);
    super.onInit();
  }

  @override
  void onReady() async {
    ever(authState, authChanged);
    authChanged(state);
    super.onReady();
  }

  Future<void> authChanged(AuthState? state) async {
    if (state?.appStatus == AppType.INITIAL) {
      await Future.delayed(const Duration(seconds: 3));
      await setup();
      await checkToken();
    } else if (state?.appStatus == AppType.UNAUTHENTICATED) {
      await clearData();
      await Future.delayed(const Duration(seconds: 3));
      Get.offAllNamed(PageName.LOGIN);
    } else if (state?.appStatus == AppType.AUTHENTICATED) {
      Get.offAllNamed(PageName.NAVBAR);
    } else if (state?.appStatus == AppType.LOAD) {
      Get.offAllNamed(PageName.LOADER);
    } else {
      Get.offAllNamed(PageName.LOADER);
    }
    update();
  }

  Future<void> checkToken() async {
    if (FirebaseAuth.instance.currentUser != null) {
      setAuth();
    } else {
      signOut();
    }
  }

  Future<void> clearData() async {
    storage.clearAll();
    await secureStorage.setToken(value: '');
  }

  Future<void> saveAuthData({
    required User user,
    required String token,
  }) async {
    // await NotificationHandler.setExternalId(user.id);
    await storage.write(StorageName.USERS, user);
    await secureStorage.setToken(value: token);
    setAuthValidate(user);
  }

  void setAuthValidate(User user) {
    if (user != null) {
      setAuth();
    } else {
      // setForceEditProfile();
    }
  }

  void setForceEdit() => authState.value = AuthState(appStatus: AppType.LOAD);

  Future<void> signOut() async {
    Get.offAllNamed(PageName.LOADER);
    await FirebaseAuth.instance.signOut();
    await secureStorage.setToken(value: '');
    await storage.clearAll();
    tabindex = 0;
    balance = '0';
    authState.value = const AuthState(appStatus: AppType.UNAUTHENTICATED);
  }

  void setAuth() {
    authState.value = const AuthState(appStatus: AppType.AUTHENTICATED);
  }

  void setLoad() {
    authState.value = const AuthState(appStatus: AppType.LOAD);
  }

  Future<void> setup() async {
    final firstInstall = storage.get<bool>(StorageName.FIRST_INSTALL) ?? false;
    if (firstInstall) {
      await secureStorage.setToken(value: '');
      await storage.write(StorageName.FIRST_INSTALL, false);
    }
  }
}
