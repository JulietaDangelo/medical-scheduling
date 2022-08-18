package com.techelevator.model.dao;

import com.techelevator.model.dto.Appointment;

import java.time.LocalTime;
import java.util.List;

public interface AppointmentDAO {

    void createNewAppointment(LocalTime startingTime, LocalTime endingTime, String dayOfWeek, int patientId, int doctorId);

    List<Appointment> getAppointmentByDoctorId(int doctorId);

    List<Appointment> getAppointmentByPatientId(int patientId);
}
