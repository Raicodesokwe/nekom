///
//  Generated code. Do not modify.
//  source: api_supplier.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class Supplyment extends $pb.ProtobufEnum {
  static const Supplyment CENTRAL = Supplyment._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CENTRAL');
  static const Supplyment CROSS_DOCKING = Supplyment._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'CROSS_DOCKING');

  static const $core.List<Supplyment> values = <Supplyment> [
    CENTRAL,
    CROSS_DOCKING,
  ];

  static final $core.Map<$core.int, Supplyment> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Supplyment? valueOf($core.int value) => _byValue[value];

  const Supplyment._($core.int v, $core.String n) : super(v, n);
}

