package com.techelevator.model.dao.jdbc;


import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dto.Doctor;
import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;


public class JDBCDoctor implements DoctorDAO {

    private final JdbcTemplate jdbcTemplate;
    @Autowired
    public JDBCDoctor(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);}



    @Override
    public List<Doctor> getAll() {
        List<Doctor> doctors = new ArrayList<>();

        String sql = "SELECT doctor_id,user_name, first_name, last_name, email, address, phone_number, medical_specialty, hour_cost " +
                "FROM doctor ;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            doctors.add(mapRowToDoctor(results));
        }

        return doctors;
    }


    @Override
    public Doctor getDoctorById(int id) {
        String query = "SELECT  doctor_id,user_name, first_name, last_name, email, address, phone_number, medical_specialty, hour_cost " +
                "FROM doctor\n" +
                "WHERE doctor_id = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(query, id);

        if(row.next())
        {
            return mapRowToDoctor(row);
        }

        return null;

    }

    @Override
    public List<Doctor> getDoctorBySpecialty(String specialty) {
        List<Doctor> doctors = new ArrayList<>();
        String query = "SELECT  doctor_id,user_name, first_name, last_name, email, address, phone_number, medical_specialty, hour_cost " +
                "FROM doctor\n" +
                "WHERE medical_specialty = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(query, specialty);

        while (row.next()) {
            doctors.add(mapRowToDoctor(row));
        }

        return doctors;
    }

    @Override
    public void update(int id, Doctor doctor) {
        String sql = "UPDATE doctor\n" +
                "SET email = ?\n" +
                "    , address = ?\n" +
                "    , phone_number = ?\n" +
                "    , medical_specialty = ?\n" +
                "    , hour_cost = ?\n" +
                "WHERE doctor_id = ?;";

        jdbcTemplate.update(sql, doctor.getEmail(), doctor.getAddress(), doctor.getPhoneNumber(), doctor.getMedicalSpecialty(), doctor.getHourCost(), id);

    }

    @Override
    public void saveDoctorUser(int doctorId, String userName, String firstName, String lastName, String email, BigDecimal hourCost, String address, int phoneNumber, String medicalSpecialty) {
        jdbcTemplate.update("INSERT INTO doctor(doctor_id, user_name, first_name, last_name, email, address, phone_number, medical_specialty, hour_cost) " +
                        "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)", doctorId, userName, firstName, lastName, email, hourCost, address, phoneNumber, medicalSpecialty);
    }

    private Doctor mapRowToDoctor(SqlRowSet row)
    {
        Doctor doctor = new Doctor();

        int id = row.getInt("doctor_id");
        String userName = row.getString("user_name");
        String firstName = row.getString("first_name");
        String lastName = row.getString("last_name");
        String email = row.getString("email");
        String address = row.getString("address");
        String phoneNumber = row.getString("phone_number");
        String medicalSpecialty = row.getString("medical_specialty");
        BigDecimal hourCost = row.getBigDecimal("hour_cost");

        doctor.setDoctorId(id);
        doctor.setUserName(userName);
        doctor.setFirstName(firstName);
        doctor.setLastName(lastName);
        doctor.setEmail(email);
        doctor.setAddress(address);
        doctor.setPhoneNumber(phoneNumber);
        doctor.setMedicalSpecialty(medicalSpecialty);
        doctor.setHourCost(hourCost);

        return doctor;
    }
}
