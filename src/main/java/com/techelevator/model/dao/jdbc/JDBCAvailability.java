package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.AvailabilityDAO;
import com.techelevator.model.dto.Availability;
import com.techelevator.model.dto.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.math.BigDecimal;
import java.time.LocalTime;

@Component
public class JDBCAvailability implements AvailabilityDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCAvailability(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public Availability getAvailabilityByDoctorId(int id) {
        String query = "SELECT  availability_id, doctor_id, starting_time, ending_time " +
                "FROM availability\n" +
                "WHERE doctor_id = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(query, id);

        if (row.next()) {
            return mapRowToAvailabilty(row);
        }

        return null;
    }

    @Override
    public void updateAvailability(int id, Availability availability) {
        String sql = "UPDATE availability\n" +
                "SET starting_time = ?\n" +
                "    , ending_time = ?\n" +
                "WHERE doctor_id = ?;";

        jdbcTemplate.update(sql, availability.getStartingTime(), availability.getEndingTime(), availability.getDoctorId());
    }

    private Availability mapRowToAvailabilty(SqlRowSet row) {
        Availability availability = new Availability();

        int id = row.getInt("availability_id");
        int doctorId = row.getInt("doctor_id");
        LocalTime startingTime = row.getTime("starting_time").toLocalTime();
        LocalTime endingTime = row.getTime("ending_time").toLocalTime();

        availability.setDoctorId(doctorId);
        availability.setAvailabilityId(id);
        availability.setStartingTime(startingTime);
        availability.setEndingTime(endingTime);

        return availability;
    }
}
