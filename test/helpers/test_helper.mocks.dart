// Mocks generated by Mockito 5.4.5 from annotations
// in delosi_matrix_rotation_app/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:delosi_matrix_rotation_app/domain/entities/matrix.dart' as _i2;
import 'package:delosi_matrix_rotation_app/domain/repositories/matrix_repository.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMatrix_0 extends _i1.SmartFake implements _i2.Matrix {
  _FakeMatrix_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [MatrixRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMatrixRepository extends _i1.Mock implements _i3.MatrixRepository {
  MockMatrixRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Matrix> rotateMatrix(_i2.Matrix? matrix) =>
      (super.noSuchMethod(
            Invocation.method(#rotateMatrix, [matrix]),
            returnValue: _i4.Future<_i2.Matrix>.value(
              _FakeMatrix_0(this, Invocation.method(#rotateMatrix, [matrix])),
            ),
          )
          as _i4.Future<_i2.Matrix>);
}
