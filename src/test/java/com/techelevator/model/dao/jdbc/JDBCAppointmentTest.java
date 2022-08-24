package com.techelevator.model.dao.jdbc;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.model.dao.AppointmentDAO;
import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dao.PatientDAO;
import com.techelevator.model.dao.UserDAO;
import com.techelevator.model.dto.Appointment;
import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.Patient;
import com.techelevator.model.dto.Review;
import org.junit.Before;
import org.junit.Test;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.Map;

import static org.junit.Assert.*;

public class JDBCAppointmentTest extends DAOIntegrationTest {

    private AppointmentDAO appointmentDAO;
    private DoctorDAO doctorDAO;
    private PatientDAO patientDAO;
    private UserDAO userDAO;

    @Before
    public void setUp() {
        appointmentDAO = new JDBCAppointment(getDataSource());
    }

    @Test
    public void CreateNewAppointment_should_createAppointment() {
        // arrange
        LocalTime startingTime = LocalTime.parse("10:00");
        LocalTime endingTime = LocalTime.parse("17:00");
        String dayOfWeek = "Monday";
        int patientId = 1;
        int doctorId = 3;
        int expected = 1;

        // act
        appointmentDAO.createNewAppointment(startingTime, endingTime, dayOfWeek, patientId, doctorId);

        // assert
        Map<Appointment, Patient> appointments = appointmentDAO.getAppointmentByDoctorId(doctorId);
        int actual = appointments.size();
        String message = "Adding one appointment should result in having one appointment assign to that doctor.";
        assertEquals(message, expected, actual);

    }

    @Test
    public void getAppointmentsByDoctorId_should_returnMap_ofAppointmentsForDoctor_andPatientsInfo() {
        // arrange
        int doctorId = 2;
        String expected = "Magali";
        String actual = "";

        // act
        Map<Appointment, Patient> appointments = appointmentDAO.getAppointmentByDoctorId(doctorId);

        // assert
        for(Map.Entry<Appointment, Patient> app : appointments.entrySet()) {
            actual = app.getValue().getFirstName();
        }

        String message = "The function should return correctly the appointments made to a doctor";
        assertEquals(message, expected, actual);

    }

    @Test
    public void cancelAppointment_should_returnConfirmedAsFalse() {
        // arrange
//        int doctorId = 2;
//        String expected = "Magali";
//        String actual = "";
//
//        // act
//        Map<Appointment, Patient> appointments = appointmentDAO.getAppointmentByDoctorId(doctorId);
//
//        // assert
//        for(Map.Entry<Appointment, Patient> app : appointments.entrySet()) {
//            actual = app.getValue().getFirstName();
//        }
//
//        String message = "The function should return correctly the appointments made to a doctor";
//        assertEquals(message, expected, actual);

    }

}