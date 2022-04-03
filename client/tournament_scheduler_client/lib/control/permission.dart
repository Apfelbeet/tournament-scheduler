import 'package:tournament_scheduler_client/control/grpc/proto_logic_api.dart';

bool checkPermission(PERMISSION current, PERMISSION expected) => current.value >= expected.value;