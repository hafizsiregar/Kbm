import 'package:equatable/equatable.dart';
import '../../features/data/data_api_failure.dart';
import '../utils/constant_error_message.dart';

/// Class abstrak [Failure].
abstract class Failure extends Equatable {
  final String message;
  
  const Failure(
    this.message,
  );

  @override
  List<Object> get props => [message];
}

/// Class ini berfungsi sebagai state jika app mengalami kegagalan dari API.
/// Dan class ini memiliki property [dataApiFailure].
class ServerFailure extends Failure {
  
  final DataApiFailure dataApiFailure;

  const ServerFailure(this.dataApiFailure) : super('');

  @override
  List<Object> get props => [dataApiFailure];

  @override
  String toString() {
    return 'ServerFailure{dataApiFailure: $dataApiFailure}';
  }
}

/// Class ini berfungsi sebagai state jika app mengalami kegagalan ketika mengambil data dari lokal/database.
/// Dan class ini memiliki property [errorMessage].
class CacheFailure extends Failure {
  final String errorMessage;

  const CacheFailure(this.errorMessage) : super('');

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'CacheFailure{errorMessage: $errorMessage}';
  }
}  

/// Class ini berfungsi sebagai state jika app dalam kondisi tidak terhubung ke mobile data/wifi.
/// Didalam class ini memiliki property [errorMessage].
class ConnectionFailure extends Failure {
  final String errorMessage = ConstantErrorMessage().connectionError;

  ConnectionFailure(String message) : super(message);

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'ConnectionFailure{errorMessage: $errorMessage}';
  }
}

class ParsingFailure extends Failure {
  final String errorMessage;

  const ParsingFailure(this.errorMessage) : super('');

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'ParsingFailure{errorMessage: $errorMessage}';
  }
}