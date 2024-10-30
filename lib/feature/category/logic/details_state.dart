part of 'details_cubit.dart';

@immutable
sealed class DetailsState {}

final class DetailsInitial extends DetailsState {}

final class ChangePageView extends DetailsState {}

final class ChangeGender extends DetailsState {}

class IncrementAge extends DetailsState {}

class DecrementAge extends DetailsState {}

class UpdateAge extends DetailsState {}

class IncrementHight extends DetailsState {}

class DecrementHight extends DetailsState {}

class UpdateHight extends DetailsState {}

class IncrementWeight extends DetailsState {}

class DecrementWeight extends DetailsState {}

class UpdateWeight extends DetailsState {}

class IncrementTargetWeight extends DetailsState {}

class DecrementTargetWeight extends DetailsState {}

class UpdateTargetWeight extends DetailsState {}

class IncrementDailyCalorie extends DetailsState {}

class DecrementDailyCalorie extends DetailsState {}

class UpdateDailyCalorie extends DetailsState {}

class IncrementDailyMove extends DetailsState {}

class DecrementDailyMove extends DetailsState {}

class UpdateDailyMove extends DetailsState {}

final class ChangeChoice1 extends DetailsState {}

final class ChangeChoice2 extends DetailsState {}
