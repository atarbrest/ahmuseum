import 'package:ahmuseum/domain/blocs/collection/collection_bloc.dart';
import 'package:ahmuseum/pages/collection/collection_page.dart';
import 'package:ahmuseum/pages/collection/collection_screen.dart';
import 'package:ahmuseum/test_keys.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockCollectionBloc extends MockBloc<CollectionEvent, CollectionState> implements CollectionBloc {}

class CollectionStateFake extends Fake implements CollectionState {}

class CollectionEventFake extends Fake implements CollectionEvent {}

void main() {
  group('CollectionScreen', () {
    late MockCollectionBloc mockCollectionBloc;
    late CollectionBloc collectionBloc;

    setUpAll(() {
      registerFallbackValue<CollectionState>(CollectionStateFake());
      registerFallbackValue<CollectionEvent>(CollectionEventFake());

      mockCollectionBloc = MockCollectionBloc();

      final di = GetIt.I;
      di.registerFactory<CollectionBloc>(() => mockCollectionBloc);

      collectionBloc = di<CollectionBloc>();
    });

    tearDown(() {
      collectionBloc.close();
    });

    testWidgets('Collection rendered loading indicator', (WidgetTester tester) async {
      when(() => collectionBloc.state).thenReturn(Loading());

      await tester.pumpWidget(
        BlocProvider.value(
          value: collectionBloc,
          child: MaterialApp(
            title: 'Museum',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const CollectionScreen(),
          ),
        ),
      );

      await tester.pump();

      // expect(find.text('Collection Page'), findsOneWidget);
      expect(find.byKey(TestKeys.collectionInitialLoadingKey), findsOneWidget);
    });

    testWidgets('Collection rendered refresh indicator on pull-up', (WidgetTester tester) async {
      when(() => collectionBloc.state).thenReturn(InitialCollectionState());

      await tester.pumpWidget(
        BlocProvider.value(
          value: collectionBloc,
          child: MaterialApp(
            title: 'Museum',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const CollectionPage(),
          ),
        ),
      );

      await tester.fling(find.byKey(TestKeys.collectionListKey), const Offset(0, 100), 800);
      await tester.pumpAndSettle();

      // expect(find.text('Collection Page'), findsOneWidget);
      expect(find.byKey(TestKeys.collectionRefreshIndicatorKey), findsOneWidget);
    });
  });
}
