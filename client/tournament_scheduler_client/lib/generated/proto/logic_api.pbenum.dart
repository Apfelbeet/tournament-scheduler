///
//  Generated code. Do not modify.
//  source: logic_api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Acknowledgment_Status extends $pb.ProtobufEnum {
  static const Acknowledgment_Status OK = Acknowledgment_Status._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'OK');
  static const Acknowledgment_Status ERRROR = Acknowledgment_Status._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'ERRROR');
  static const Acknowledgment_Status SYNC_ERROR = Acknowledgment_Status._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'SYNC_ERROR');

  static const $core.List<Acknowledgment_Status> values = <Acknowledgment_Status> [
    OK,
    ERRROR,
    SYNC_ERROR,
  ];

  static final $core.Map<$core.int, Acknowledgment_Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Acknowledgment_Status? valueOf($core.int value) => _byValue[value];

  const Acknowledgment_Status._($core.int v, $core.String n) : super(v, n);
}

