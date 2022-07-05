import 'package:dartz/dartz.dart';
import 'package:kbm/features/domain/entities/faskes.dart';

import '../../../../core/error/failure.dart';
import '../../repositories/faskes/faskes_repository.dart';

class GetListAllFaskes {
  
  final FaskesRepository repository;
  GetListAllFaskes({required this.repository});

  Future<Either<Failure, List<Faskes>>> call() {
    return repository.getListAllFaskes();
  }
}