import 'package:demo_2026/feature/chain/chain_transformer.dart';

abstract class ChainValidator<T> extends ChainTransformer<T, T> {
  @override
  T transform(T inParam) {
    return validate(inParam);
  }

  T validate(T? inParam);
}
