import 'package:reserva_wbc/resources/reservation_db_provider.dart';
import '../models/reservation.dart';
import 'package:flutter/material.dart';

import '../resources/repository.dart';

class ReservationProvider with ChangeNotifier{

  final _repository = Repository();
  List<Reservation> _reservations = [];
  Reservation? _selectedReservation;

  Future<void> init() async {
    await reservationDbProvider.init();
  }

  List<Reservation> get reservations => _reservations;
  Reservation? get selectedReservation => _selectedReservation;

  Future<void> getAllReservations() async {
    _reservations = await _repository.getAllReservations();
    notifyListeners();
  }

  Future<void> reserveReservation(Reservation reservation) async {
    await _repository.reserveReservation(reservation.id!);
    notifyListeners();
  }

  Future<void> unreserveReservation(Reservation reservation) async{
    await _repository.unreserveReservation(reservation.id!);
    notifyListeners();
  }

  Future<void> insertReservation(Reservation reservation) async{
    await _repository.insertReservation(reservation);
    notifyListeners();
  }

  Future<void> deleteReservation(Reservation reservation) async{
    await _repository.deleteReservation(reservation.id!);
    notifyListeners();
  }

}

