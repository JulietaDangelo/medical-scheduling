package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.AppointmentDAO;
import com.techelevator.model.dto.Appointment;
import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.Patient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class JDBCAppointment implements AppointmentDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCAppointment(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public void createNewAppointment(LocalTime startingTime, LocalTime endingTime, String dayOfWeek, int patientId, int doctorId) {
        jdbcTemplate.update("INSERT INTO appointment(starting_time, ending_time, day_of_week, patient_id, doctor_id) " +
                "VALUES (?, ?, ?, ?, ?)", startingTime, endingTime, dayOfWeek, patientId, doctorId);
    }

    @Override
    public Map<Appointment, Patient> getAppointmentByDoctorId(int doctorId) {
        Map<Appointment, Patient> appointmentsByDoctor = new HashMap<>();

        String query = "SELECT appointment_id, starting_time, ending_time, day_of_week, a.patient_id, doctor_id, p.first_name, p.last_name, p.email, p.age, p.gender\n" +
                "FROM appointment as a\n" +
                "INNER JOIN patient p ON p.patient_id = a.patient_id\n" +
                "WHERE doctor_id = ?";

        SqlRowSet row = jdbcTemplate.queryForRowSet(query, doctorId);

        while (row.next()) {
            Appointment appointment = new Appointment();
            Patient patient = new Patient();

            int id = row.getInt("appointment_id");
            LocalTime startingTime = row.getTime("starting_time").toLocalTime();
            LocalTime endingTime = row.getTime("ending_time").toLocalTime();
            String dayOfWeek = row.getString("day_of_week");
            int dId = row.getInt("doctor_id");
            int patientId = row.getInt("patient_id");
            appointment.setAppointmentId(id);
            appointment.setStartingTime(startingTime);
            appointment.setEndingTime(endingTime);
            appointment.setDayOfWeek(dayOfWeek);
            appointment.setDoctorId(dId);
            appointment.setPatientId(patientId);

            patient.setFirstName(row.getString("first_name"));
            patient.setLastName(row.getString("last_name"));
            patient.setAge(row.getInt("age"));
            patient.setGender(row.getString("gender"));
            patient.setEmail(row.getString("email"));

            appointmentsByDoctor.put(appointment, patient);
        }

        return appointmentsByDoctor;
    }

    @Override
    public Map<Appointment, Doctor> getAppointmentByPatientId(int patientId) {
        Map<Appointment, Doctor> appointmentsByPatient = new HashMap<>();

        String query = "SELECT appointment_id, starting_time, ending_time, day_of_week, patient_id, a.doctor_id, d.first_name, d.last_name, d.email, d.phone_number, d.medical_specialty, d.address, d.hour_cost\n" +
                "FROM appointment as a\n" +
                "INNER JOIN doctor d ON a.doctor_id = d.doctor_id\n" +
                "WHERE a.patient_id = ?";

        SqlRowSet row = jdbcTemplate.queryForRowSet(query, patientId);

        while (row.next()) {
            Appointment appointment = new Appointment();
            Doctor doctor = new Doctor();

            int id = row.getInt("appointment_id");
            LocalTime startingTime = row.getTime("starting_time").toLocalTime();
            LocalTime endingTime = row.getTime("ending_time").toLocalTime();
            String dayOfWeek = row.getString("day_of_week");
            int dId = row.getInt("doctor_id");
            int pId = row.getInt("patient_id");
            appointment.setAppointmentId(id);
            appointment.setStartingTime(startingTime);
            appointment.setEndingTime(endingTime);
            appointment.setDayOfWeek(dayOfWeek);
            appointment.setDoctorId(dId);
            appointment.setPatientId(pId);

            doctor.setFirstName(row.getString("first_name"));
            doctor.setLastName(row.getString("last_name"));
            doctor.setEmail(row.getString("email"));
            doctor.setAddress(row.getString("address"));
            doctor.setPhoneNumber(row.getString("phone_number"));
            doctor.setMedicalSpecialty(row.getString("medical_specialty"));
            doctor.setHourCost(row.getBigDecimal("hour_cost"));

            appointmentsByPatient.put(appointment, doctor);
        }

        return appointmentsByPatient;
    }

    private Appointment mapRowToAppointment(SqlRowSet row) {
        Appointment appointment = new Appointment();

        int id = row.getInt("appointment_id");
        LocalTime startingTime = row.getTime("starting_time").toLocalTime();
        LocalTime endingTime = row.getTime("ending_time").toLocalTime();
        String dayOfWeek = row.getString("day_of_week");
        int doctorId = row.getInt("doctor_id");
        int patientId = row.getInt("patient_id");

        appointment.setAppointmentId(id);
        appointment.setStartingTime(startingTime);
        appointment.setEndingTime(endingTime);
        appointment.setDayOfWeek(dayOfWeek);
        appointment.setDoctorId(doctorId);
        appointment.setPatientId(patientId);

        return appointment;
    }

    private Appointment mapRowToAppointmentByDoctors(SqlRowSet row) {
        Appointment appointment = new Appointment();

        int id = row.getInt("appointment_id");
        LocalTime startingTime = row.getTime("starting_time").toLocalTime();
        LocalTime endingTime = row.getTime("ending_time").toLocalTime();
        String dayOfWeek = row.getString("day_of_week");
        int doctorId = row.getInt("doctor_id");
        int patientId = row.getInt("patient_id");

        appointment.setAppointmentId(id);
        appointment.setStartingTime(startingTime);
        appointment.setEndingTime(endingTime);
        appointment.setDayOfWeek(dayOfWeek);
        appointment.setDoctorId(doctorId);
        appointment.setPatientId(patientId);

        return appointment;
    }
}
