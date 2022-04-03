///
//  Generated code. Do not modify.
//  source: logic_api.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use pERMISSIONDescriptor instead')
const PERMISSION$json = const {
  '1': 'PERMISSION',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'READ_ONLY', '2': 1},
    const {'1': 'EDIT', '2': 2},
    const {'1': 'MOD', '2': 3},
    const {'1': 'OWNER', '2': 4},
  ],
};

/// Descriptor for `PERMISSION`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List pERMISSIONDescriptor = $convert.base64Decode('CgpQRVJNSVNTSU9OEggKBE5PTkUQABINCglSRUFEX09OTFkQARIICgRFRElUEAISBwoDTU9EEAMSCQoFT1dORVIQBA==');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
@$core.Deprecated('Use acknowledgmentDescriptor instead')
const Acknowledgment$json = const {
  '1': 'Acknowledgment',
  '2': const [
    const {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.logicAPI.Acknowledgment.Status', '10': 'status'},
    const {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
  '4': const [Acknowledgment_Status$json],
};

@$core.Deprecated('Use acknowledgmentDescriptor instead')
const Acknowledgment_Status$json = const {
  '1': 'Status',
  '2': const [
    const {'1': 'OK', '2': 0},
    const {'1': 'ERRROR', '2': 1},
    const {'1': 'SYNC_ERROR', '2': 2},
  ],
};

/// Descriptor for `Acknowledgment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List acknowledgmentDescriptor = $convert.base64Decode('Cg5BY2tub3dsZWRnbWVudBI3CgZzdGF0dXMYASABKA4yHy5sb2dpY0FQSS5BY2tub3dsZWRnbWVudC5TdGF0dXNSBnN0YXR1cxIYCgdtZXNzYWdlGAIgASgJUgdtZXNzYWdlIiwKBlN0YXR1cxIGCgJPSxAAEgoKBkVSUlJPUhABEg4KClNZTkNfRVJST1IQAg==');
@$core.Deprecated('Use tournamentCreateAcknowledgmentDescriptor instead')
const TournamentCreateAcknowledgment$json = const {
  '1': 'TournamentCreateAcknowledgment',
  '2': const [
    const {'1': 'error', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'error'},
    const {'1': 'access', '3': 2, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '9': 0, '10': 'access'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `TournamentCreateAcknowledgment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentCreateAcknowledgmentDescriptor = $convert.base64Decode('Ch5Ub3VybmFtZW50Q3JlYXRlQWNrbm93bGVkZ21lbnQSFgoFZXJyb3IYASABKAlIAFIFZXJyb3ISNAoGYWNjZXNzGAIgASgLMhoubG9naWNBUEkuVG91cm5hbWVudEFjY2Vzc0gAUgZhY2Nlc3NCCgoIcmVzcG9uc2U=');
@$core.Deprecated('Use tournamentCreateDescriptor instead')
const TournamentCreate$json = const {
  '1': 'TournamentCreate',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
  ],
};

/// Descriptor for `TournamentCreate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentCreateDescriptor = $convert.base64Decode('ChBUb3VybmFtZW50Q3JlYXRlEhAKA2tleRgBIAEoCVIDa2V5');
@$core.Deprecated('Use tournamentAccessDescriptor instead')
const TournamentAccess$json = const {
  '1': 'TournamentAccess',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'sync', '3': 2, '4': 1, '5': 9, '10': 'sync'},
    const {'1': 'permissionKeys', '3': 3, '4': 3, '5': 9, '10': 'permissionKeys'},
  ],
};

/// Descriptor for `TournamentAccess`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentAccessDescriptor = $convert.base64Decode('ChBUb3VybmFtZW50QWNjZXNzEhAKA2tleRgBIAEoCVIDa2V5EhIKBHN5bmMYAiABKAlSBHN5bmMSJgoOcGVybWlzc2lvbktleXMYAyADKAlSDnBlcm1pc3Npb25LZXlz');
@$core.Deprecated('Use tournamentDetailsListDescriptor instead')
const TournamentDetailsList$json = const {
  '1': 'TournamentDetailsList',
  '2': const [
    const {'1': 'keys', '3': 1, '4': 3, '5': 9, '10': 'keys'},
  ],
};

/// Descriptor for `TournamentDetailsList`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentDetailsListDescriptor = $convert.base64Decode('ChVUb3VybmFtZW50RGV0YWlsc0xpc3QSEgoEa2V5cxgBIAMoCVIEa2V5cw==');
@$core.Deprecated('Use modeDescriptor instead')
const Mode$json = const {
  '1': 'Mode',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    const {'1': 'description', '3': 3, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `Mode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modeDescriptor = $convert.base64Decode('CgRNb2RlEg4KAmlkGAEgASgFUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGUSIAoLZGVzY3JpcHRpb24YAyABKAlSC2Rlc2NyaXB0aW9u');
@$core.Deprecated('Use modesDescriptor instead')
const Modes$json = const {
  '1': 'Modes',
  '2': const [
    const {'1': 'modes', '3': 1, '4': 3, '5': 11, '6': '.logicAPI.Mode', '10': 'modes'},
  ],
};

/// Descriptor for `Modes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List modesDescriptor = $convert.base64Decode('CgVNb2RlcxIkCgVtb2RlcxgBIAMoCzIOLmxvZ2ljQVBJLk1vZGVSBW1vZGVz');
@$core.Deprecated('Use responseTournamentDataDescriptor instead')
const ResponseTournamentData$json = const {
  '1': 'ResponseTournamentData',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentData', '9': 0, '10': 'data'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'response'},
  ],
};

/// Descriptor for `ResponseTournamentData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseTournamentDataDescriptor = $convert.base64Decode('ChZSZXNwb25zZVRvdXJuYW1lbnREYXRhEi4KBGRhdGEYASABKAsyGC5sb2dpY0FQSS5Ub3VybmFtZW50RGF0YUgAUgRkYXRhEhYKBWVycm9yGAIgASgJSABSBWVycm9yQgoKCHJlc3BvbnNl');
@$core.Deprecated('Use tournamentDataDescriptor instead')
const TournamentData$json = const {
  '1': 'TournamentData',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'sync', '3': 2, '4': 1, '5': 9, '10': 'sync'},
    const {'1': 'status', '3': 3, '4': 1, '5': 11, '6': '.logicAPI.TournamentStatusData', '10': 'status'},
    const {'1': 'teams', '3': 4, '4': 1, '5': 11, '6': '.logicAPI.TournamentTeamData', '10': 'teams'},
    const {'1': 'structure', '3': 5, '4': 1, '5': 11, '6': '.logicAPI.TournamentStructureData', '10': 'structure'},
  ],
};

/// Descriptor for `TournamentData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentDataDescriptor = $convert.base64Decode('Cg5Ub3VybmFtZW50RGF0YRIQCgNrZXkYASABKAlSA2tleRISCgRzeW5jGAIgASgJUgRzeW5jEjYKBnN0YXR1cxgDIAEoCzIeLmxvZ2ljQVBJLlRvdXJuYW1lbnRTdGF0dXNEYXRhUgZzdGF0dXMSMgoFdGVhbXMYBCABKAsyHC5sb2dpY0FQSS5Ub3VybmFtZW50VGVhbURhdGFSBXRlYW1zEj8KCXN0cnVjdHVyZRgFIAEoCzIhLmxvZ2ljQVBJLlRvdXJuYW1lbnRTdHJ1Y3R1cmVEYXRhUglzdHJ1Y3R1cmU=');
@$core.Deprecated('Use serverEventDescriptor instead')
const ServerEvent$json = const {
  '1': 'ServerEvent',
  '2': const [
    const {'1': 'tournaments', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentDetailsList', '9': 0, '10': 'tournaments'},
    const {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'event'},
  ],
};

/// Descriptor for `ServerEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverEventDescriptor = $convert.base64Decode('CgtTZXJ2ZXJFdmVudBJDCgt0b3VybmFtZW50cxgBIAEoCzIfLmxvZ2ljQVBJLlRvdXJuYW1lbnREZXRhaWxzTGlzdEgAUgt0b3VybmFtZW50cxIWCgVlcnJvchgCIAEoCUgAUgVlcnJvckIHCgVldmVudA==');
@$core.Deprecated('Use tournamentEventDescriptor instead')
const TournamentEvent$json = const {
  '1': 'TournamentEvent',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'sync', '3': 2, '4': 1, '5': 9, '10': 'sync'},
    const {'1': 'syncOld', '3': 3, '4': 1, '5': 9, '10': 'syncOld'},
    const {'1': 'status', '3': 4, '4': 1, '5': 11, '6': '.logicAPI.TournamentStatusData', '9': 0, '10': 'status'},
    const {'1': 'teams', '3': 5, '4': 1, '5': 11, '6': '.logicAPI.TournamentTeamData', '9': 0, '10': 'teams'},
    const {'1': 'structure', '3': 6, '4': 1, '5': 11, '6': '.logicAPI.TournamentStructureData', '9': 0, '10': 'structure'},
    const {'1': 'error', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'error'},
  ],
  '8': const [
    const {'1': 'event'},
  ],
};

/// Descriptor for `TournamentEvent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentEventDescriptor = $convert.base64Decode('Cg9Ub3VybmFtZW50RXZlbnQSEAoDa2V5GAEgASgJUgNrZXkSEgoEc3luYxgCIAEoCVIEc3luYxIYCgdzeW5jT2xkGAMgASgJUgdzeW5jT2xkEjgKBnN0YXR1cxgEIAEoCzIeLmxvZ2ljQVBJLlRvdXJuYW1lbnRTdGF0dXNEYXRhSABSBnN0YXR1cxI0CgV0ZWFtcxgFIAEoCzIcLmxvZ2ljQVBJLlRvdXJuYW1lbnRUZWFtRGF0YUgAUgV0ZWFtcxJBCglzdHJ1Y3R1cmUYBiABKAsyIS5sb2dpY0FQSS5Ub3VybmFtZW50U3RydWN0dXJlRGF0YUgAUglzdHJ1Y3R1cmUSFgoFZXJyb3IYByABKAlIAFIFZXJyb3JCBwoFZXZlbnQ=');
@$core.Deprecated('Use teamAddDescriptor instead')
const TeamAdd$json = const {
  '1': 'TeamAdd',
  '2': const [
    const {'1': 'access', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '10': 'access'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TeamAdd`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamAddDescriptor = $convert.base64Decode('CgdUZWFtQWRkEjIKBmFjY2VzcxgBIAEoCzIaLmxvZ2ljQVBJLlRvdXJuYW1lbnRBY2Nlc3NSBmFjY2VzcxISCgRuYW1lGAIgASgJUgRuYW1l');
@$core.Deprecated('Use teamEditDescriptor instead')
const TeamEdit$json = const {
  '1': 'TeamEdit',
  '2': const [
    const {'1': 'access', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '10': 'access'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TeamEdit`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamEditDescriptor = $convert.base64Decode('CghUZWFtRWRpdBIyCgZhY2Nlc3MYASABKAsyGi5sb2dpY0FQSS5Ub3VybmFtZW50QWNjZXNzUgZhY2Nlc3MSDgoCaWQYAiABKAVSAmlkEhIKBG5hbWUYAyABKAlSBG5hbWU=');
@$core.Deprecated('Use teamRemoveDescriptor instead')
const TeamRemove$json = const {
  '1': 'TeamRemove',
  '2': const [
    const {'1': 'access', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '10': 'access'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `TeamRemove`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamRemoveDescriptor = $convert.base64Decode('CgpUZWFtUmVtb3ZlEjIKBmFjY2VzcxgBIAEoCzIaLmxvZ2ljQVBJLlRvdXJuYW1lbnRBY2Nlc3NSBmFjY2VzcxIOCgJpZBgCIAEoBVICaWQ=');
@$core.Deprecated('Use setModeDescriptor instead')
const SetMode$json = const {
  '1': 'SetMode',
  '2': const [
    const {'1': 'access', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '10': 'access'},
    const {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `SetMode`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setModeDescriptor = $convert.base64Decode('CgdTZXRNb2RlEjIKBmFjY2VzcxgBIAEoCzIaLmxvZ2ljQVBJLlRvdXJuYW1lbnRBY2Nlc3NSBmFjY2VzcxIOCgJpZBgCIAEoBVICaWQ=');
@$core.Deprecated('Use setResultDescriptor instead')
const SetResult$json = const {
  '1': 'SetResult',
  '2': const [
    const {'1': 'access', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '10': 'access'},
    const {'1': 'game', '3': 2, '4': 1, '5': 11, '6': '.logicAPI.GameData', '10': 'game'},
  ],
};

/// Descriptor for `SetResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setResultDescriptor = $convert.base64Decode('CglTZXRSZXN1bHQSMgoGYWNjZXNzGAEgASgLMhoubG9naWNBUEkuVG91cm5hbWVudEFjY2Vzc1IGYWNjZXNzEiYKBGdhbWUYAiABKAsyEi5sb2dpY0FQSS5HYW1lRGF0YVIEZ2FtZQ==');
@$core.Deprecated('Use gameDataDescriptor instead')
const GameData$json = const {
  '1': 'GameData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'score_a', '3': 2, '4': 1, '5': 5, '10': 'scoreA'},
    const {'1': 'score_b', '3': 3, '4': 1, '5': 5, '10': 'scoreB'},
  ],
};

/// Descriptor for `GameData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List gameDataDescriptor = $convert.base64Decode('CghHYW1lRGF0YRIOCgJpZBgBIAEoBVICaWQSFwoHc2NvcmVfYRgCIAEoBVIGc2NvcmVBEhcKB3Njb3JlX2IYAyABKAVSBnNjb3JlQg==');
@$core.Deprecated('Use tournamentStatusDataDescriptor instead')
const TournamentStatusData$json = const {
  '1': 'TournamentStatusData',
  '2': const [
    const {'1': 'started', '3': 1, '4': 1, '5': 8, '10': 'started'},
    const {'1': 'mode', '3': 2, '4': 1, '5': 5, '10': 'mode'},
    const {'1': 'winner', '3': 3, '4': 1, '5': 5, '10': 'winner'},
  ],
};

/// Descriptor for `TournamentStatusData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentStatusDataDescriptor = $convert.base64Decode('ChRUb3VybmFtZW50U3RhdHVzRGF0YRIYCgdzdGFydGVkGAEgASgIUgdzdGFydGVkEhIKBG1vZGUYAiABKAVSBG1vZGUSFgoGd2lubmVyGAMgASgFUgZ3aW5uZXI=');
@$core.Deprecated('Use tournamentTeamDataDescriptor instead')
const TournamentTeamData$json = const {
  '1': 'TournamentTeamData',
  '2': const [
    const {'1': 'teams', '3': 1, '4': 3, '5': 11, '6': '.logicAPI.TeamData', '10': 'teams'},
  ],
};

/// Descriptor for `TournamentTeamData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentTeamDataDescriptor = $convert.base64Decode('ChJUb3VybmFtZW50VGVhbURhdGESKAoFdGVhbXMYASADKAsyEi5sb2dpY0FQSS5UZWFtRGF0YVIFdGVhbXM=');
@$core.Deprecated('Use teamDataDescriptor instead')
const TeamData$json = const {
  '1': 'TeamData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `TeamData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List teamDataDescriptor = $convert.base64Decode('CghUZWFtRGF0YRIOCgJpZBgBIAEoBVICaWQSEgoEbmFtZRgCIAEoCVIEbmFtZQ==');
@$core.Deprecated('Use tournamentStructureDataDescriptor instead')
const TournamentStructureData$json = const {
  '1': 'TournamentStructureData',
  '2': const [
    const {'1': 'structures', '3': 1, '4': 3, '5': 11, '6': '.logicAPI.StructureData', '10': 'structures'},
  ],
};

/// Descriptor for `TournamentStructureData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tournamentStructureDataDescriptor = $convert.base64Decode('ChdUb3VybmFtZW50U3RydWN0dXJlRGF0YRI3CgpzdHJ1Y3R1cmVzGAEgAygLMhcubG9naWNBUEkuU3RydWN0dXJlRGF0YVIKc3RydWN0dXJlcw==');
@$core.Deprecated('Use structureDataDescriptor instead')
const StructureData$json = const {
  '1': 'StructureData',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'type', '3': 2, '4': 1, '5': 9, '10': 'type'},
    const {'1': 'label', '3': 3, '4': 1, '5': 9, '10': 'label'},
    const {'1': 'visible', '3': 4, '4': 1, '5': 8, '10': 'visible'},
    const {'1': 'state', '3': 5, '4': 1, '5': 5, '10': 'state'},
    const {'1': 'stats', '3': 6, '4': 3, '5': 11, '6': '.logicAPI.Stats', '10': 'stats'},
    const {'1': 'data', '3': 7, '4': 1, '5': 9, '10': 'data'},
    const {'1': 'modules', '3': 8, '4': 3, '5': 5, '10': 'modules'},
    const {'1': 'games', '3': 9, '4': 3, '5': 5, '10': 'games'},
    const {'1': 'down', '3': 10, '4': 3, '5': 5, '10': 'down'},
    const {'1': 'up', '3': 11, '4': 3, '5': 5, '10': 'up'},
  ],
};

/// Descriptor for `StructureData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List structureDataDescriptor = $convert.base64Decode('Cg1TdHJ1Y3R1cmVEYXRhEg4KAmlkGAEgASgFUgJpZBISCgR0eXBlGAIgASgJUgR0eXBlEhQKBWxhYmVsGAMgASgJUgVsYWJlbBIYCgd2aXNpYmxlGAQgASgIUgd2aXNpYmxlEhQKBXN0YXRlGAUgASgFUgVzdGF0ZRIlCgVzdGF0cxgGIAMoCzIPLmxvZ2ljQVBJLlN0YXRzUgVzdGF0cxISCgRkYXRhGAcgASgJUgRkYXRhEhgKB21vZHVsZXMYCCADKAVSB21vZHVsZXMSFAoFZ2FtZXMYCSADKAVSBWdhbWVzEhIKBGRvd24YCiADKAVSBGRvd24SDgoCdXAYCyADKAVSAnVw');
@$core.Deprecated('Use statsDescriptor instead')
const Stats$json = const {
  '1': 'Stats',
  '2': const [
    const {'1': 'team', '3': 1, '4': 1, '5': 5, '10': 'team'},
    const {'1': 'points', '3': 2, '4': 1, '5': 5, '10': 'points'},
    const {'1': 'wins', '3': 3, '4': 1, '5': 5, '10': 'wins'},
    const {'1': 'loses', '3': 4, '4': 1, '5': 5, '10': 'loses'},
    const {'1': 'draws', '3': 5, '4': 1, '5': 5, '10': 'draws'},
    const {'1': 'scored', '3': 6, '4': 1, '5': 5, '10': 'scored'},
    const {'1': 'conceded', '3': 7, '4': 1, '5': 5, '10': 'conceded'},
  ],
};

/// Descriptor for `Stats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statsDescriptor = $convert.base64Decode('CgVTdGF0cxISCgR0ZWFtGAEgASgFUgR0ZWFtEhYKBnBvaW50cxgCIAEoBVIGcG9pbnRzEhIKBHdpbnMYAyABKAVSBHdpbnMSFAoFbG9zZXMYBCABKAVSBWxvc2VzEhQKBWRyYXdzGAUgASgFUgVkcmF3cxIWCgZzY29yZWQYBiABKAVSBnNjb3JlZBIaCghjb25jZWRlZBgHIAEoBVIIY29uY2VkZWQ=');
@$core.Deprecated('Use permissionDescriptor instead')
const Permission$json = const {
  '1': 'Permission',
  '2': const [
    const {'1': 'permission', '3': 1, '4': 1, '5': 14, '6': '.logicAPI.PERMISSION', '10': 'permission'},
  ],
};

/// Descriptor for `Permission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionDescriptor = $convert.base64Decode('CgpQZXJtaXNzaW9uEjQKCnBlcm1pc3Npb24YASABKA4yFC5sb2dpY0FQSS5QRVJNSVNTSU9OUgpwZXJtaXNzaW9u');
@$core.Deprecated('Use permissionQueryDescriptor instead')
const PermissionQuery$json = const {
  '1': 'PermissionQuery',
  '2': const [
    const {'1': 'access', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '10': 'access'},
    const {'1': 'permissionKey', '3': 2, '4': 1, '5': 9, '10': 'permissionKey'},
  ],
};

/// Descriptor for `PermissionQuery`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionQueryDescriptor = $convert.base64Decode('Cg9QZXJtaXNzaW9uUXVlcnkSMgoGYWNjZXNzGAEgASgLMhoubG9naWNBUEkuVG91cm5hbWVudEFjY2Vzc1IGYWNjZXNzEiQKDXBlcm1pc3Npb25LZXkYAiABKAlSDXBlcm1pc3Npb25LZXk=');
@$core.Deprecated('Use permissionKeysDescriptor instead')
const PermissionKeys$json = const {
  '1': 'PermissionKeys',
  '2': const [
    const {'1': 'permissionKeys', '3': 1, '4': 3, '5': 9, '10': 'permissionKeys'},
  ],
};

/// Descriptor for `PermissionKeys`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionKeysDescriptor = $convert.base64Decode('Cg5QZXJtaXNzaW9uS2V5cxImCg5wZXJtaXNzaW9uS2V5cxgBIAMoCVIOcGVybWlzc2lvbktleXM=');
@$core.Deprecated('Use keyPermissionPairDescriptor instead')
const KeyPermissionPair$json = const {
  '1': 'KeyPermissionPair',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    const {'1': 'permission', '3': 2, '4': 1, '5': 14, '6': '.logicAPI.PERMISSION', '10': 'permission'},
  ],
};

/// Descriptor for `KeyPermissionPair`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyPermissionPairDescriptor = $convert.base64Decode('ChFLZXlQZXJtaXNzaW9uUGFpchIQCgNrZXkYASABKAlSA2tleRI0CgpwZXJtaXNzaW9uGAIgASgOMhQubG9naWNBUEkuUEVSTUlTU0lPTlIKcGVybWlzc2lvbg==');
@$core.Deprecated('Use keyPermissionPairsDescriptor instead')
const KeyPermissionPairs$json = const {
  '1': 'KeyPermissionPairs',
  '2': const [
    const {'1': 'pairs', '3': 1, '4': 3, '5': 11, '6': '.logicAPI.KeyPermissionPair', '10': 'pairs'},
  ],
};

/// Descriptor for `KeyPermissionPairs`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List keyPermissionPairsDescriptor = $convert.base64Decode('ChJLZXlQZXJtaXNzaW9uUGFpcnMSMQoFcGFpcnMYASADKAsyGy5sb2dpY0FQSS5LZXlQZXJtaXNzaW9uUGFpclIFcGFpcnM=');
@$core.Deprecated('Use setPermissionDescriptor instead')
const SetPermission$json = const {
  '1': 'SetPermission',
  '2': const [
    const {'1': 'access', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '10': 'access'},
    const {'1': 'permissionKey', '3': 2, '4': 1, '5': 9, '10': 'permissionKey'},
    const {'1': 'permission', '3': 3, '4': 1, '5': 14, '6': '.logicAPI.PERMISSION', '10': 'permission'},
  ],
};

/// Descriptor for `SetPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setPermissionDescriptor = $convert.base64Decode('Cg1TZXRQZXJtaXNzaW9uEjIKBmFjY2VzcxgBIAEoCzIaLmxvZ2ljQVBJLlRvdXJuYW1lbnRBY2Nlc3NSBmFjY2VzcxIkCg1wZXJtaXNzaW9uS2V5GAIgASgJUg1wZXJtaXNzaW9uS2V5EjQKCnBlcm1pc3Npb24YAyABKA4yFC5sb2dpY0FQSS5QRVJNSVNTSU9OUgpwZXJtaXNzaW9u');
@$core.Deprecated('Use removePermissionKeyDescriptor instead')
const RemovePermissionKey$json = const {
  '1': 'RemovePermissionKey',
  '2': const [
    const {'1': 'access', '3': 1, '4': 1, '5': 11, '6': '.logicAPI.TournamentAccess', '10': 'access'},
    const {'1': 'permissionKey', '3': 2, '4': 1, '5': 9, '10': 'permissionKey'},
  ],
};

/// Descriptor for `RemovePermissionKey`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removePermissionKeyDescriptor = $convert.base64Decode('ChNSZW1vdmVQZXJtaXNzaW9uS2V5EjIKBmFjY2VzcxgBIAEoCzIaLmxvZ2ljQVBJLlRvdXJuYW1lbnRBY2Nlc3NSBmFjY2VzcxIkCg1wZXJtaXNzaW9uS2V5GAIgASgJUg1wZXJtaXNzaW9uS2V5');
