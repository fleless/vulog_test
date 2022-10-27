// Mocks generated by Mockito 5.3.2 from annotations
// in vulog_technical_test/test/presentation/unit_tests/single_product_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:vulog_technical_test/data/network/data_state.dart' as _i2;
import 'package:vulog_technical_test/domain/entities/product.dart' as _i5;
import 'package:vulog_technical_test/domain/usecases/get_single_product_usecase.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDataState_0<T> extends _i1.SmartFake implements _i2.DataState<T> {
  _FakeDataState_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetSingleProductUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetSingleProductUseCase extends _i1.Mock
    implements _i3.GetSingleProductUseCase {
  MockGetSingleProductUseCase() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.DataState<_i5.Product>> call({required String? params}) =>
      (super.noSuchMethod(
        Invocation.method(
          #call,
          [],
          {#params: params},
        ),
        returnValue: _i4.Future<_i2.DataState<_i5.Product>>.value(
            _FakeDataState_0<_i5.Product>(
          this,
          Invocation.method(
            #call,
            [],
            {#params: params},
          ),
        )),
      ) as _i4.Future<_i2.DataState<_i5.Product>>);
}
