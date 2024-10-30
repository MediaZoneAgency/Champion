import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitial());
  static DetailsCubit get(context) => BlocProvider.of(context);

  int currentPageIndex = 0;
  int switchGender = 0;
  int numAge = 0;
  int numHight = 0;
  int numWeight = 0;
  int numTargetWeight = 0;
  int numDailyCalorie = 0;
  int numDailyMove = 0;
  String? selectedChoice1;
  String? selectedChoice2;

  void changeCurrentIndex(int index) {
    currentPageIndex = index;
    emit(ChangePageView());
  }

  void changeGender(int gender) {
    switchGender = gender;
    emit(ChangeGender());
  }
          //for age
  void incrementAge() {
    numAge = (numAge + 1).clamp(0, 120);
    emit(IncrementAge());
  }

  void decrementAge() {
    numAge = (numAge - 1).clamp(0, 120);
    emit(DecrementAge());
  }

  void updateAgeFromTextField(int newValue) {
    numAge = newValue.clamp(0, 120);
    emit(UpdateAge());
  }


              //for hight
void incrementHight() {
    numHight = (numHight + 1).clamp(0, 120);
    emit(IncrementHight());
  }

  void decrementHight() {
    numHight = (numHight - 1).clamp(0, 120);
    emit(DecrementHight());
  }

  void updateHightFromTextField(int newValue) {
    numHight = newValue.clamp(0, 120);
    emit(UpdateHight());
  }
    
                //for weight
    void incrementWeight() {
    numWeight = (numWeight + 1).clamp(0, 120);
    emit(IncrementWeight());
  }

  void decrementWeight() {
    numWeight = (numWeight - 1).clamp(0, 120);
    emit(DecrementWeight());
  }

  void updateWeightFromTextField(int newValue) {
    numWeight = newValue.clamp(0, 120);
    emit(UpdateWeight());
  }

        //Target Weight
  void incrementTargetWeight() {
    numTargetWeight = (numTargetWeight + 1).clamp(0, 120);
    emit(IncrementTargetWeight());
  }

  void decrementTargetWeight() {
    numTargetWeight  = (numTargetWeight - 1).clamp(0, 120);
    emit(DecrementTargetWeight());
  }

  void updateTargetWeightFromTextField(int newValue) {
    numTargetWeight  = newValue.clamp(0, 120);
    emit(UpdateTargetWeight());
  }


              //Daily calorie
    void incrementDailyCalorie() {
    numDailyCalorie = (numDailyCalorie + 1).clamp(0, 120);
    emit(IncrementDailyCalorie());
  }

  void decrementDailyCalorie() {
    numDailyCalorie = (numDailyCalorie - 1).clamp(0, 120);
    emit(DecrementDailyCalorie());
  }

  void updatetDailyCalorieFromTextField(int newValue) {
    numDailyCalorie = newValue.clamp(0, 120);
    emit(UpdateDailyCalorie());
  }

         //Daily Move
  void incrementDailyMove() {
    numDailyMove = (numDailyMove + 1).clamp(0, 120);
    emit(IncrementDailyMove());
  }

  void decrementDailyMove() {
    numDailyMove = (numDailyMove - 1).clamp(0, 120);
    emit(DecrementDailyMove());
  }

  void updatetDailyMoveFromTextField(int newValue) {
    numDailyMove = newValue.clamp(0, 120);
    emit(UpdateDailyMove());
  }

  void updateSelectedChoice1(String choice) {
    selectedChoice1 = choice;
    emit(ChangeChoice1());
  }

void updateSelectedChoice2(String choice) {
    selectedChoice2 = choice;
    emit(ChangeChoice2());
  }
}
