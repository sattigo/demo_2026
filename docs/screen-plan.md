# Plan: 5-Screen Navigation Flow

## Context

Current `feature_initial_screen` is a demo screen with API request and recipe display. Refactoring into full 5-screen flow: Splash → Landing → Auth → Home → (Fork). Recipe logic moves to `feature_home_screen`.

## Navigation Flow

```
/          SplashScreenRoute   →go→    /landing    (stack cleared, no back)
/landing   LandingScreenRoute  →push→  /auth       (can go back)
/auth      AuthScreenRoute     →go→    /home       (stack cleared, no back)
/home      HomeScreenRoute     →push→  /fork
/fork      ForkScreenRoute     (unchanged)
```

## Implementation Principles

- **Dumb widgets:** widgets only `build()` based on `state`. All logic (animations, timers, transitions) controlled via BLoC.
- **Animations:** `AnimationController` lives in `StatefulWidget` (TickerProvider needed), but started/stopped by state commands.
- **Stubs:** all screens with assumed backend (auth, landing) have full domain/data layer with fake implementation.
- **Incremental:** implementation step-by-step, each step = working build.

## Screens

### 1. Splash (`/`)
- **Location:** `packages/app/lib/feature/screens/splash_screen/`
- **Behavior:** Custom image (`assets/images/splash_logo.png`) with fade in → hold → fade out → navigate
- **BLoC:** State contains `double opacity`. BLoC manages phases via `Future.delayed` chain. Widget shows `Opacity(opacity: state.opacity, child: Image...)`.
- **Init:** `Future.delayed` (~2.5s) — stub for real service initialization.
- **BLoC events:** `started()`. State: `opacity: double, isAnimating: bool`. Action: `navigateToLanding()`
- **DI:** Not needed

### 2. Landing (`/landing`)
- **Location:** `packages/app/lib/feature/screens/landing_screen/`
- **Slide data:** Hardcoded 3 slides (placeholder illustration + title + text). Real assets added by user.
- **Behavior:** Carousel (PageView), auto-scroll every 3s, swipe, dot indicators, "Get Started" button
- **Auto-scroll in BLoC:** BLoC contains Timer logic via `Stream.periodic`. Timer starts on `started()`. On page change — reset timer (new event `pageChanged(int)`).
- **BLoC events:** `started()`, `pageChanged(int page)`, `getStartedTapped()`. State: `currentPage: int`. Action: `navigateToAuth()`
- **Widget:** `StatefulWidget` — needed for `PageController`. `_pageController.animateToPage(state.currentPage)` called in `BlocListener` on `currentPage` change.
- **DI:** Not needed (hardcoded data)

### 3. Auth (`/auth`)
- **Location:** `packages/feature_auth_screen/` (new package) + route/page in `app`
- **Type:** login only (email + password), no registration
- **Backend stub:** `AuthRepositoryImpl` — `Future.delayed(1s)` → `Result.success(null)`. Full clean architecture, just fake data layer.
- **BLoC events:** `emailChanged(String)`, `passwordChanged(String)`, `loginSubmitted()`. State: `email, password, isLoading, emailError?, passwordError?, failure?`. Action: `navigateToHome()`
- **Validation:** email contains `@` and `.`; password ≥ 6 chars — in BLoC, before use case call
- **DI:** `AuthRepositoryImpl`, `LoginUseCase` in base scope

### 4. Home (`/home`)
- **Location:** `packages/feature_home_screen/` (renamed from `feature_initial_screen`)
- **Changes:** only rename `InitialScreen*` → `HomeScreen*`, logic unchanged

### 5. Fork (`/fork`)
- **Unchanged**

## Package Structure

### New package `feature_auth_screen`
```
packages/feature_auth_screen/
  pubspec.yaml
  lib/
    feature_auth_screen.dart
    src/
      domain/
        models/auth_credentials.build.dart    (@freezed: email, password)
        repositories/repository_contract.dart
        use_cases/login_use_case.dart
      data/
        repositories/impl.dart                (fake: Future.delayed → Result.success(null))
      ui/
        bloc/bloc.build.dart + event/state/action.dart
        widgets/view.dart + widget.dart + coordinator.dart
```

### Route/page auth in app
```
packages/app/lib/feature/screens/auth_screen/
  page.dart
  route.dart
```

### Splash and Landing in app
```
packages/app/lib/feature/screens/
  splash_screen/
    bloc/bloc.build.dart + event/state/action.dart
    coordinator.dart
    view.dart
    widget.dart
    page.dart
    route.dart
  landing_screen/
    bloc/bloc.build.dart + event/state/action.dart
    coordinator.dart
    view.dart
    widget.dart
    page.dart
    route.dart
```

### FadePageTransition (new)
`packages/app/lib/feature/navigation/ui/transitions/fade_transition.dart`

## Changes to Existing Files

| File | Change |
|------|--------|
| `packages/feature_initial_screen/` | → `feature_home_screen/`, all `InitialScreen*` → `HomeScreen*` |
| `packages/app/pubspec.yaml` | `feature_initial_screen` → `feature_home_screen` + `feature_auth_screen` |
| Root `pubspec.yaml` | Same in `workspace` section |
| `packages/app/lib/feature/screens/initial_screen/` | → `home_screen/` |
| `dependency_injector.dart` | Update imports, add `AuthRepositoryImpl` + `LoginUseCase` |
| `main_router.dart` | All 5 routes, remove `InitialScreenRoute` |

## Implementation Order

Each step ends with a compilable app.

1. **Save plan** to `docs/screen-plan.md`
2. **Rename** `feature_initial_screen` → `feature_home_screen` + update DI/router — app works as before
3. **`feature_auth_screen`** — create package, add to DI, create route in app — verify compilation
4. **Landing screen** in app (BLoC with timer + StatefulWidget with PageController)
5. **Splash screen** in app (BLoC with opacity state + FadePageTransition)
6. **Router assembly** — all 5 routes, full flow Splash → Landing → Auth → Home → Fork
7. **Cleanup** — delete `feature_initial_screen`, `melos run analyze`

## E2E Verification

1. Run `flutter run` from `packages/app`
2. Splash: image appears smoothly, fades out → Landing
3. Landing: carousel swipes; auto-changes after 3s; button → Auth; back → returns to Landing
4. Auth: empty fields → validation errors; correct data → 1s delay → Home; no back button (stack cleared)
5. Home: "Fetch Recipes" button → loads recipes from API → shows list
6. Fork: transition from Home works
7. `melos run analyze` — 0 errors
