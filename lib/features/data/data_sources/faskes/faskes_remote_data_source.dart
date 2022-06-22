import 'package:dio/dio.dart';
import 'package:kbm/features/data/models/faskes/faskes_model.dart';
import 'package:kbm/features/data/models/faskes/faskes_response.dart';
import '../../../../config/base_url_config.dart';

abstract class FaskesRemoteDataSource {
  /// Panggil endpoint [BaseUrlConfig.FaskesEndpoint]/api/location
  /// Query parameter
  /// jenisFaskes - jenis faskes apa yang ingin ditampilkan
  ///
  /// Throws [DioError] untuk semua kode error
  Future<List<FaskesModel>> getListFaskes();
  Future<List<FaskesModel>> getFaskesDetail(int id);
}

class FaskesRemoteDataSourceImpl implements FaskesRemoteDataSource {
  final Dio dio;
  FaskesRemoteDataSourceImpl({
    required this.dio,
  });

  final baseUrl = BaseUrlConfig.baseUrlProductionPanelEndPoint;
  var token  = '1|5YYr3OU51FQEDxRlf7cLppl6lv5698tumQCDubG7';
  Map<String, String> get headers => {
    'Content-Type': 'application/json',
    "Authorization": "Bearer $token",
  };

  @override
  Future<List<FaskesModel>> getListFaskes() async {
    final path = '$baseUrl/locations';
    final response = await dio.get(
      path,
      options: Options(
        headers: headers
      )
    );
    // print(response.data);
    if (response.statusCode == 200) {
      return FaskesResponse.fromJson((response.data)).faskesList;
    } else {
      throw DioError(requestOptions: RequestOptions(path: path));
    }
  }

  @override
  Future<List<FaskesModel>> getFaskesDetail(int id) async {
    final path = '$baseUrl/locations/$id';
    final response = await dio.get(
      path,
      options: Options(
        headers: headers
      )
    );
    // print(response.data);
    if (response.statusCode == 200) {
      return FaskesResponse.fromJson((response.data)).faskesList;
    } else {
      throw DioError(requestOptions: RequestOptions(path: path));
    }
  }
}
