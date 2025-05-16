import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/core/models/breeds.dart';
import 'package:parki_dog/core/shared_widgets/select_breeds_bottom_sheet/business_logic/multi_breed_selection_cubit/multi_breed_selection_state.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';

class MultiBreedSelectionCubit extends Cubit<MultiBreedSelectionState> {
  MultiBreedSelectionCubit()
      : super(MultiBreedSelectionState(
            breeds: [], filteredBreeds: [], selectedBreedIds: {})) {
    _initializeBreeds();
  }

  final TextEditingController searchController = TextEditingController();

  void _initializeBreeds() {
    emit(state.copyWith(breeds: breeds, filteredBreeds: breeds));
  }

  void searchBreeds(String query) {
    final filteredBreeds = state.breeds
        .where(
            (breed) => breed.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(state.copyWith(filteredBreeds: filteredBreeds, searchQuery: query));
  }

  void toggleBreedSelection(String breedId) {
    Set<String> updatedSelection = Set.from(state.selectedBreedIds);
    if (updatedSelection.contains(breedId)) {
      updatedSelection.remove(breedId);
    } else {
      updatedSelection.add(breedId);
    }
    emit(state.copyWith(selectedBreedIds: updatedSelection));
  }

  void clearAllSelections() {
    emit(state.copyWith(selectedBreedIds: {}));
  }

  List<Breed> getSelectedBreeds() {
    return state.breeds
        .where((breed) => state.selectedBreedIds.contains(breed.id))
        .toList();
  }
}
