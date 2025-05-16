// Cubit state
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';

class RadioBreedSelectionState {
  final List<Breed> breeds;
  final List<Breed> filteredBreeds;
  final String? selectedBreedId;
  final String searchQuery;

  RadioBreedSelectionState({
    required this.breeds,
    required this.filteredBreeds,
    this.selectedBreedId,
    this.searchQuery = '',
  });

  RadioBreedSelectionState copyWith({
    List<Breed>? breeds,
    List<Breed>? filteredBreeds,
    String? selectedBreedId,
    String? searchQuery,
  }) {
    return RadioBreedSelectionState(
      breeds: breeds ?? this.breeds,
      filteredBreeds: filteredBreeds ?? this.filteredBreeds,
      selectedBreedId: selectedBreedId ?? this.selectedBreedId,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
