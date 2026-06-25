# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

A Flutter learning project (driver registration + orders, GetX) built to practice the **LaS-Vegas feature structure** and **GetX named navigation**. Correctness of the *architecture* matters as much as the app working — see the strict rules below.

## Commands

Always use `fvm` (the project is pinned via fvm; bare `flutter` may use the wrong SDK):

```bash
fvm flutter pub get
fvm dart analyze            # MUST be exit 0 / "No issues found" — explicit types everywhere, no `var`
fvm flutter run -d <id>     # real iOS device; `fvm flutter devices` to list
```

There is currently **no `test/` directory** (the default counter test was removed). If you add tests: `fvm flutter test [path]`.

After editing `lib/main.dart` or service setup, do a **full restart** (not hot reload) so `main()` re-runs.

## Architecture: LaS-Vegas (the core convention)

Every feature lives in `lib/pages/<feature>/` with exactly four folders. This separation is the whole point — do not collapse it.

| Folder | Contains | Hard rule |
|---|---|---|
| `state/` | a plain class of `Rx` fields only | no methods, no logic, no `Get.*` |
| `logic/` | a `GetxController` owning a `<Feature>State` | does work + mutates state; **never** navigates, **never** shows popups; returns `bool`/values |
| `suite/` | `<Feature>Binding` + `<Feature>Pages` | `Pages` is the **only** place `Get.*` navigation is allowed |
| `view/` | widgets | display only; reads results, calls `<Feature>Pages.*`, shows its own snackbars |

**The flow to preserve:** View tap → `controller.doWork()` (returns bool) → View inspects result → `<Feature>Pages.openNext()` → `Get.toNamed(...)`.

Two grep invariants the code must satisfy (treat as CI):
- `lib/pages/*/view/` contains **no** `Get.toNamed/offNamed/offAllNamed/offNamedUntil/until/offAndToNamed` (plain `Get.back()` is fine; navigation goes through `Pages`).
- `lib/pages/*/logic/` contains **no** `Get.snackbar/dialog/to/off/back` (comments excepted).

**No data-model classes.** Pass `Map<String, dynamic>` / `dynamic` between pages and read with explicit casts (`map['x'] as String`).

## Routing

- Route names are `String` constants in `lib/app/routes/app_routes.dart` (`Routes.*`) — never hardcode `'/login'`.
- The `GetPage` table is `lib/app/routes/app_pages.dart`; each page wires its `binding`. `main.dart` uses `GetMaterialApp` (required for GetX nav/bindings) with `initialRoute: AppPages.initial`.
- `app_routes.dart` declares constants for features not yet built (orders/profile/history/settings/notifications) — those are the planned next features.

## Wizard pattern (register feature) — easy to break

The 5-step register wizard shares **one** `RegisterLogic` across all steps:
- `RegisterBinding` (`Get.put`) is attached to **only the first step** (`registerPhone`) in `app_pages.dart`.
- Steps 2–5 have **no binding** and call `Get.find<RegisterLogic>()` to reuse the same instance. This is why typed data survives across screens. Adding a binding to later steps would create separate controllers and lose data.
- The wizard ends with `Get.offNamedUntil(Routes.home, (r) => false)` so it becomes unreachable.

## Auth (`lib/app/service/auth_service.dart`)

`AuthService` is a `GetxService` singleton (`Get.putAsync` in `main()`) wrapping `FirebaseAuth`; it returns plain values and never navigates.

- **Email/password = real Firebase.** The register wizard creates a real account via `createUserWithEmailAndPassword` (step 3 collects email+password), so registration and login are connected. Requires Email/Password enabled in the Firebase console.
- **Phone OTP = intentionally mocked.** `sendOtp`/`verifyOtp` are simulated (`verifyOtp` accepts the demo code `AuthService.demoSmsCode = '111123'`). Real iOS phone auth needs APNs (paid Apple account) + a `REVERSED_CLIENT_ID` URL scheme that this project's `GoogleService-Info.plist` lacks. Do not reintroduce real `verifyPhoneNumber` without that setup — it crashes on device.
- `driverProfile` (a `Map`) is stashed in `AuthService` at wizard end so `HomeLogic` can show the registered driver after the wizard controller is destroyed.

Firebase init uses native config files (`android/app/google-services.json`, `ios/Runner/GoogleService-Info.plist`); there is no generated `firebase_options.dart`.
