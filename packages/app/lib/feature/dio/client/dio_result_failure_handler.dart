import 'package:demo_2026/feature/dio/client/dio_failure.build.dart';
import 'package:demo_2026/feature/failure/failure.build.dart';

abstract class DioFailureHandlerContract {
  Failure call(DioFailure dioFailure);
}

class DefaultDioFailureHandler extends DioFailureHandlerContract {
  @override
  Failure call(DioFailure dioFailure) {
    final response = switch (dioFailure) {
      DioFailureBadResponse(:final response) => response,
      DioFailureConnectTimeout(:final response) => response,
      DioFailureSendTimeout(:final response) => response,
      DioFailureReceiveTimeout(:final response) => response,
      DioFailureCancelDio(:final response) => response,
      DioFailureUnknownDio(:final response) => response,
      DioFailureBadCertificate(:final response) => response,
      DioFailureConnectionError(:final response) => response,
    };
    if (response != null) {
      try {
        /// Here should be more detailed handler with special data and domain objects converter (Chainable).
        /// Depends on backend error models.
        final responseData = response.data;
        if (responseData != null) {
          return Failure.userFriendly(errors: [responseData.toString()]);
        } else {
          return const Failure.general();
        }
      } on Object catch (_) {
        return const Failure.general();
      }
    }
    return const Failure.general();
  }
}
