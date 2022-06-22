import 'package:dartz/dartz.dart';
import 'package:kbm/features/domain/repositories/faskes/faskes_repository.dart';

import '../../../../core/error/failure.dart';
import '../../entities/faskes.dart';

class GetFaskesDetail {
  final FaskesRepository repository;
  GetFaskesDetail({required this.repository});

  Future<Either<Failure, List<Faskes>>> call(int id) {
    return repository.getFaskesDetail(id);
  }
}