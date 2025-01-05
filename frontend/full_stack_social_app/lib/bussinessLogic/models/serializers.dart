import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor([])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      // BuilderFactory for BuiltList<double>
      ..addBuilderFactory(const FullType(BuiltList, [FullType(double)]),
          () => ListBuilder<double>())
      // BuilderFactory for BuiltList<BuiltList<double>>
      ..addBuilderFactory(
          const FullType(BuiltList, [
            FullType(BuiltList, [FullType(double)])
          ]),
          () => ListBuilder<ListBuilder<double>>())
      // BuilderFactory for BuiltList<BuiltList<BuiltList<double>>>
      ..addBuilderFactory(
          const FullType(BuiltList, [
            FullType(BuiltList, [
              FullType(BuiltList, [FullType(double)])
            ])
          ]),
          () => ListBuilder<ListBuilder<ListBuilder<double>>>()))
    .build();
