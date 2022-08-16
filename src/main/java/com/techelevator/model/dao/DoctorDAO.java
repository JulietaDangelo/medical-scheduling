package com.techelevator.model.dao;

import com.techelevator.model.dto.Doctor;

import java.math.BigDecimal;
import java.util.List;

public interface DoctorDAO {

    List<Doctor> getAll();

    Doctor getDoctorById(int id);

    List<Doctor> getDoctorBySpecialty(String specialty);


    void update(int id, Doctor doctor);

    public void saveDoctorUser(int doctorId, String userName, String firstName, String lastName, String email, BigDecimal hourCost, String address, int phoneNumber, String medicalSpecialty);
}
