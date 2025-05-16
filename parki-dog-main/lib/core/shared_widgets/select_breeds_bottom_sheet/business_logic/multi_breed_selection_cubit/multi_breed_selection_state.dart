import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';

class MultiBreedSelectionState {
  final List<Breed> breeds;
  final List<Breed> filteredBreeds;
  final Set<String> selectedBreedIds;
  final String searchQuery;

  MultiBreedSelectionState({
    required this.breeds,
    required this.filteredBreeds,
    required this.selectedBreedIds,
    this.searchQuery = '',
  });

  MultiBreedSelectionState copyWith({
    List<Breed>? breeds,
    List<Breed>? filteredBreeds,
    Set<String>? selectedBreedIds,
    String? searchQuery,
  }) {
    return MultiBreedSelectionState(
      breeds: breeds ?? this.breeds,
      filteredBreeds: filteredBreeds ?? this.filteredBreeds,
      selectedBreedIds: selectedBreedIds ?? this.selectedBreedIds,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
