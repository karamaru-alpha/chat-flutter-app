///
//  Generated code. Do not modify.
//  source: room.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use roomDescriptor instead')
const Room$json = const {
  '1': 'Room',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `Room`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List roomDescriptor = $convert.base64Decode('CgRSb29tEg4KAmlkGAEgASgJUgJpZBIUCgV0aXRsZRgCIAEoCVIFdGl0bGU=');
@$core.Deprecated('Use createRoomRequestDescriptor instead')
const CreateRoomRequest$json = const {
  '1': 'CreateRoomRequest',
  '2': const [
    const {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `CreateRoomRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomRequestDescriptor = $convert.base64Decode('ChFDcmVhdGVSb29tUmVxdWVzdBIUCgV0aXRsZRgBIAEoCVIFdGl0bGU=');
@$core.Deprecated('Use createRoomResponseDescriptor instead')
const CreateRoomResponse$json = const {
  '1': 'CreateRoomResponse',
  '2': const [
    const {'1': 'room', '3': 1, '4': 1, '5': 11, '6': '.chatserver.Room', '10': 'room'},
  ],
};

/// Descriptor for `CreateRoomResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createRoomResponseDescriptor = $convert.base64Decode('ChJDcmVhdGVSb29tUmVzcG9uc2USJAoEcm9vbRgBIAEoCzIQLmNoYXRzZXJ2ZXIuUm9vbVIEcm9vbQ==');
@$core.Deprecated('Use getRoomsRequestDescriptor instead')
const GetRoomsRequest$json = const {
  '1': 'GetRoomsRequest',
};

/// Descriptor for `GetRoomsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomsRequestDescriptor = $convert.base64Decode('Cg9HZXRSb29tc1JlcXVlc3Q=');
@$core.Deprecated('Use getRoomsResponseDescriptor instead')
const GetRoomsResponse$json = const {
  '1': 'GetRoomsResponse',
  '2': const [
    const {'1': 'rooms', '3': 1, '4': 3, '5': 11, '6': '.chatserver.Room', '10': 'rooms'},
  ],
};

/// Descriptor for `GetRoomsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRoomsResponseDescriptor = $convert.base64Decode('ChBHZXRSb29tc1Jlc3BvbnNlEiYKBXJvb21zGAEgAygLMhAuY2hhdHNlcnZlci5Sb29tUgVyb29tcw==');
