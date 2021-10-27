import 'package:ahmuseum/data/repositories/i_collection_repository.dart';
import 'package:ahmuseum/domain/blocs/collection/collection_bloc.dart';
import 'package:ahmuseum/domain/entities/art_object.dart';
import 'package:ahmuseum/domain/entities/collection.dart';
import 'package:ahmuseum/domain/entities/image.dart' as domain;
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CollectionBloc', () {
    late CollectionBloc collectionBloc;
    late MockCollectionRepository mockCollectionRepository;

    setUpAll(() {
      mockCollectionRepository = MockCollectionRepository();
      collectionBloc = CollectionBloc(mockCollectionRepository);
    });

    tearDown(() {
      collectionBloc.close();
    });

    blocTest<CollectionBloc, CollectionState>(
      'emits [Loading, CollectionLoaded] states for successful items loads',
      build: () => collectionBloc,
      act: (bloc) => bloc.add(GetCollection(limit: 1)),
      expect: () => [
        Loading(),
        CollectionLoaded(
          newItems: mockCollection.artObjects,
          fullCount: 20,
        ),
      ],
      wait: const Duration(seconds: 5),
    );
  });
}

const mockCollection = Collection(
  count: 20,
  artObjects: [
    ArtObject(
      id: 'en-BK-1983-15',
      objectNumber: 'BK-1983-15',
      title: 'Roemer with a poem to Constantijn Huygens',
      principalOrFirstMaker: 'anonymous',
      longTitle: 'Roemer with a poem to Constantijn Huygens, anonymous, 1619',
      webImage: domain.Image(
        url:
            'https://lh3.googleusercontent.com/iHNTtwRZU6MW_7mG6mJKsLD2oHwLLEg7osTsXJv5LrVwa24N-9K4ScGMGNtRQoc9WrVERVLk6fxbZyvanofH05xXPA=s0',
      ),
      headerImage: domain.Image(
        url:
            'https://lh3.googleusercontent.com/iHNTtwRZU6MW_7mG6mJKsLD2oHwLLEg7osTsXJv5LrVwa24N-9K4ScGMGNtRQoc9WrVERVLk6fxbZyvanofH05xXPA=s0',
      ),
    ),
    ArtObject(
      id: 'en-AK-MAK-187',
      objectNumber: 'AK-MAK-187',
      title: 'Shiva Nataraja',
      principalOrFirstMaker: 'anonymous',
      longTitle: 'Shiva Nataraja, anonymous, c. 1100 - c. 1200',
      webImage: domain.Image(
          url:
              'https://lh5.ggpht.com/vV5DJTpPEL5dOCFmytemK61JuTSX_9SQKI11U7uAhm4WB48zX6oyv8rXbBwYrSb7tPXUhERrROL8k2P9C5Q0NiOpCbs=s0'),
      headerImage: domain.Image(
          url:
              'https://lh3.ggpht.com/tRNfvo1d-nwt150COh5uNeUytvAm72zQmjlXp9viywkDPAzYIDJsEQV503MZG9R3QNEYsQ3uuJMYmMv6q3dxCbkIDfpo=s0'),
    ),
  ],
);

class MockCollectionRepository implements ICollectionRepository {
  @override
  Future<Collection> fetchCollection({
    required int page,
    required int itemsPerPage,
  }) async {
    final result = Future.delayed(
      const Duration(seconds: 1),
      () {
        return mockCollection;
      },
    );
    return result;
  }
}
