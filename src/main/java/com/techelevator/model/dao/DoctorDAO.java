package com.techelevator.model.dao;

import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.SpecialtyFilter;

import java.math.BigDecimal;
import java.util.List;

public interface DoctorDAO {

    List<Doctor> getAll();

    Doctor getDoctorById(int id);

    List<Doctor> getDoctorBySpecialty(String specialty);

    void update(int id, String email, String address, String phoneNumber, String specialty, BigDecimal hourCost);

    public void saveDoctorUser(int doctorId, String firstName, String lastName, String email, BigDecimal hourCost, String address, String phoneNumber, String medicalSpecialty);

    public List<Doctor> getAll(SpecialtyFilter filter);

}
