import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoggerRiverpod extends ProviderObserver{
  @override
  void didUpdateProvider(
      ProviderBase provider,
      Object? previousValue,//of provider
      Object? newValue,
      ProviderContainer container,//what is used within provider scope
      ){
    print('$provider $previousValue $newValue $container');
  }
  @override
  void didAddProvider(
      ProviderBase<Object?> provider,
      Object? value,
      ProviderContainer container
      ) {}
  @override
  void didDisposeProvider(
      ProviderBase<Object?> provider,
      ProviderContainer container) {

    super.didDisposeProvider(provider, container);
  }
}