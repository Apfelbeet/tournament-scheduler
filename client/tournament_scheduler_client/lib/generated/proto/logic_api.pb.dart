///
//  Generated code. Do not modify.
//  source: logic_api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'logic_api.pbenum.dart';

export 'logic_api.pbenum.dart';

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class Acknowledgment extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Acknowledgment', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..e<Acknowledgment_Status>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: Acknowledgment_Status.OK, valueOf: Acknowledgment_Status.valueOf, enumValues: Acknowledgment_Status.values)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'message')
    ..hasRequiredFields = false
  ;

  Acknowledgment._() : super();
  factory Acknowledgment({
    Acknowledgment_Status? status,
    $core.String? message,
  }) {
    final _result = create();
    if (status != null) {
      _result.status = status;
    }
    if (message != null) {
      _result.message = message;
    }
    return _result;
  }
  factory Acknowledgment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Acknowledgment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Acknowledgment clone() => Acknowledgment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Acknowledgment copyWith(void Function(Acknowledgment) updates) => super.copyWith((message) => updates(message as Acknowledgment)) as Acknowledgment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Acknowledgment create() => Acknowledgment._();
  Acknowledgment createEmptyInstance() => create();
  static $pb.PbList<Acknowledgment> createRepeated() => $pb.PbList<Acknowledgment>();
  @$core.pragma('dart2js:noInline')
  static Acknowledgment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Acknowledgment>(create);
  static Acknowledgment? _defaultInstance;

  @$pb.TagNumber(1)
  Acknowledgment_Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(Acknowledgment_Status v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

enum TournamentCreateAcknowledgment_Response {
  error, 
  access, 
  notSet
}

class TournamentCreateAcknowledgment extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TournamentCreateAcknowledgment_Response> _TournamentCreateAcknowledgment_ResponseByTag = {
    1 : TournamentCreateAcknowledgment_Response.error,
    2 : TournamentCreateAcknowledgment_Response.access,
    0 : TournamentCreateAcknowledgment_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentCreateAcknowledgment', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..aOM<TournamentAccess>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..hasRequiredFields = false
  ;

  TournamentCreateAcknowledgment._() : super();
  factory TournamentCreateAcknowledgment({
    $core.String? error,
    TournamentAccess? access,
  }) {
    final _result = create();
    if (error != null) {
      _result.error = error;
    }
    if (access != null) {
      _result.access = access;
    }
    return _result;
  }
  factory TournamentCreateAcknowledgment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentCreateAcknowledgment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentCreateAcknowledgment clone() => TournamentCreateAcknowledgment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentCreateAcknowledgment copyWith(void Function(TournamentCreateAcknowledgment) updates) => super.copyWith((message) => updates(message as TournamentCreateAcknowledgment)) as TournamentCreateAcknowledgment; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentCreateAcknowledgment create() => TournamentCreateAcknowledgment._();
  TournamentCreateAcknowledgment createEmptyInstance() => create();
  static $pb.PbList<TournamentCreateAcknowledgment> createRepeated() => $pb.PbList<TournamentCreateAcknowledgment>();
  @$core.pragma('dart2js:noInline')
  static TournamentCreateAcknowledgment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentCreateAcknowledgment>(create);
  static TournamentCreateAcknowledgment? _defaultInstance;

  TournamentCreateAcknowledgment_Response whichResponse() => _TournamentCreateAcknowledgment_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get error => $_getSZ(0);
  @$pb.TagNumber(1)
  set error($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasError() => $_has(0);
  @$pb.TagNumber(1)
  void clearError() => clearField(1);

  @$pb.TagNumber(2)
  TournamentAccess get access => $_getN(1);
  @$pb.TagNumber(2)
  set access(TournamentAccess v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearAccess() => clearField(2);
  @$pb.TagNumber(2)
  TournamentAccess ensureAccess() => $_ensure(1);
}

class TournamentCreate extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentCreate', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..hasRequiredFields = false
  ;

  TournamentCreate._() : super();
  factory TournamentCreate({
    $core.String? key,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    return _result;
  }
  factory TournamentCreate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentCreate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentCreate clone() => TournamentCreate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentCreate copyWith(void Function(TournamentCreate) updates) => super.copyWith((message) => updates(message as TournamentCreate)) as TournamentCreate; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentCreate create() => TournamentCreate._();
  TournamentCreate createEmptyInstance() => create();
  static $pb.PbList<TournamentCreate> createRepeated() => $pb.PbList<TournamentCreate>();
  @$core.pragma('dart2js:noInline')
  static TournamentCreate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentCreate>(create);
  static TournamentCreate? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);
}

class TournamentAccess extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentAccess', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sync')
    ..pPS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissionKeys', protoName: 'permissionKeys')
    ..hasRequiredFields = false
  ;

  TournamentAccess._() : super();
  factory TournamentAccess({
    $core.String? key,
    $core.String? sync,
    $core.Iterable<$core.String>? permissionKeys,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (sync != null) {
      _result.sync = sync;
    }
    if (permissionKeys != null) {
      _result.permissionKeys.addAll(permissionKeys);
    }
    return _result;
  }
  factory TournamentAccess.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentAccess.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentAccess clone() => TournamentAccess()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentAccess copyWith(void Function(TournamentAccess) updates) => super.copyWith((message) => updates(message as TournamentAccess)) as TournamentAccess; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentAccess create() => TournamentAccess._();
  TournamentAccess createEmptyInstance() => create();
  static $pb.PbList<TournamentAccess> createRepeated() => $pb.PbList<TournamentAccess>();
  @$core.pragma('dart2js:noInline')
  static TournamentAccess getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentAccess>(create);
  static TournamentAccess? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sync => $_getSZ(1);
  @$pb.TagNumber(2)
  set sync($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSync() => $_has(1);
  @$pb.TagNumber(2)
  void clearSync() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get permissionKeys => $_getList(2);
}

class TournamentDetailsList extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentDetailsList', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'keys')
    ..hasRequiredFields = false
  ;

  TournamentDetailsList._() : super();
  factory TournamentDetailsList({
    $core.Iterable<$core.String>? keys,
  }) {
    final _result = create();
    if (keys != null) {
      _result.keys.addAll(keys);
    }
    return _result;
  }
  factory TournamentDetailsList.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentDetailsList.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentDetailsList clone() => TournamentDetailsList()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentDetailsList copyWith(void Function(TournamentDetailsList) updates) => super.copyWith((message) => updates(message as TournamentDetailsList)) as TournamentDetailsList; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentDetailsList create() => TournamentDetailsList._();
  TournamentDetailsList createEmptyInstance() => create();
  static $pb.PbList<TournamentDetailsList> createRepeated() => $pb.PbList<TournamentDetailsList>();
  @$core.pragma('dart2js:noInline')
  static TournamentDetailsList getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentDetailsList>(create);
  static TournamentDetailsList? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get keys => $_getList(0);
}

class Mode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Mode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'title')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'description')
    ..hasRequiredFields = false
  ;

  Mode._() : super();
  factory Mode({
    $core.int? id,
    $core.String? title,
    $core.String? description,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (title != null) {
      _result.title = title;
    }
    if (description != null) {
      _result.description = description;
    }
    return _result;
  }
  factory Mode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Mode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Mode clone() => Mode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Mode copyWith(void Function(Mode) updates) => super.copyWith((message) => updates(message as Mode)) as Mode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Mode create() => Mode._();
  Mode createEmptyInstance() => create();
  static $pb.PbList<Mode> createRepeated() => $pb.PbList<Mode>();
  @$core.pragma('dart2js:noInline')
  static Mode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Mode>(create);
  static Mode? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);
}

class Modes extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Modes', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..pc<Mode>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modes', $pb.PbFieldType.PM, subBuilder: Mode.create)
    ..hasRequiredFields = false
  ;

  Modes._() : super();
  factory Modes({
    $core.Iterable<Mode>? modes,
  }) {
    final _result = create();
    if (modes != null) {
      _result.modes.addAll(modes);
    }
    return _result;
  }
  factory Modes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Modes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Modes clone() => Modes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Modes copyWith(void Function(Modes) updates) => super.copyWith((message) => updates(message as Modes)) as Modes; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Modes create() => Modes._();
  Modes createEmptyInstance() => create();
  static $pb.PbList<Modes> createRepeated() => $pb.PbList<Modes>();
  @$core.pragma('dart2js:noInline')
  static Modes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Modes>(create);
  static Modes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Mode> get modes => $_getList(0);
}

enum ResponseTournamentData_Response {
  data, 
  error, 
  notSet
}

class ResponseTournamentData extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ResponseTournamentData_Response> _ResponseTournamentData_ResponseByTag = {
    1 : ResponseTournamentData_Response.data,
    2 : ResponseTournamentData_Response.error,
    0 : ResponseTournamentData_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ResponseTournamentData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<TournamentData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data', subBuilder: TournamentData.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  ResponseTournamentData._() : super();
  factory ResponseTournamentData({
    TournamentData? data,
    $core.String? error,
  }) {
    final _result = create();
    if (data != null) {
      _result.data = data;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory ResponseTournamentData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResponseTournamentData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResponseTournamentData clone() => ResponseTournamentData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResponseTournamentData copyWith(void Function(ResponseTournamentData) updates) => super.copyWith((message) => updates(message as ResponseTournamentData)) as ResponseTournamentData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ResponseTournamentData create() => ResponseTournamentData._();
  ResponseTournamentData createEmptyInstance() => create();
  static $pb.PbList<ResponseTournamentData> createRepeated() => $pb.PbList<ResponseTournamentData>();
  @$core.pragma('dart2js:noInline')
  static ResponseTournamentData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResponseTournamentData>(create);
  static ResponseTournamentData? _defaultInstance;

  ResponseTournamentData_Response whichResponse() => _ResponseTournamentData_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TournamentData get data => $_getN(0);
  @$pb.TagNumber(1)
  set data(TournamentData v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
  @$pb.TagNumber(1)
  TournamentData ensureData() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class TournamentData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sync')
    ..aOM<TournamentStatusData>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', subBuilder: TournamentStatusData.create)
    ..aOM<TournamentTeamData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'teams', subBuilder: TournamentTeamData.create)
    ..aOM<TournamentStructureData>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'structure', subBuilder: TournamentStructureData.create)
    ..hasRequiredFields = false
  ;

  TournamentData._() : super();
  factory TournamentData({
    $core.String? key,
    $core.String? sync,
    TournamentStatusData? status,
    TournamentTeamData? teams,
    TournamentStructureData? structure,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (sync != null) {
      _result.sync = sync;
    }
    if (status != null) {
      _result.status = status;
    }
    if (teams != null) {
      _result.teams = teams;
    }
    if (structure != null) {
      _result.structure = structure;
    }
    return _result;
  }
  factory TournamentData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentData clone() => TournamentData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentData copyWith(void Function(TournamentData) updates) => super.copyWith((message) => updates(message as TournamentData)) as TournamentData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentData create() => TournamentData._();
  TournamentData createEmptyInstance() => create();
  static $pb.PbList<TournamentData> createRepeated() => $pb.PbList<TournamentData>();
  @$core.pragma('dart2js:noInline')
  static TournamentData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentData>(create);
  static TournamentData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sync => $_getSZ(1);
  @$pb.TagNumber(2)
  set sync($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSync() => $_has(1);
  @$pb.TagNumber(2)
  void clearSync() => clearField(2);

  @$pb.TagNumber(3)
  TournamentStatusData get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(TournamentStatusData v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
  @$pb.TagNumber(3)
  TournamentStatusData ensureStatus() => $_ensure(2);

  @$pb.TagNumber(4)
  TournamentTeamData get teams => $_getN(3);
  @$pb.TagNumber(4)
  set teams(TournamentTeamData v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasTeams() => $_has(3);
  @$pb.TagNumber(4)
  void clearTeams() => clearField(4);
  @$pb.TagNumber(4)
  TournamentTeamData ensureTeams() => $_ensure(3);

  @$pb.TagNumber(5)
  TournamentStructureData get structure => $_getN(4);
  @$pb.TagNumber(5)
  set structure(TournamentStructureData v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasStructure() => $_has(4);
  @$pb.TagNumber(5)
  void clearStructure() => clearField(5);
  @$pb.TagNumber(5)
  TournamentStructureData ensureStructure() => $_ensure(4);
}

enum ServerEvent_Event {
  tournaments, 
  error, 
  notSet
}

class ServerEvent extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, ServerEvent_Event> _ServerEvent_EventByTag = {
    1 : ServerEvent_Event.tournaments,
    2 : ServerEvent_Event.error,
    0 : ServerEvent_Event.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ServerEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<TournamentDetailsList>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'tournaments', subBuilder: TournamentDetailsList.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  ServerEvent._() : super();
  factory ServerEvent({
    TournamentDetailsList? tournaments,
    $core.String? error,
  }) {
    final _result = create();
    if (tournaments != null) {
      _result.tournaments = tournaments;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory ServerEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ServerEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ServerEvent clone() => ServerEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ServerEvent copyWith(void Function(ServerEvent) updates) => super.copyWith((message) => updates(message as ServerEvent)) as ServerEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ServerEvent create() => ServerEvent._();
  ServerEvent createEmptyInstance() => create();
  static $pb.PbList<ServerEvent> createRepeated() => $pb.PbList<ServerEvent>();
  @$core.pragma('dart2js:noInline')
  static ServerEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ServerEvent>(create);
  static ServerEvent? _defaultInstance;

  ServerEvent_Event whichEvent() => _ServerEvent_EventByTag[$_whichOneof(0)]!;
  void clearEvent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  TournamentDetailsList get tournaments => $_getN(0);
  @$pb.TagNumber(1)
  set tournaments(TournamentDetailsList v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTournaments() => $_has(0);
  @$pb.TagNumber(1)
  void clearTournaments() => clearField(1);
  @$pb.TagNumber(1)
  TournamentDetailsList ensureTournaments() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

enum TournamentEvent_Event {
  status, 
  teams, 
  structure, 
  error, 
  notSet
}

class TournamentEvent extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, TournamentEvent_Event> _TournamentEvent_EventByTag = {
    4 : TournamentEvent_Event.status,
    5 : TournamentEvent_Event.teams,
    6 : TournamentEvent_Event.structure,
    7 : TournamentEvent_Event.error,
    0 : TournamentEvent_Event.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentEvent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..oo(0, [4, 5, 6, 7])
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'sync')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'syncOld', protoName: 'syncOld')
    ..aOM<TournamentStatusData>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'status', subBuilder: TournamentStatusData.create)
    ..aOM<TournamentTeamData>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'teams', subBuilder: TournamentTeamData.create)
    ..aOM<TournamentStructureData>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'structure', subBuilder: TournamentStructureData.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error')
    ..hasRequiredFields = false
  ;

  TournamentEvent._() : super();
  factory TournamentEvent({
    $core.String? key,
    $core.String? sync,
    $core.String? syncOld,
    TournamentStatusData? status,
    TournamentTeamData? teams,
    TournamentStructureData? structure,
    $core.String? error,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (sync != null) {
      _result.sync = sync;
    }
    if (syncOld != null) {
      _result.syncOld = syncOld;
    }
    if (status != null) {
      _result.status = status;
    }
    if (teams != null) {
      _result.teams = teams;
    }
    if (structure != null) {
      _result.structure = structure;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory TournamentEvent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentEvent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentEvent clone() => TournamentEvent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentEvent copyWith(void Function(TournamentEvent) updates) => super.copyWith((message) => updates(message as TournamentEvent)) as TournamentEvent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentEvent create() => TournamentEvent._();
  TournamentEvent createEmptyInstance() => create();
  static $pb.PbList<TournamentEvent> createRepeated() => $pb.PbList<TournamentEvent>();
  @$core.pragma('dart2js:noInline')
  static TournamentEvent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentEvent>(create);
  static TournamentEvent? _defaultInstance;

  TournamentEvent_Event whichEvent() => _TournamentEvent_EventByTag[$_whichOneof(0)]!;
  void clearEvent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sync => $_getSZ(1);
  @$pb.TagNumber(2)
  set sync($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSync() => $_has(1);
  @$pb.TagNumber(2)
  void clearSync() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get syncOld => $_getSZ(2);
  @$pb.TagNumber(3)
  set syncOld($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSyncOld() => $_has(2);
  @$pb.TagNumber(3)
  void clearSyncOld() => clearField(3);

  @$pb.TagNumber(4)
  TournamentStatusData get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(TournamentStatusData v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
  @$pb.TagNumber(4)
  TournamentStatusData ensureStatus() => $_ensure(3);

  @$pb.TagNumber(5)
  TournamentTeamData get teams => $_getN(4);
  @$pb.TagNumber(5)
  set teams(TournamentTeamData v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTeams() => $_has(4);
  @$pb.TagNumber(5)
  void clearTeams() => clearField(5);
  @$pb.TagNumber(5)
  TournamentTeamData ensureTeams() => $_ensure(4);

  @$pb.TagNumber(6)
  TournamentStructureData get structure => $_getN(5);
  @$pb.TagNumber(6)
  set structure(TournamentStructureData v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasStructure() => $_has(5);
  @$pb.TagNumber(6)
  void clearStructure() => clearField(6);
  @$pb.TagNumber(6)
  TournamentStructureData ensureStructure() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get error => $_getSZ(6);
  @$pb.TagNumber(7)
  set error($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasError() => $_has(6);
  @$pb.TagNumber(7)
  void clearError() => clearField(7);
}

class TeamAdd extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TeamAdd', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOM<TournamentAccess>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  TeamAdd._() : super();
  factory TeamAdd({
    TournamentAccess? access,
    $core.String? name,
  }) {
    final _result = create();
    if (access != null) {
      _result.access = access;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory TeamAdd.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TeamAdd.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TeamAdd clone() => TeamAdd()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TeamAdd copyWith(void Function(TeamAdd) updates) => super.copyWith((message) => updates(message as TeamAdd)) as TeamAdd; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TeamAdd create() => TeamAdd._();
  TeamAdd createEmptyInstance() => create();
  static $pb.PbList<TeamAdd> createRepeated() => $pb.PbList<TeamAdd>();
  @$core.pragma('dart2js:noInline')
  static TeamAdd getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamAdd>(create);
  static TeamAdd? _defaultInstance;

  @$pb.TagNumber(1)
  TournamentAccess get access => $_getN(0);
  @$pb.TagNumber(1)
  set access(TournamentAccess v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccess() => clearField(1);
  @$pb.TagNumber(1)
  TournamentAccess ensureAccess() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class TeamEdit extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TeamEdit', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOM<TournamentAccess>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  TeamEdit._() : super();
  factory TeamEdit({
    TournamentAccess? access,
    $core.int? id,
    $core.String? name,
  }) {
    final _result = create();
    if (access != null) {
      _result.access = access;
    }
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory TeamEdit.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TeamEdit.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TeamEdit clone() => TeamEdit()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TeamEdit copyWith(void Function(TeamEdit) updates) => super.copyWith((message) => updates(message as TeamEdit)) as TeamEdit; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TeamEdit create() => TeamEdit._();
  TeamEdit createEmptyInstance() => create();
  static $pb.PbList<TeamEdit> createRepeated() => $pb.PbList<TeamEdit>();
  @$core.pragma('dart2js:noInline')
  static TeamEdit getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamEdit>(create);
  static TeamEdit? _defaultInstance;

  @$pb.TagNumber(1)
  TournamentAccess get access => $_getN(0);
  @$pb.TagNumber(1)
  set access(TournamentAccess v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccess() => clearField(1);
  @$pb.TagNumber(1)
  TournamentAccess ensureAccess() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);
}

class TeamRemove extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TeamRemove', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOM<TournamentAccess>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  TeamRemove._() : super();
  factory TeamRemove({
    TournamentAccess? access,
    $core.int? id,
  }) {
    final _result = create();
    if (access != null) {
      _result.access = access;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory TeamRemove.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TeamRemove.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TeamRemove clone() => TeamRemove()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TeamRemove copyWith(void Function(TeamRemove) updates) => super.copyWith((message) => updates(message as TeamRemove)) as TeamRemove; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TeamRemove create() => TeamRemove._();
  TeamRemove createEmptyInstance() => create();
  static $pb.PbList<TeamRemove> createRepeated() => $pb.PbList<TeamRemove>();
  @$core.pragma('dart2js:noInline')
  static TeamRemove getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamRemove>(create);
  static TeamRemove? _defaultInstance;

  @$pb.TagNumber(1)
  TournamentAccess get access => $_getN(0);
  @$pb.TagNumber(1)
  set access(TournamentAccess v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccess() => clearField(1);
  @$pb.TagNumber(1)
  TournamentAccess ensureAccess() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class SetMode extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetMode', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOM<TournamentAccess>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  SetMode._() : super();
  factory SetMode({
    TournamentAccess? access,
    $core.int? id,
  }) {
    final _result = create();
    if (access != null) {
      _result.access = access;
    }
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory SetMode.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetMode.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetMode clone() => SetMode()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetMode copyWith(void Function(SetMode) updates) => super.copyWith((message) => updates(message as SetMode)) as SetMode; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetMode create() => SetMode._();
  SetMode createEmptyInstance() => create();
  static $pb.PbList<SetMode> createRepeated() => $pb.PbList<SetMode>();
  @$core.pragma('dart2js:noInline')
  static SetMode getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetMode>(create);
  static SetMode? _defaultInstance;

  @$pb.TagNumber(1)
  TournamentAccess get access => $_getN(0);
  @$pb.TagNumber(1)
  set access(TournamentAccess v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccess() => clearField(1);
  @$pb.TagNumber(1)
  TournamentAccess ensureAccess() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get id => $_getIZ(1);
  @$pb.TagNumber(2)
  set id($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasId() => $_has(1);
  @$pb.TagNumber(2)
  void clearId() => clearField(2);
}

class SetResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetResult', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOM<TournamentAccess>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..aOM<GameData>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'game', subBuilder: GameData.create)
    ..hasRequiredFields = false
  ;

  SetResult._() : super();
  factory SetResult({
    TournamentAccess? access,
    GameData? game,
  }) {
    final _result = create();
    if (access != null) {
      _result.access = access;
    }
    if (game != null) {
      _result.game = game;
    }
    return _result;
  }
  factory SetResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetResult clone() => SetResult()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetResult copyWith(void Function(SetResult) updates) => super.copyWith((message) => updates(message as SetResult)) as SetResult; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetResult create() => SetResult._();
  SetResult createEmptyInstance() => create();
  static $pb.PbList<SetResult> createRepeated() => $pb.PbList<SetResult>();
  @$core.pragma('dart2js:noInline')
  static SetResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetResult>(create);
  static SetResult? _defaultInstance;

  @$pb.TagNumber(1)
  TournamentAccess get access => $_getN(0);
  @$pb.TagNumber(1)
  set access(TournamentAccess v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccess() => clearField(1);
  @$pb.TagNumber(1)
  TournamentAccess ensureAccess() => $_ensure(0);

  @$pb.TagNumber(2)
  GameData get game => $_getN(1);
  @$pb.TagNumber(2)
  set game(GameData v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasGame() => $_has(1);
  @$pb.TagNumber(2)
  void clearGame() => clearField(2);
  @$pb.TagNumber(2)
  GameData ensureGame() => $_ensure(1);
}

class GameData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'GameData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scoreA', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scoreB', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  GameData._() : super();
  factory GameData({
    $core.int? id,
    $core.int? scoreA,
    $core.int? scoreB,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (scoreA != null) {
      _result.scoreA = scoreA;
    }
    if (scoreB != null) {
      _result.scoreB = scoreB;
    }
    return _result;
  }
  factory GameData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GameData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GameData clone() => GameData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GameData copyWith(void Function(GameData) updates) => super.copyWith((message) => updates(message as GameData)) as GameData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static GameData create() => GameData._();
  GameData createEmptyInstance() => create();
  static $pb.PbList<GameData> createRepeated() => $pb.PbList<GameData>();
  @$core.pragma('dart2js:noInline')
  static GameData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GameData>(create);
  static GameData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get scoreA => $_getIZ(1);
  @$pb.TagNumber(2)
  set scoreA($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasScoreA() => $_has(1);
  @$pb.TagNumber(2)
  void clearScoreA() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get scoreB => $_getIZ(2);
  @$pb.TagNumber(3)
  set scoreB($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasScoreB() => $_has(2);
  @$pb.TagNumber(3)
  void clearScoreB() => clearField(3);
}

class TournamentStatusData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentStatusData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'started')
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'mode', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'winner', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  TournamentStatusData._() : super();
  factory TournamentStatusData({
    $core.bool? started,
    $core.int? mode,
    $core.int? winner,
  }) {
    final _result = create();
    if (started != null) {
      _result.started = started;
    }
    if (mode != null) {
      _result.mode = mode;
    }
    if (winner != null) {
      _result.winner = winner;
    }
    return _result;
  }
  factory TournamentStatusData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentStatusData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentStatusData clone() => TournamentStatusData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentStatusData copyWith(void Function(TournamentStatusData) updates) => super.copyWith((message) => updates(message as TournamentStatusData)) as TournamentStatusData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentStatusData create() => TournamentStatusData._();
  TournamentStatusData createEmptyInstance() => create();
  static $pb.PbList<TournamentStatusData> createRepeated() => $pb.PbList<TournamentStatusData>();
  @$core.pragma('dart2js:noInline')
  static TournamentStatusData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentStatusData>(create);
  static TournamentStatusData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get started => $_getBF(0);
  @$pb.TagNumber(1)
  set started($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStarted() => $_has(0);
  @$pb.TagNumber(1)
  void clearStarted() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get mode => $_getIZ(1);
  @$pb.TagNumber(2)
  set mode($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearMode() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get winner => $_getIZ(2);
  @$pb.TagNumber(3)
  set winner($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWinner() => $_has(2);
  @$pb.TagNumber(3)
  void clearWinner() => clearField(3);
}

class TournamentTeamData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentTeamData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..pc<TeamData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'teams', $pb.PbFieldType.PM, subBuilder: TeamData.create)
    ..hasRequiredFields = false
  ;

  TournamentTeamData._() : super();
  factory TournamentTeamData({
    $core.Iterable<TeamData>? teams,
  }) {
    final _result = create();
    if (teams != null) {
      _result.teams.addAll(teams);
    }
    return _result;
  }
  factory TournamentTeamData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentTeamData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentTeamData clone() => TournamentTeamData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentTeamData copyWith(void Function(TournamentTeamData) updates) => super.copyWith((message) => updates(message as TournamentTeamData)) as TournamentTeamData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentTeamData create() => TournamentTeamData._();
  TournamentTeamData createEmptyInstance() => create();
  static $pb.PbList<TournamentTeamData> createRepeated() => $pb.PbList<TournamentTeamData>();
  @$core.pragma('dart2js:noInline')
  static TournamentTeamData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentTeamData>(create);
  static TournamentTeamData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<TeamData> get teams => $_getList(0);
}

class TeamData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TeamData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..hasRequiredFields = false
  ;

  TeamData._() : super();
  factory TeamData({
    $core.int? id,
    $core.String? name,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    return _result;
  }
  factory TeamData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TeamData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TeamData clone() => TeamData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TeamData copyWith(void Function(TeamData) updates) => super.copyWith((message) => updates(message as TeamData)) as TeamData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TeamData create() => TeamData._();
  TeamData createEmptyInstance() => create();
  static $pb.PbList<TeamData> createRepeated() => $pb.PbList<TeamData>();
  @$core.pragma('dart2js:noInline')
  static TeamData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamData>(create);
  static TeamData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
}

class TournamentStructureData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'TournamentStructureData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..pc<StructureData>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'structures', $pb.PbFieldType.PM, subBuilder: StructureData.create)
    ..hasRequiredFields = false
  ;

  TournamentStructureData._() : super();
  factory TournamentStructureData({
    $core.Iterable<StructureData>? structures,
  }) {
    final _result = create();
    if (structures != null) {
      _result.structures.addAll(structures);
    }
    return _result;
  }
  factory TournamentStructureData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TournamentStructureData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TournamentStructureData clone() => TournamentStructureData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TournamentStructureData copyWith(void Function(TournamentStructureData) updates) => super.copyWith((message) => updates(message as TournamentStructureData)) as TournamentStructureData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TournamentStructureData create() => TournamentStructureData._();
  TournamentStructureData createEmptyInstance() => create();
  static $pb.PbList<TournamentStructureData> createRepeated() => $pb.PbList<TournamentStructureData>();
  @$core.pragma('dart2js:noInline')
  static TournamentStructureData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TournamentStructureData>(create);
  static TournamentStructureData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<StructureData> get structures => $_getList(0);
}

class StructureData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'StructureData', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id', $pb.PbFieldType.O3)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'type')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'label')
    ..aOB(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'visible')
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'state', $pb.PbFieldType.O3)
    ..pc<Stats>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'stats', $pb.PbFieldType.PM, subBuilder: Stats.create)
    ..aOS(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'data')
    ..p<$core.int>(8, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'modules', $pb.PbFieldType.P3)
    ..p<$core.int>(9, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'games', $pb.PbFieldType.P3)
    ..p<$core.int>(10, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'down', $pb.PbFieldType.P3)
    ..p<$core.int>(11, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'up', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  StructureData._() : super();
  factory StructureData({
    $core.int? id,
    $core.String? type,
    $core.String? label,
    $core.bool? visible,
    $core.int? state,
    $core.Iterable<Stats>? stats,
    $core.String? data,
    $core.Iterable<$core.int>? modules,
    $core.Iterable<$core.int>? games,
    $core.Iterable<$core.int>? down,
    $core.Iterable<$core.int>? up,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (type != null) {
      _result.type = type;
    }
    if (label != null) {
      _result.label = label;
    }
    if (visible != null) {
      _result.visible = visible;
    }
    if (state != null) {
      _result.state = state;
    }
    if (stats != null) {
      _result.stats.addAll(stats);
    }
    if (data != null) {
      _result.data = data;
    }
    if (modules != null) {
      _result.modules.addAll(modules);
    }
    if (games != null) {
      _result.games.addAll(games);
    }
    if (down != null) {
      _result.down.addAll(down);
    }
    if (up != null) {
      _result.up.addAll(up);
    }
    return _result;
  }
  factory StructureData.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StructureData.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StructureData clone() => StructureData()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StructureData copyWith(void Function(StructureData) updates) => super.copyWith((message) => updates(message as StructureData)) as StructureData; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static StructureData create() => StructureData._();
  StructureData createEmptyInstance() => create();
  static $pb.PbList<StructureData> createRepeated() => $pb.PbList<StructureData>();
  @$core.pragma('dart2js:noInline')
  static StructureData getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StructureData>(create);
  static StructureData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get id => $_getIZ(0);
  @$pb.TagNumber(1)
  set id($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get type => $_getSZ(1);
  @$pb.TagNumber(2)
  set type($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get label => $_getSZ(2);
  @$pb.TagNumber(3)
  set label($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLabel() => $_has(2);
  @$pb.TagNumber(3)
  void clearLabel() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get visible => $_getBF(3);
  @$pb.TagNumber(4)
  set visible($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasVisible() => $_has(3);
  @$pb.TagNumber(4)
  void clearVisible() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get state => $_getIZ(4);
  @$pb.TagNumber(5)
  set state($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasState() => $_has(4);
  @$pb.TagNumber(5)
  void clearState() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<Stats> get stats => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get data => $_getSZ(6);
  @$pb.TagNumber(7)
  set data($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasData() => $_has(6);
  @$pb.TagNumber(7)
  void clearData() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get modules => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$core.int> get games => $_getList(8);

  @$pb.TagNumber(10)
  $core.List<$core.int> get down => $_getList(9);

  @$pb.TagNumber(11)
  $core.List<$core.int> get up => $_getList(10);
}

class Stats extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Stats', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..a<$core.int>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'team', $pb.PbFieldType.O3)
    ..a<$core.int>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'points', $pb.PbFieldType.O3)
    ..a<$core.int>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'wins', $pb.PbFieldType.O3)
    ..a<$core.int>(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'loses', $pb.PbFieldType.O3)
    ..a<$core.int>(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'draws', $pb.PbFieldType.O3)
    ..a<$core.int>(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'scored', $pb.PbFieldType.O3)
    ..a<$core.int>(7, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'conceded', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Stats._() : super();
  factory Stats({
    $core.int? team,
    $core.int? points,
    $core.int? wins,
    $core.int? loses,
    $core.int? draws,
    $core.int? scored,
    $core.int? conceded,
  }) {
    final _result = create();
    if (team != null) {
      _result.team = team;
    }
    if (points != null) {
      _result.points = points;
    }
    if (wins != null) {
      _result.wins = wins;
    }
    if (loses != null) {
      _result.loses = loses;
    }
    if (draws != null) {
      _result.draws = draws;
    }
    if (scored != null) {
      _result.scored = scored;
    }
    if (conceded != null) {
      _result.conceded = conceded;
    }
    return _result;
  }
  factory Stats.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Stats.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Stats clone() => Stats()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Stats copyWith(void Function(Stats) updates) => super.copyWith((message) => updates(message as Stats)) as Stats; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Stats create() => Stats._();
  Stats createEmptyInstance() => create();
  static $pb.PbList<Stats> createRepeated() => $pb.PbList<Stats>();
  @$core.pragma('dart2js:noInline')
  static Stats getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Stats>(create);
  static Stats? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get team => $_getIZ(0);
  @$pb.TagNumber(1)
  set team($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTeam() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeam() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get points => $_getIZ(1);
  @$pb.TagNumber(2)
  set points($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPoints() => $_has(1);
  @$pb.TagNumber(2)
  void clearPoints() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get wins => $_getIZ(2);
  @$pb.TagNumber(3)
  set wins($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasWins() => $_has(2);
  @$pb.TagNumber(3)
  void clearWins() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get loses => $_getIZ(3);
  @$pb.TagNumber(4)
  set loses($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLoses() => $_has(3);
  @$pb.TagNumber(4)
  void clearLoses() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get draws => $_getIZ(4);
  @$pb.TagNumber(5)
  set draws($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDraws() => $_has(4);
  @$pb.TagNumber(5)
  void clearDraws() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get scored => $_getIZ(5);
  @$pb.TagNumber(6)
  set scored($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasScored() => $_has(5);
  @$pb.TagNumber(6)
  void clearScored() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get conceded => $_getIZ(6);
  @$pb.TagNumber(7)
  set conceded($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasConceded() => $_has(6);
  @$pb.TagNumber(7)
  void clearConceded() => clearField(7);
}

class Permission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Permission', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..e<PERMISSION>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', $pb.PbFieldType.OE, defaultOrMaker: PERMISSION.NONE, valueOf: PERMISSION.valueOf, enumValues: PERMISSION.values)
    ..hasRequiredFields = false
  ;

  Permission._() : super();
  factory Permission({
    PERMISSION? permission,
  }) {
    final _result = create();
    if (permission != null) {
      _result.permission = permission;
    }
    return _result;
  }
  factory Permission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Permission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Permission clone() => Permission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Permission copyWith(void Function(Permission) updates) => super.copyWith((message) => updates(message as Permission)) as Permission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Permission create() => Permission._();
  Permission createEmptyInstance() => create();
  static $pb.PbList<Permission> createRepeated() => $pb.PbList<Permission>();
  @$core.pragma('dart2js:noInline')
  static Permission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Permission>(create);
  static Permission? _defaultInstance;

  @$pb.TagNumber(1)
  PERMISSION get permission => $_getN(0);
  @$pb.TagNumber(1)
  set permission(PERMISSION v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermission() => clearField(1);
}

class PermissionQuery extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PermissionQuery', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOM<TournamentAccess>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissionKey', protoName: 'permissionKey')
    ..hasRequiredFields = false
  ;

  PermissionQuery._() : super();
  factory PermissionQuery({
    TournamentAccess? access,
    $core.String? permissionKey,
  }) {
    final _result = create();
    if (access != null) {
      _result.access = access;
    }
    if (permissionKey != null) {
      _result.permissionKey = permissionKey;
    }
    return _result;
  }
  factory PermissionQuery.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionQuery.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PermissionQuery clone() => PermissionQuery()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PermissionQuery copyWith(void Function(PermissionQuery) updates) => super.copyWith((message) => updates(message as PermissionQuery)) as PermissionQuery; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PermissionQuery create() => PermissionQuery._();
  PermissionQuery createEmptyInstance() => create();
  static $pb.PbList<PermissionQuery> createRepeated() => $pb.PbList<PermissionQuery>();
  @$core.pragma('dart2js:noInline')
  static PermissionQuery getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionQuery>(create);
  static PermissionQuery? _defaultInstance;

  @$pb.TagNumber(1)
  TournamentAccess get access => $_getN(0);
  @$pb.TagNumber(1)
  set access(TournamentAccess v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccess() => clearField(1);
  @$pb.TagNumber(1)
  TournamentAccess ensureAccess() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get permissionKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set permissionKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionKey() => clearField(2);
}

class PermissionKeys extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PermissionKeys', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..pPS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissionKeys', protoName: 'permissionKeys')
    ..hasRequiredFields = false
  ;

  PermissionKeys._() : super();
  factory PermissionKeys({
    $core.Iterable<$core.String>? permissionKeys,
  }) {
    final _result = create();
    if (permissionKeys != null) {
      _result.permissionKeys.addAll(permissionKeys);
    }
    return _result;
  }
  factory PermissionKeys.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionKeys.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PermissionKeys clone() => PermissionKeys()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PermissionKeys copyWith(void Function(PermissionKeys) updates) => super.copyWith((message) => updates(message as PermissionKeys)) as PermissionKeys; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PermissionKeys create() => PermissionKeys._();
  PermissionKeys createEmptyInstance() => create();
  static $pb.PbList<PermissionKeys> createRepeated() => $pb.PbList<PermissionKeys>();
  @$core.pragma('dart2js:noInline')
  static PermissionKeys getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionKeys>(create);
  static PermissionKeys? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.String> get permissionKeys => $_getList(0);
}

class KeyPermissionPair extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KeyPermissionPair', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'key')
    ..e<PERMISSION>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', $pb.PbFieldType.OE, defaultOrMaker: PERMISSION.NONE, valueOf: PERMISSION.valueOf, enumValues: PERMISSION.values)
    ..hasRequiredFields = false
  ;

  KeyPermissionPair._() : super();
  factory KeyPermissionPair({
    $core.String? key,
    PERMISSION? permission,
  }) {
    final _result = create();
    if (key != null) {
      _result.key = key;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    return _result;
  }
  factory KeyPermissionPair.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeyPermissionPair.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeyPermissionPair clone() => KeyPermissionPair()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeyPermissionPair copyWith(void Function(KeyPermissionPair) updates) => super.copyWith((message) => updates(message as KeyPermissionPair)) as KeyPermissionPair; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeyPermissionPair create() => KeyPermissionPair._();
  KeyPermissionPair createEmptyInstance() => create();
  static $pb.PbList<KeyPermissionPair> createRepeated() => $pb.PbList<KeyPermissionPair>();
  @$core.pragma('dart2js:noInline')
  static KeyPermissionPair getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyPermissionPair>(create);
  static KeyPermissionPair? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  PERMISSION get permission => $_getN(1);
  @$pb.TagNumber(2)
  set permission(PERMISSION v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermission() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermission() => clearField(2);
}

class KeyPermissionPairs extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'KeyPermissionPairs', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..pc<KeyPermissionPair>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pairs', $pb.PbFieldType.PM, subBuilder: KeyPermissionPair.create)
    ..hasRequiredFields = false
  ;

  KeyPermissionPairs._() : super();
  factory KeyPermissionPairs({
    $core.Iterable<KeyPermissionPair>? pairs,
  }) {
    final _result = create();
    if (pairs != null) {
      _result.pairs.addAll(pairs);
    }
    return _result;
  }
  factory KeyPermissionPairs.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory KeyPermissionPairs.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  KeyPermissionPairs clone() => KeyPermissionPairs()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  KeyPermissionPairs copyWith(void Function(KeyPermissionPairs) updates) => super.copyWith((message) => updates(message as KeyPermissionPairs)) as KeyPermissionPairs; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static KeyPermissionPairs create() => KeyPermissionPairs._();
  KeyPermissionPairs createEmptyInstance() => create();
  static $pb.PbList<KeyPermissionPairs> createRepeated() => $pb.PbList<KeyPermissionPairs>();
  @$core.pragma('dart2js:noInline')
  static KeyPermissionPairs getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<KeyPermissionPairs>(create);
  static KeyPermissionPairs? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<KeyPermissionPair> get pairs => $_getList(0);
}

class SetPermission extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'SetPermission', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOM<TournamentAccess>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissionKey', protoName: 'permissionKey')
    ..e<PERMISSION>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permission', $pb.PbFieldType.OE, defaultOrMaker: PERMISSION.NONE, valueOf: PERMISSION.valueOf, enumValues: PERMISSION.values)
    ..hasRequiredFields = false
  ;

  SetPermission._() : super();
  factory SetPermission({
    TournamentAccess? access,
    $core.String? permissionKey,
    PERMISSION? permission,
  }) {
    final _result = create();
    if (access != null) {
      _result.access = access;
    }
    if (permissionKey != null) {
      _result.permissionKey = permissionKey;
    }
    if (permission != null) {
      _result.permission = permission;
    }
    return _result;
  }
  factory SetPermission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetPermission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetPermission clone() => SetPermission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetPermission copyWith(void Function(SetPermission) updates) => super.copyWith((message) => updates(message as SetPermission)) as SetPermission; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static SetPermission create() => SetPermission._();
  SetPermission createEmptyInstance() => create();
  static $pb.PbList<SetPermission> createRepeated() => $pb.PbList<SetPermission>();
  @$core.pragma('dart2js:noInline')
  static SetPermission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetPermission>(create);
  static SetPermission? _defaultInstance;

  @$pb.TagNumber(1)
  TournamentAccess get access => $_getN(0);
  @$pb.TagNumber(1)
  set access(TournamentAccess v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccess() => clearField(1);
  @$pb.TagNumber(1)
  TournamentAccess ensureAccess() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get permissionKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set permissionKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionKey() => clearField(2);

  @$pb.TagNumber(3)
  PERMISSION get permission => $_getN(2);
  @$pb.TagNumber(3)
  set permission(PERMISSION v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermission() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermission() => clearField(3);
}

class RemovePermissionKey extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'RemovePermissionKey', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'logicAPI'), createEmptyInstance: create)
    ..aOM<TournamentAccess>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'access', subBuilder: TournamentAccess.create)
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'permissionKey', protoName: 'permissionKey')
    ..hasRequiredFields = false
  ;

  RemovePermissionKey._() : super();
  factory RemovePermissionKey({
    TournamentAccess? access,
    $core.String? permissionKey,
  }) {
    final _result = create();
    if (access != null) {
      _result.access = access;
    }
    if (permissionKey != null) {
      _result.permissionKey = permissionKey;
    }
    return _result;
  }
  factory RemovePermissionKey.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemovePermissionKey.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemovePermissionKey clone() => RemovePermissionKey()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemovePermissionKey copyWith(void Function(RemovePermissionKey) updates) => super.copyWith((message) => updates(message as RemovePermissionKey)) as RemovePermissionKey; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static RemovePermissionKey create() => RemovePermissionKey._();
  RemovePermissionKey createEmptyInstance() => create();
  static $pb.PbList<RemovePermissionKey> createRepeated() => $pb.PbList<RemovePermissionKey>();
  @$core.pragma('dart2js:noInline')
  static RemovePermissionKey getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemovePermissionKey>(create);
  static RemovePermissionKey? _defaultInstance;

  @$pb.TagNumber(1)
  TournamentAccess get access => $_getN(0);
  @$pb.TagNumber(1)
  set access(TournamentAccess v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccess() => clearField(1);
  @$pb.TagNumber(1)
  TournamentAccess ensureAccess() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get permissionKey => $_getSZ(1);
  @$pb.TagNumber(2)
  set permissionKey($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionKey() => clearField(2);
}

