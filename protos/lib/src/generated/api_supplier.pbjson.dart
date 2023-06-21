///
//  Generated code. Do not modify.
//  source: api_supplier.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use supplymentDescriptor instead')
const Supplyment$json = const {
  '1': 'Supplyment',
  '2': const [
    const {'1': 'CENTRAL', '2': 0},
    const {'1': 'CROSS_DOCKING', '2': 1},
  ],
};

/// Descriptor for `Supplyment`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List supplymentDescriptor = $convert.base64Decode('CgpTdXBwbHltZW50EgsKB0NFTlRSQUwQABIRCg1DUk9TU19ET0NLSU5HEAE=');
@$core.Deprecated('Use supplierEmptyRequestDescriptor instead')
const SupplierEmptyRequest$json = const {
  '1': 'SupplierEmptyRequest',
};

/// Descriptor for `SupplierEmptyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierEmptyRequestDescriptor = $convert.base64Decode('ChRTdXBwbGllckVtcHR5UmVxdWVzdA==');
@$core.Deprecated('Use supplierListResponseDescriptor instead')
const SupplierListResponse$json = const {
  '1': 'SupplierListResponse',
  '2': const [
    const {'1': 'metaResponse', '3': 1, '4': 1, '5': 11, '6': '.SuppliersMetaResponse', '10': 'metaResponse'},
    const {'1': 'supplier', '3': 2, '4': 3, '5': 11, '6': '.Supplier', '10': 'supplier'},
  ],
};

/// Descriptor for `SupplierListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierListResponseDescriptor = $convert.base64Decode('ChRTdXBwbGllckxpc3RSZXNwb25zZRI6CgxtZXRhUmVzcG9uc2UYASABKAsyFi5TdXBwbGllcnNNZXRhUmVzcG9uc2VSDG1ldGFSZXNwb25zZRIlCghzdXBwbGllchgCIAMoCzIJLlN1cHBsaWVyUghzdXBwbGllcg==');
@$core.Deprecated('Use suppliersMetaResponseDescriptor instead')
const SuppliersMetaResponse$json = const {
  '1': 'SuppliersMetaResponse',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'errorMessage', '3': 2, '4': 1, '5': 9, '10': 'errorMessage'},
    const {'1': 'errorType', '3': 3, '4': 1, '5': 9, '10': 'errorType'},
  ],
};

/// Descriptor for `SuppliersMetaResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suppliersMetaResponseDescriptor = $convert.base64Decode('ChVTdXBwbGllcnNNZXRhUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIiCgxlcnJvck1lc3NhZ2UYAiABKAlSDGVycm9yTWVzc2FnZRIcCgllcnJvclR5cGUYAyABKAlSCWVycm9yVHlwZQ==');
@$core.Deprecated('Use addSupplierRequestDescriptor instead')
const AddSupplierRequest$json = const {
  '1': 'AddSupplierRequest',
  '2': const [
    const {'1': 'supplierId', '3': 1, '4': 1, '5': 9, '10': 'supplierId'},
    const {'1': 'name1', '3': 2, '4': 1, '5': 9, '10': 'name1'},
    const {'1': 'name2', '3': 3, '4': 1, '5': 9, '10': 'name2'},
    const {'1': 'email', '3': 4, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'internalSupplier', '3': 5, '4': 1, '5': 8, '10': 'internalSupplier'},
    const {'1': 'supplyment', '3': 6, '4': 1, '5': 14, '6': '.Supplyment', '10': 'supplyment'},
    const {'1': 'shippingTime', '3': 7, '4': 1, '5': 3, '10': 'shippingTime'},
    const {'1': 'address', '3': 8, '4': 1, '5': 11, '6': '.SupplierAddress', '10': 'address'},
  ],
};

/// Descriptor for `AddSupplierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addSupplierRequestDescriptor = $convert.base64Decode('ChJBZGRTdXBwbGllclJlcXVlc3QSHgoKc3VwcGxpZXJJZBgBIAEoCVIKc3VwcGxpZXJJZBIUCgVuYW1lMRgCIAEoCVIFbmFtZTESFAoFbmFtZTIYAyABKAlSBW5hbWUyEhQKBWVtYWlsGAQgASgJUgVlbWFpbBIqChBpbnRlcm5hbFN1cHBsaWVyGAUgASgIUhBpbnRlcm5hbFN1cHBsaWVyEisKCnN1cHBseW1lbnQYBiABKA4yCy5TdXBwbHltZW50UgpzdXBwbHltZW50EiIKDHNoaXBwaW5nVGltZRgHIAEoA1IMc2hpcHBpbmdUaW1lEioKB2FkZHJlc3MYCCABKAsyEC5TdXBwbGllckFkZHJlc3NSB2FkZHJlc3M=');
@$core.Deprecated('Use updateSupplierRequestDescriptor instead')
const UpdateSupplierRequest$json = const {
  '1': 'UpdateSupplierRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'supplierId', '3': 2, '4': 1, '5': 9, '10': 'supplierId'},
    const {'1': 'name1', '3': 3, '4': 1, '5': 9, '10': 'name1'},
    const {'1': 'name2', '3': 4, '4': 1, '5': 9, '10': 'name2'},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'internalSupplier', '3': 6, '4': 1, '5': 8, '10': 'internalSupplier'},
    const {'1': 'supplyment', '3': 7, '4': 1, '5': 14, '6': '.Supplyment', '10': 'supplyment'},
    const {'1': 'shippingTime', '3': 8, '4': 1, '5': 3, '10': 'shippingTime'},
    const {'1': 'address', '3': 9, '4': 1, '5': 11, '6': '.SupplierAddress', '10': 'address'},
  ],
};

/// Descriptor for `UpdateSupplierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSupplierRequestDescriptor = $convert.base64Decode('ChVVcGRhdGVTdXBwbGllclJlcXVlc3QSEgoEdXVpZBgBIAEoCVIEdXVpZBIeCgpzdXBwbGllcklkGAIgASgJUgpzdXBwbGllcklkEhQKBW5hbWUxGAMgASgJUgVuYW1lMRIUCgVuYW1lMhgEIAEoCVIFbmFtZTISFAoFZW1haWwYBSABKAlSBWVtYWlsEioKEGludGVybmFsU3VwcGxpZXIYBiABKAhSEGludGVybmFsU3VwcGxpZXISKwoKc3VwcGx5bWVudBgHIAEoDjILLlN1cHBseW1lbnRSCnN1cHBseW1lbnQSIgoMc2hpcHBpbmdUaW1lGAggASgDUgxzaGlwcGluZ1RpbWUSKgoHYWRkcmVzcxgJIAEoCzIQLlN1cHBsaWVyQWRkcmVzc1IHYWRkcmVzcw==');
@$core.Deprecated('Use supplierUuidRequestDescriptor instead')
const SupplierUuidRequest$json = const {
  '1': 'SupplierUuidRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `SupplierUuidRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierUuidRequestDescriptor = $convert.base64Decode('ChNTdXBwbGllclV1aWRSZXF1ZXN0EhIKBHV1aWQYASABKAlSBHV1aWQ=');
@$core.Deprecated('Use calculatePurchasePriceRequestDescriptor instead')
const CalculatePurchasePriceRequest$json = const {
  '1': 'CalculatePurchasePriceRequest',
  '2': const [
    const {'1': 'supplieruuid', '3': 1, '4': 1, '5': 9, '10': 'supplieruuid'},
    const {'1': 'itemuuid', '3': 2, '4': 1, '5': 9, '10': 'itemuuid'},
    const {'1': 'allsupplier', '3': 3, '4': 1, '5': 8, '10': 'allsupplier'},
  ],
};

/// Descriptor for `CalculatePurchasePriceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calculatePurchasePriceRequestDescriptor = $convert.base64Decode('Ch1DYWxjdWxhdGVQdXJjaGFzZVByaWNlUmVxdWVzdBIiCgxzdXBwbGllcnV1aWQYASABKAlSDHN1cHBsaWVydXVpZBIaCghpdGVtdXVpZBgCIAEoCVIIaXRlbXV1aWQSIAoLYWxsc3VwcGxpZXIYAyABKAhSC2FsbHN1cHBsaWVy');
@$core.Deprecated('Use supplierAddressDescriptor instead')
const SupplierAddress$json = const {
  '1': 'SupplierAddress',
  '2': const [
    const {'1': 'firstName', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    const {'1': 'lastName', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    const {'1': 'street', '3': 3, '4': 1, '5': 9, '10': 'street'},
    const {'1': 'houseNumber', '3': 4, '4': 1, '5': 9, '10': 'houseNumber'},
    const {'1': 'street2', '3': 5, '4': 1, '5': 9, '10': 'street2'},
    const {'1': 'zip', '3': 6, '4': 1, '5': 9, '10': 'zip'},
    const {'1': 'city', '3': 7, '4': 1, '5': 9, '10': 'city'},
    const {'1': 'countryISO3', '3': 9, '4': 1, '5': 9, '10': 'countryISO3'},
  ],
};

/// Descriptor for `SupplierAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierAddressDescriptor = $convert.base64Decode('Cg9TdXBwbGllckFkZHJlc3MSHAoJZmlyc3ROYW1lGAEgASgJUglmaXJzdE5hbWUSGgoIbGFzdE5hbWUYAiABKAlSCGxhc3ROYW1lEhYKBnN0cmVldBgDIAEoCVIGc3RyZWV0EiAKC2hvdXNlTnVtYmVyGAQgASgJUgtob3VzZU51bWJlchIYCgdzdHJlZXQyGAUgASgJUgdzdHJlZXQyEhAKA3ppcBgGIAEoCVIDemlwEhIKBGNpdHkYByABKAlSBGNpdHkSIAoLY291bnRyeUlTTzMYCSABKAlSC2NvdW50cnlJU08z');
@$core.Deprecated('Use supplierDescriptor instead')
const Supplier$json = const {
  '1': 'Supplier',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'supplierId', '3': 2, '4': 1, '5': 9, '10': 'supplierId'},
    const {'1': 'name1', '3': 3, '4': 1, '5': 9, '10': 'name1'},
    const {'1': 'name2', '3': 4, '4': 1, '5': 9, '10': 'name2'},
    const {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    const {'1': 'internalSupplier', '3': 6, '4': 1, '5': 8, '10': 'internalSupplier'},
    const {'1': 'supplyment', '3': 7, '4': 1, '5': 14, '6': '.Supplyment', '10': 'supplyment'},
    const {'1': 'shippingTime', '3': 8, '4': 1, '5': 3, '10': 'shippingTime'},
    const {'1': 'address', '3': 9, '4': 1, '5': 11, '6': '.SupplierAddress', '10': 'address'},
  ],
};

/// Descriptor for `Supplier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierDescriptor = $convert.base64Decode('CghTdXBwbGllchISCgR1dWlkGAEgASgJUgR1dWlkEh4KCnN1cHBsaWVySWQYAiABKAlSCnN1cHBsaWVySWQSFAoFbmFtZTEYAyABKAlSBW5hbWUxEhQKBW5hbWUyGAQgASgJUgVuYW1lMhIUCgVlbWFpbBgFIAEoCVIFZW1haWwSKgoQaW50ZXJuYWxTdXBwbGllchgGIAEoCFIQaW50ZXJuYWxTdXBwbGllchIrCgpzdXBwbHltZW50GAcgASgOMgsuU3VwcGx5bWVudFIKc3VwcGx5bWVudBIiCgxzaGlwcGluZ1RpbWUYCCABKANSDHNoaXBwaW5nVGltZRIqCgdhZGRyZXNzGAkgASgLMhAuU3VwcGxpZXJBZGRyZXNzUgdhZGRyZXNz');
@$core.Deprecated('Use supplierResponseDescriptor instead')
const SupplierResponse$json = const {
  '1': 'SupplierResponse',
  '2': const [
    const {'1': 'metaResponse', '3': 1, '4': 1, '5': 11, '6': '.SuppliersMetaResponse', '10': 'metaResponse'},
    const {'1': 'supplier', '3': 2, '4': 1, '5': 11, '6': '.Supplier', '10': 'supplier'},
  ],
};

/// Descriptor for `SupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierResponseDescriptor = $convert.base64Decode('ChBTdXBwbGllclJlc3BvbnNlEjoKDG1ldGFSZXNwb25zZRgBIAEoCzIWLlN1cHBsaWVyc01ldGFSZXNwb25zZVIMbWV0YVJlc3BvbnNlEiUKCHN1cHBsaWVyGAIgASgLMgkuU3VwcGxpZXJSCHN1cHBsaWVy');
@$core.Deprecated('Use calculatePurchasePriceResponseDescriptor instead')
const CalculatePurchasePriceResponse$json = const {
  '1': 'CalculatePurchasePriceResponse',
  '2': const [
    const {'1': 'metaResponse', '3': 1, '4': 1, '5': 11, '6': '.SuppliersMetaResponse', '10': 'metaResponse'},
    const {'1': 'itemsread', '3': 2, '4': 1, '5': 3, '10': 'itemsread'},
    const {'1': 'itemschanged', '3': 3, '4': 1, '5': 3, '10': 'itemschanged'},
    const {'1': 'errorLines', '3': 4, '4': 3, '5': 9, '10': 'errorLines'},
  ],
};

/// Descriptor for `CalculatePurchasePriceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calculatePurchasePriceResponseDescriptor = $convert.base64Decode('Ch5DYWxjdWxhdGVQdXJjaGFzZVByaWNlUmVzcG9uc2USOgoMbWV0YVJlc3BvbnNlGAEgASgLMhYuU3VwcGxpZXJzTWV0YVJlc3BvbnNlUgxtZXRhUmVzcG9uc2USHAoJaXRlbXNyZWFkGAIgASgDUglpdGVtc3JlYWQSIgoMaXRlbXNjaGFuZ2VkGAMgASgDUgxpdGVtc2NoYW5nZWQSHgoKZXJyb3JMaW5lcxgEIAMoCVIKZXJyb3JMaW5lcw==');
@$core.Deprecated('Use supplierMappingUuidRequestDescriptor instead')
const SupplierMappingUuidRequest$json = const {
  '1': 'SupplierMappingUuidRequest',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
  ],
};

/// Descriptor for `SupplierMappingUuidRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierMappingUuidRequestDescriptor = $convert.base64Decode('ChpTdXBwbGllck1hcHBpbmdVdWlkUmVxdWVzdBISCgR1dWlkGAEgASgJUgR1dWlk');
@$core.Deprecated('Use supplierMappingDescriptor instead')
const SupplierMapping$json = const {
  '1': 'SupplierMapping',
  '2': const [
    const {'1': 'uuid', '3': 1, '4': 1, '5': 9, '10': 'uuid'},
    const {'1': 'supplierUuid', '3': 2, '4': 1, '5': 9, '10': 'supplierUuid'},
    const {'1': 'value', '3': 3, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'variantUuid', '3': 4, '4': 1, '5': 9, '10': 'variantUuid'},
  ],
};

/// Descriptor for `SupplierMapping`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierMappingDescriptor = $convert.base64Decode('Cg9TdXBwbGllck1hcHBpbmcSEgoEdXVpZBgBIAEoCVIEdXVpZBIiCgxzdXBwbGllclV1aWQYAiABKAlSDHN1cHBsaWVyVXVpZBIUCgV2YWx1ZRgDIAEoCVIFdmFsdWUSIAoLdmFyaWFudFV1aWQYBCABKAlSC3ZhcmlhbnRVdWlk');
@$core.Deprecated('Use supplierMappingRequestDescriptor instead')
const SupplierMappingRequest$json = const {
  '1': 'SupplierMappingRequest',
  '2': const [
    const {'1': 'supplierUuid', '3': 1, '4': 1, '5': 9, '10': 'supplierUuid'},
    const {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
    const {'1': 'variantUuid', '3': 3, '4': 1, '5': 9, '10': 'variantUuid'},
  ],
};

/// Descriptor for `SupplierMappingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierMappingRequestDescriptor = $convert.base64Decode('ChZTdXBwbGllck1hcHBpbmdSZXF1ZXN0EiIKDHN1cHBsaWVyVXVpZBgBIAEoCVIMc3VwcGxpZXJVdWlkEhQKBXZhbHVlGAIgASgJUgV2YWx1ZRIgCgt2YXJpYW50VXVpZBgDIAEoCVILdmFyaWFudFV1aWQ=');
@$core.Deprecated('Use supplierMappingResponseDescriptor instead')
const SupplierMappingResponse$json = const {
  '1': 'SupplierMappingResponse',
  '2': const [
    const {'1': 'metaResponse', '3': 1, '4': 1, '5': 11, '6': '.SuppliersMetaResponse', '10': 'metaResponse'},
    const {'1': 'mapping', '3': 2, '4': 1, '5': 11, '6': '.SupplierMapping', '10': 'mapping'},
  ],
};

/// Descriptor for `SupplierMappingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierMappingResponseDescriptor = $convert.base64Decode('ChdTdXBwbGllck1hcHBpbmdSZXNwb25zZRI6CgxtZXRhUmVzcG9uc2UYASABKAsyFi5TdXBwbGllcnNNZXRhUmVzcG9uc2VSDG1ldGFSZXNwb25zZRIqCgdtYXBwaW5nGAIgASgLMhAuU3VwcGxpZXJNYXBwaW5nUgdtYXBwaW5n');
@$core.Deprecated('Use supplierMappingListResponseDescriptor instead')
const SupplierMappingListResponse$json = const {
  '1': 'SupplierMappingListResponse',
  '2': const [
    const {'1': 'metaResponse', '3': 1, '4': 1, '5': 11, '6': '.SuppliersMetaResponse', '10': 'metaResponse'},
    const {'1': 'mappings', '3': 2, '4': 3, '5': 11, '6': '.SupplierMapping', '10': 'mappings'},
  ],
};

/// Descriptor for `SupplierMappingListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierMappingListResponseDescriptor = $convert.base64Decode('ChtTdXBwbGllck1hcHBpbmdMaXN0UmVzcG9uc2USOgoMbWV0YVJlc3BvbnNlGAEgASgLMhYuU3VwcGxpZXJzTWV0YVJlc3BvbnNlUgxtZXRhUmVzcG9uc2USLAoIbWFwcGluZ3MYAiADKAsyEC5TdXBwbGllck1hcHBpbmdSCG1hcHBpbmdz');
