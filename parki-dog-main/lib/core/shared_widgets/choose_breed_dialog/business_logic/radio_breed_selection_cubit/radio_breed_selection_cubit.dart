// Cubit
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/models/breeds.dart';
import 'package:parki_dog/core/shared_widgets/choose_breed_dialog/business_logic/radio_breed_selection_cubit/radio_breed_selection_state.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';
import 'package:flutter/material.dart';

class RadioBreedSelectionCubit extends Cubit<RadioBreedSelectionState> {
  RadioBreedSelectionCubit()
      : super(RadioBreedSelectionState(breeds: [], filteredBreeds: [])) {
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

  void selectBreed(String breedId) {
    emit(state.copyWith(selectedBreedId: breedId));
  }

  void clearSelection() {
    emit(state.copyWith(selectedBreedId: null));
  }

  Breed getBreedFromId(String id) {
    return state.breeds.firstWhere((breed) => breed.id == id);
  }
}
