import 'package:feature_landing_screen/src/domain/models/landing_slide.build.dart';

abstract final class LandingSlidesFallback {
  static const List<LandingSlide> slides = [
    LandingSlide(id: 'fallback_1', title: 'Управляйте финансами', subtitle: 'Всё под контролем в одном приложении'),
    LandingSlide(id: 'fallback_2', title: 'Быстрые переводы', subtitle: 'Отправляйте деньги мгновенно'),
    LandingSlide(id: 'fallback_3', title: 'Безопасность', subtitle: 'Ваши данные надёжно защищены'),
  ];
}
