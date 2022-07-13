import 'package:dio/dio.dart';

import 'package:game/data/constants/constants.dart';

import 'dio_service.dart';

class DioServiceImpl implements DioService {
  @override
  Dio getDio() {
    const baseGameUrl = ConstantsAPI.game;
    const token = ConstantsAPI.token;
    const clientId = ConstantsAPI.clientId;

    return Dio(
      BaseOptions(
        baseUrl: baseGameUrl,
        headers: {
          'Content-Type': 'application/json; charset=utf-8',
          'authorization': 'Bearer $token',
          'Client-ID': clientId,
        },
      ),
    );
  }
}
