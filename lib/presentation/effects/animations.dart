import 'package:animate_do/animate_do.dart';
import 'package:da3wa/app/my_res.dart';

AnimateType randomAnimaitonFixed() {
  var v = List.from(AnimateType.values);
  v.removeLast();
  v.removeLast();

  return (v..shuffle()).first;
}

AnimateType randomAnimaitonFixedList() {
  var v = List.from(AnimateType.values);
  v.removeRange(3, v.length);
  return (v..shuffle()).first;
}

bool repeated = false;
var isInSameScreen = false.obs;

//double zoom_from=30;
extension animW on Widget {
  animate(AnimateType typeParm,
      {bool animate = true,
      Duration? delay,
      Duration? duration,
      bool repeated = false,
      bool,
      Function(AnimationController)? controller,
      double from = 100}) {
    var typ =
        typeParm == AnimateType.random ? randomAnimaitonFixed() : typeParm;

  //  print('🙄 animationtype${typ}');


    return typeParm == AnimateType.none || isInSameScreen.value
        ? this

        : typ == AnimateType.elasticIn
            ? ElasticIn(
                delay: delay ?? AppConstants.animation_delay,
                duration: duration ?? AppConstants.animation_duration,
                animate: animate,
                controller: controller,
                child: this)
            : typ == AnimateType.elasticInDown
                ? ElasticInDown(
                    delay: delay ?? AppConstants.animation_delay,
                    duration: duration ?? AppConstants.animation_duration,
                    animate: animate,
                    controller: controller,
                    child: this)
                : typ == AnimateType.elasticInLeft
                    ? ElasticInLeft(
                        delay: delay ?? AppConstants.animation_delay,
                        duration: duration ?? AppConstants.animation_duration,
                        animate: animate,
                        controller: controller,
                        child: this)
                    : typ == AnimateType.elasticInRight
                        ? ElasticInRight(
                            delay: delay ?? AppConstants.animation_delay,
                            duration:
                                duration ?? AppConstants.animation_duration,
                            animate: animate,
                            controller: controller,
                            child: this)
                        : typ == AnimateType.slideInDown
                            ? SlideInDown(
                                delay: delay ?? AppConstants.animation_delay,
                                duration: duration ??
                                    AppConstants.animation_duration,
                                animate: animate,
                                controller: controller,
                                child: this)
                            : typ == AnimateType.slideInDown
                                ? SlideInDown(
                                    delay:
                                        delay ?? AppConstants.animation_delay,
                                    duration: duration ??
                                        AppConstants.animation_duration,
                                    animate: animate,
                                    controller: controller,
                                    child: this)
                                : typ == AnimateType.slideInUp
                                    ? SlideInUp(
                                        delay: delay ??
                                            AppConstants.animation_delay,
                                        duration: duration ??
                                            AppConstants.animation_duration,
                                        animate: animate,
                                        controller: controller,
                                        child: this)
                                    : typ == AnimateType.slideInLeft
                                        ? SlideInLeft(
                                            delay: delay ??
                                                AppConstants.animation_delay,
                                            duration: duration ??
                                                AppConstants
                                                    .animation_duration,
                                            animate: animate,
                                            controller: controller,
                                            child: this)
                                        : typ == AnimateType.slideInRight
                                            ? SlideInRight(
                                                delay: delay ??
                                                    AppConstants
                                                        .animation_delay,
                                                duration: duration ??
                                                    AppConstants
                                                        .animation_duration,
                                                animate: animate,
                                                controller: controller,
                                                child: this)
                                            : typ == AnimateType.flipInX
                                                ? FlipInX(
                                                    delay: delay ??
                                                        AppConstants
                                                            .animation_delay,
                                                    duration: duration ??
                                                        AppConstants
                                                            .animation_duration,
                                                    animate: animate,
                                                    controller: controller,
                                                    child: this)
                                                : typ == AnimateType.flipInY
                                                    ? FlipInY(
                                                        delay: delay ??
                                                            AppConstants
                                                                .animation_delay,
                                                        duration: duration ??
                                                            AppConstants
                                                                .animation_duration,
                                                        animate: animate,
                                                        controller: controller,
                                                        child: this)
                                                    : typ == AnimateType.zoomIn
                                                        ? ZoomIn(
                                                            delay: delay ??
                                                                AppConstants
                                                                    .animation_delay,
                                                            duration: duration ??
                                                                AppConstants
                                                                    .animation_duration,
                                                            animate: animate,
                                                            controller:
                                                                controller,
                                                            //
                                                            child: this)
                                                        : typ ==
                                                                AnimateType
                                                                    .flash
                                                            ? Flash(
                                                                delay: delay ??
                                                                    AppConstants
                                                                        .animation_delay,
                                                                duration: duration ??
                                                                    AppConstants.animation_duration,
                                                                infinite: repeated,
                                                                animate: animate,
                                                                controller: controller,
                                                                child: this)
                                                            : typ == AnimateType.jelloIn
                                                                ? JelloIn(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                : typ == AnimateType.pulse
                                                                    ? Pulse(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                    : typ == AnimateType.swing
                                                                        ? Swing(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                        : typ == AnimateType.spin
                                                                            ? Spin(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                            : typ == AnimateType.spinPerfect
                                                                                ? SpinPerfect(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                                : typ == AnimateType.dance
                                                                                    ? Dance(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                                    : typ == AnimateType.bounce
                                                                                        ? Bounce(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                                        : typ == AnimateType.roulette
                                                                                            ? Roulette(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                                            : typ == AnimateType.bounceInDown
                                                                                                ? BounceInDown(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                                                : typ == AnimateType.bounceInUp
                                                                                                    ? BounceInUp(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                                                    : typ == AnimateType.bounceInLeft
                                                                                                        ? BounceInLeft(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                                                        : typ == AnimateType.bounceInRight
                                                                                                            ? BounceInRight(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, controller: controller, child: this)
                                                                                                            : typ == AnimateType.fadeInDown
                                                                                                                ? FadeInDown(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, controller: controller, animate: animate, child: this)
                                                                                                                : typ == AnimateType.fadeInUp
                                                                                                                    ? FadeInUp(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, controller: controller, animate: animate, child: this)
                                                                                                                    : typ == AnimateType.fadeInLeft
                                                                                                                        ? FadeInLeft(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, animate: animate, child: this)
                                                                                                                        : typ == AnimateType.fadeInRight
                                                                                                                            ? FadeInRight(delay: delay ?? AppConstants.animation_delay, duration: duration ?? AppConstants.animation_duration, controller: controller, animate: animate, child: this)
                                                                                                                            : this;
  }
}
//err  cancel goggle map clousre
