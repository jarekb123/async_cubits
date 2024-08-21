# infinit_flutter

## Architecture

This app is very simple, so I decided to not built any abstraction layer before the API client. So the cubits calls the API client directly.
In the real world scenario we can decide between various architecture patterns (eg. clean architecture, DDD) and some abstractions (if necessary). 

## Localization

No package for localization/i18n is used. But some can be easily adopted to this app.

## API used

https://www.openbrewerydb.org/documentation/

## State Management

The app mainly uses `flutter_bloc` for state management. 

For simple async call I've used my own flutter package `async_cubits` (https://github.com/jarekb123/async_cubits). This package is built on top of `flutter_bloc` package and provides set of cubits that simplifies state management of async operations. It's something similiar to React Query (in React obviously) or `FutureProvider` in `riverpod` package.

## UI/UX

As it's mentioned in the assessment description, UI/UX is not critical. UI part here is very very basic and uses basic widgets from Flutter's Material library.

## Dependency Injection

This app uses `get_it` and `injectable` (for code generation) for injecting dependencies that are not not scoped (or can be provided globally). For cubits I decided to keep scoping using `BlocProvider` so they are not injected by `get_it`.

## Networking

Package `dio` is used along with `retrofit` for making API calls. Retrofit is used to generate code for api calls and serialization of DTOs.
