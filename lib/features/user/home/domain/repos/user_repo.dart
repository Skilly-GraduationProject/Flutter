
import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../entities/category_entitiy.dart';

abstract class UserRepo {

   Future<Either<Failure, CategoryEntity>> getAllCategories();
}