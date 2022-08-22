package com.techelevator.model.dao;

import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.Prescription;

import java.math.BigDecimal;
import java.time.LocalTime;
import java.util.Map;

public interface PrescriptionDAO {

    public void createNewPrescription(String prescriptionName, BigDecimal cost, int patientId, int doctorId);

    public Map<Prescription, Doctor> getPrescriptionByPatientId(int patientId);

}
