import 'package:andersen_test1/data/users/repository/users_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectible_init.config.dart';

final getIt = GetIt.instance;

@injectableInit
GetIt configureDependencies() => $initGetIt(getIt);
