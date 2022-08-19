package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.AppointmentDAO;
import com.techelevator.model.dto.Appointment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

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
    public List<Appointment> getAppointmentByDoctorId(int doctorId) {
        List<Appointment> appointments = new ArrayList<>();

        String query = "SELECT appointment_id, starting_time, ending_time, day_of_week, patient_id, doctor_id " +
                "FROM appointment\n" +
                "WHERE doctor_id = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(query, doctorId);

        while (row.next()) {
            appointments.add(mapRowToAppointment(row));
        }

        return appointments;
    }

    @Override
    public List<Appointment> getAppointmentByPatientId(int patientId) {
        List<Appointment> appointments = new ArrayList<>();

        String query = "SELECT appointment_id, starting_time, ending_time, day_of_week, patient_id, doctor_id " +
                "FROM appointment\n" +
                "WHERE patient_id = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(query, patientId);

        while (row.next()) {
            appointments.add(mapRowToAppointment(row));
        }

        return appointments;
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
}
