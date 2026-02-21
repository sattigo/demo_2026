import 'package:demo_2026/feature/chain/chainable.dart';
import 'package:demo_2026/feature/chain/linkable_mixin.dart';

abstract class ChainTransformer<IN, OUT> with Linkable<Chainable<dynamic>> {
  OUT? transform(IN inParam);
}
