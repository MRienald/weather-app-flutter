// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app_flutter/model/listUpdateEarthquakeInfo.dart';

bool typeEqual<S, T>() => S == T;

bool typeEqualn<S, T>() {
  return typeEqual<S, T>() || typeEqual<S?, T?>();
}

class Converter<T> implements JsonConverter<T, Object> {
  const Converter();

  @override
  T fromJson(Object? json) {
    json = json as Map<String, dynamic>;
    if (typeEqualn<T, ListUpdateEartquakeInfo>()) {
      return ListUpdateEartquakeInfo.fromJson(json) as T;
    } else if (typeEqualn<T, Gempa>()) {
      return Gempa.fromJson(json) as T;
    }

    throw UnimplementedError('`$T` fromJson factory unimplemented.');
  }

  @override
  Map<String, dynamic> toJson(T obj) {
    if (typeEqualn<T, ListUpdateEartquakeInfo>()) {
      return (obj as ListUpdateEartquakeInfo).toJson();
    } else if (typeEqualn<T, Gempa>()) {
      return (obj as Gempa).toJson();
    }
    throw UnimplementedError('`$T` toJson factory unimplemented.');
  }
}
