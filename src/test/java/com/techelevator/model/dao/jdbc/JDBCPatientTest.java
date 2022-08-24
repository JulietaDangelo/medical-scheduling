package com.techelevator.model.dao.jdbc;

import com.techelevator.DAOIntegrationTest;
import com.techelevator.model.dao.PatientDAO;
import com.techelevator.model.dto.Appointment;
import com.techelevator.model.dto.Patient;
import org.junit.Before;
import org.junit.Test;

import java.util.Map;

import static org.junit.Assert.*;

public class JDBCPatientTest extends DAOIntegrationTest {

    private PatientDAO patientDAO;

    @Before
    public void setUp() {
        patientDAO = new JDBCPatient(getDataSource());
    }

    @Test
    public void getPatientById_should_returnAPatient() {
        // arrange
        int patientId = 1;
        String expected = "Magali";
        String actual = "";

        // act
        Patient patient = patientDAO.getPatientById(patientId);

        // assert
        actual = patient.getFirstName();

        String message = "The function should return correctly the Patient searched.";
        assertEquals(message, expected, actual);

    }



}