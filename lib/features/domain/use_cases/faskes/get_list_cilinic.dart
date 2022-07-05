import 'package:dartz/dartz.dart';
import 'package:kbm/features/domain/repositories/faskes/faskes_repository.dart';
import '../../../../core/error/failure.dart';
import '../../entities/faskes.dart';

class GetListClinic {

  final FaskesRepository repository;
  GetListClinic({required this.repository});

  Future<Either<Failure, List<Faskes>>> call() {
    return repository.getListClinic();
  }
}