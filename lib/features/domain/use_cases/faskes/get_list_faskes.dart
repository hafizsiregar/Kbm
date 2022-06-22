import 'package:dartz/dartz.dart';
import 'package:kbm/features/domain/entities/faskes.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/faskes/faskes_repository.dart';

class GetListFaskes {
  
  final FaskesRepository repository;
  GetListFaskes({required this.repository});

  Future<Either<Failure, List<Faskes>>> call() {
    return repository.getListFaskes();
  }
}