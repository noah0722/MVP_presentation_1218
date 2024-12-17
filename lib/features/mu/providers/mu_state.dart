class MuCreateState {
  final bool isLoading;
  final String? error;
  final String? profileImagePath;
  final String? bannerImagePath;
  final String? selectedTopicLevel1;
  final String? selectedTopicLevel2;
  final String? selectedOfficialType;

  MuCreateState({
    this.isLoading = false,
    this.error,
    this.profileImagePath,
    this.bannerImagePath,
    this.selectedTopicLevel1,
    this.selectedTopicLevel2,
    this.selectedOfficialType,
  });

  MuCreateState copyWith({
    bool? isLoading,
    String? error,
    String? profileImagePath,
    String? bannerImagePath,
    String? selectedTopicLevel1,
    String? selectedTopicLevel2,
    String? selectedOfficialType,
  }) {
    return MuCreateState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      bannerImagePath: bannerImagePath ?? this.bannerImagePath,
      selectedTopicLevel1: selectedTopicLevel1 ?? this.selectedTopicLevel1,
      selectedTopicLevel2: selectedTopicLevel2 ?? this.selectedTopicLevel2,
      selectedOfficialType: selectedOfficialType ?? this.selectedOfficialType,
    );
  }
}
