import 'dart:async';

import 'package:ahmuseum/data/repositories/details_repository.dart';
import 'package:ahmuseum/data/services/details_service.dart';
import 'package:ahmuseum/domain/blocs/base/base_bloc.dart';
import 'package:ahmuseum/domain/view_models/details_view_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends BaseBloc<DetailsEvent, DetailsState> {
  final DetailsRepository detailsRepository;

  DetailsViewModel viewModel = DetailsViewModel.initial();

  DetailsBloc(this.detailsRepository) : super(DetailsInitialState()) {
    on<FetchDetails>(_onFetchDetails);
  }

  FutureOr<void> _onFetchDetails(
      FetchDetails event, Emitter<DetailsState> emit) async {
    emit(Loading());

    await makeExecution<ArtObjectDetails>(
      function: () async {
        final artDetails = await detailsRepository.fetchArtDetails(
            objectNumber: event.objectNumber);
        return artDetails;
      },
      onSuccess: (artDetails) {
        viewModel = DetailsViewModel(
          title: artDetails.title,
          description: artDetails.description,
          webImage: artDetails.webImage,
          principalMaker: artDetails.principalMaker,
        );

        emit(DetailsFetched());
      },
      onError: () {
        emit(Error());
      },
    );
  }
}
