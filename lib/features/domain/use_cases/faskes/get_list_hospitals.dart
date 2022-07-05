import 'package:dartz/dartz.dart';
import 'package:kbm/features/domain/repositories/faskes/faskes_repository.dart';
import '../../../../core/error/failure.dart';
import '../../entities/faskes.dart';

class GetListHospitals {

  final FaskesRepository repository;
  GetListHospitals({required this.repository});

  Future<Either<Failure, List<Faskes>>> call() {
    return repository.getListHospitals();
  }
}