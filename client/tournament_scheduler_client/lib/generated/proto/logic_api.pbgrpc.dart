///
//  Generated code. Do not modify.
//  source: logic_api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'logic_api.pb.dart' as $0;
export 'logic_api.pb.dart';

class ServerAPIClient extends $grpc.Client {
  static final _$createTournament =
      $grpc.ClientMethod<$0.TournamentCreate, $0.Acknowledgment>(
          '/logicAPI.ServerAPI/createTournament',
          ($0.TournamentCreate value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$removeTournament =
      $grpc.ClientMethod<$0.TournamentAccess, $0.Acknowledgment>(
          '/logicAPI.ServerAPI/removeTournament',
          ($0.TournamentAccess value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$getTournaments =
      $grpc.ClientMethod<$0.Empty, $0.TournamentDetailsList>(
          '/logicAPI.ServerAPI/getTournaments',
          ($0.Empty value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TournamentDetailsList.fromBuffer(value));
  static final _$getModes = $grpc.ClientMethod<$0.Empty, $0.Modes>(
      '/logicAPI.ServerAPI/getModes',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Modes.fromBuffer(value));
  static final _$connect = $grpc.ClientMethod<$0.Empty, $0.ServerEvent>(
      '/logicAPI.ServerAPI/connect',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ServerEvent.fromBuffer(value));
  static final _$disconnect = $grpc.ClientMethod<$0.Empty, $0.Acknowledgment>(
      '/logicAPI.ServerAPI/disconnect',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));

  ServerAPIClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.Acknowledgment> createTournament(
      $0.TournamentCreate request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTournament, request, options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> removeTournament(
      $0.TournamentAccess request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTournament, request, options: options);
  }

  $grpc.ResponseFuture<$0.TournamentDetailsList> getTournaments(
      $0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTournaments, request, options: options);
  }

  $grpc.ResponseFuture<$0.Modes> getModes($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getModes, request, options: options);
  }

  $grpc.ResponseStream<$0.ServerEvent> connect($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$connect, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> disconnect($0.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$disconnect, request, options: options);
  }
}

abstract class ServerAPIServiceBase extends $grpc.Service {
  $core.String get $name => 'logicAPI.ServerAPI';

  ServerAPIServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TournamentCreate, $0.Acknowledgment>(
        'createTournament',
        createTournament_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TournamentCreate.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TournamentAccess, $0.Acknowledgment>(
        'removeTournament',
        removeTournament_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TournamentAccess.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.TournamentDetailsList>(
        'getTournaments',
        getTournaments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.TournamentDetailsList value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Modes>(
        'getModes',
        getModes_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Modes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ServerEvent>(
        'connect',
        connect_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ServerEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.Acknowledgment>(
        'disconnect',
        disconnect_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
  }

  $async.Future<$0.Acknowledgment> createTournament_Pre($grpc.ServiceCall call,
      $async.Future<$0.TournamentCreate> request) async {
    return createTournament(call, await request);
  }

  $async.Future<$0.Acknowledgment> removeTournament_Pre($grpc.ServiceCall call,
      $async.Future<$0.TournamentAccess> request) async {
    return removeTournament(call, await request);
  }

  $async.Future<$0.TournamentDetailsList> getTournaments_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getTournaments(call, await request);
  }

  $async.Future<$0.Modes> getModes_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getModes(call, await request);
  }

  $async.Stream<$0.ServerEvent> connect_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async* {
    yield* connect(call, await request);
  }

  $async.Future<$0.Acknowledgment> disconnect_Pre(
      $grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return disconnect(call, await request);
  }

  $async.Future<$0.Acknowledgment> createTournament(
      $grpc.ServiceCall call, $0.TournamentCreate request);
  $async.Future<$0.Acknowledgment> removeTournament(
      $grpc.ServiceCall call, $0.TournamentAccess request);
  $async.Future<$0.TournamentDetailsList> getTournaments(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Modes> getModes($grpc.ServiceCall call, $0.Empty request);
  $async.Stream<$0.ServerEvent> connect(
      $grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.Acknowledgment> disconnect(
      $grpc.ServiceCall call, $0.Empty request);
}

class TournamentAPIClient extends $grpc.Client {
  static final _$subscribe =
      $grpc.ClientMethod<$0.TournamentAccess, $0.TournamentEvent>(
          '/logicAPI.TournamentAPI/subscribe',
          ($0.TournamentAccess value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.TournamentEvent.fromBuffer(value));
  static final _$unsubscribe =
      $grpc.ClientMethod<$0.TournamentAccess, $0.Acknowledgment>(
          '/logicAPI.TournamentAPI/unsubscribe',
          ($0.TournamentAccess value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$load =
      $grpc.ClientMethod<$0.TournamentAccess, $0.ResponseTournamentData>(
          '/logicAPI.TournamentAPI/load',
          ($0.TournamentAccess value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.ResponseTournamentData.fromBuffer(value));
  static final _$start =
      $grpc.ClientMethod<$0.TournamentAccess, $0.Acknowledgment>(
          '/logicAPI.TournamentAPI/start',
          ($0.TournamentAccess value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$reset =
      $grpc.ClientMethod<$0.TournamentAccess, $0.Acknowledgment>(
          '/logicAPI.TournamentAPI/reset',
          ($0.TournamentAccess value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$addTeam = $grpc.ClientMethod<$0.TeamAdd, $0.Acknowledgment>(
      '/logicAPI.TournamentAPI/addTeam',
      ($0.TeamAdd value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$editTeam = $grpc.ClientMethod<$0.TeamEdit, $0.Acknowledgment>(
      '/logicAPI.TournamentAPI/editTeam',
      ($0.TeamEdit value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$removeTeam =
      $grpc.ClientMethod<$0.TeamRemove, $0.Acknowledgment>(
          '/logicAPI.TournamentAPI/removeTeam',
          ($0.TeamRemove value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$setMode = $grpc.ClientMethod<$0.SetMode, $0.Acknowledgment>(
      '/logicAPI.TournamentAPI/setMode',
      ($0.SetMode value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));
  static final _$setResult =
      $grpc.ClientMethod<$0.SetResult, $0.Acknowledgment>(
          '/logicAPI.TournamentAPI/setResult',
          ($0.SetResult value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.Acknowledgment.fromBuffer(value));

  TournamentAPIClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseStream<$0.TournamentEvent> subscribe(
      $0.TournamentAccess request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribe, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> unsubscribe(
      $0.TournamentAccess request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unsubscribe, request, options: options);
  }

  $grpc.ResponseFuture<$0.ResponseTournamentData> load(
      $0.TournamentAccess request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$load, request, options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> start($0.TournamentAccess request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$start, request, options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> reset($0.TournamentAccess request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$reset, request, options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> addTeam($0.TeamAdd request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTeam, request, options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> editTeam($0.TeamEdit request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$editTeam, request, options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> removeTeam($0.TeamRemove request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeTeam, request, options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> setMode($0.SetMode request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setMode, request, options: options);
  }

  $grpc.ResponseFuture<$0.Acknowledgment> setResult($0.SetResult request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setResult, request, options: options);
  }
}

abstract class TournamentAPIServiceBase extends $grpc.Service {
  $core.String get $name => 'logicAPI.TournamentAPI';

  TournamentAPIServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.TournamentAccess, $0.TournamentEvent>(
        'subscribe',
        subscribe_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.TournamentAccess.fromBuffer(value),
        ($0.TournamentEvent value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TournamentAccess, $0.Acknowledgment>(
        'unsubscribe',
        unsubscribe_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TournamentAccess.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.TournamentAccess, $0.ResponseTournamentData>(
            'load',
            load_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.TournamentAccess.fromBuffer(value),
            ($0.ResponseTournamentData value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TournamentAccess, $0.Acknowledgment>(
        'start',
        start_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TournamentAccess.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TournamentAccess, $0.Acknowledgment>(
        'reset',
        reset_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TournamentAccess.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TeamAdd, $0.Acknowledgment>(
        'addTeam',
        addTeam_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TeamAdd.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TeamEdit, $0.Acknowledgment>(
        'editTeam',
        editTeam_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TeamEdit.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.TeamRemove, $0.Acknowledgment>(
        'removeTeam',
        removeTeam_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.TeamRemove.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetMode, $0.Acknowledgment>(
        'setMode',
        setMode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetMode.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetResult, $0.Acknowledgment>(
        'setResult',
        setResult_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetResult.fromBuffer(value),
        ($0.Acknowledgment value) => value.writeToBuffer()));
  }

  $async.Stream<$0.TournamentEvent> subscribe_Pre($grpc.ServiceCall call,
      $async.Future<$0.TournamentAccess> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Future<$0.Acknowledgment> unsubscribe_Pre($grpc.ServiceCall call,
      $async.Future<$0.TournamentAccess> request) async {
    return unsubscribe(call, await request);
  }

  $async.Future<$0.ResponseTournamentData> load_Pre($grpc.ServiceCall call,
      $async.Future<$0.TournamentAccess> request) async {
    return load(call, await request);
  }

  $async.Future<$0.Acknowledgment> start_Pre($grpc.ServiceCall call,
      $async.Future<$0.TournamentAccess> request) async {
    return start(call, await request);
  }

  $async.Future<$0.Acknowledgment> reset_Pre($grpc.ServiceCall call,
      $async.Future<$0.TournamentAccess> request) async {
    return reset(call, await request);
  }

  $async.Future<$0.Acknowledgment> addTeam_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TeamAdd> request) async {
    return addTeam(call, await request);
  }

  $async.Future<$0.Acknowledgment> editTeam_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TeamEdit> request) async {
    return editTeam(call, await request);
  }

  $async.Future<$0.Acknowledgment> removeTeam_Pre(
      $grpc.ServiceCall call, $async.Future<$0.TeamRemove> request) async {
    return removeTeam(call, await request);
  }

  $async.Future<$0.Acknowledgment> setMode_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SetMode> request) async {
    return setMode(call, await request);
  }

  $async.Future<$0.Acknowledgment> setResult_Pre(
      $grpc.ServiceCall call, $async.Future<$0.SetResult> request) async {
    return setResult(call, await request);
  }

  $async.Stream<$0.TournamentEvent> subscribe(
      $grpc.ServiceCall call, $0.TournamentAccess request);
  $async.Future<$0.Acknowledgment> unsubscribe(
      $grpc.ServiceCall call, $0.TournamentAccess request);
  $async.Future<$0.ResponseTournamentData> load(
      $grpc.ServiceCall call, $0.TournamentAccess request);
  $async.Future<$0.Acknowledgment> start(
      $grpc.ServiceCall call, $0.TournamentAccess request);
  $async.Future<$0.Acknowledgment> reset(
      $grpc.ServiceCall call, $0.TournamentAccess request);
  $async.Future<$0.Acknowledgment> addTeam(
      $grpc.ServiceCall call, $0.TeamAdd request);
  $async.Future<$0.Acknowledgment> editTeam(
      $grpc.ServiceCall call, $0.TeamEdit request);
  $async.Future<$0.Acknowledgment> removeTeam(
      $grpc.ServiceCall call, $0.TeamRemove request);
  $async.Future<$0.Acknowledgment> setMode(
      $grpc.ServiceCall call, $0.SetMode request);
  $async.Future<$0.Acknowledgment> setResult(
      $grpc.ServiceCall call, $0.SetResult request);
}
