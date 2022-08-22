package com.techelevator.model.dao.jdbc;

import com.techelevator.model.dao.ReviewDAO;
import com.techelevator.model.dto.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCReview implements ReviewDAO {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCReview(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    public List<Review> getReviewsByDoctorId(int doctorId) {
        List<Review> reviews = new ArrayList<>();

        String query = "SELECT review_id, doctor_id, patient_id, title, description, rating, answer " +
                "FROM review\n" +
                "WHERE doctor_id = ?;";

        SqlRowSet row = jdbcTemplate.queryForRowSet(query, doctorId);

        while (row.next()) {
            reviews.add(mapRowToReview(row));
        }

        return reviews;
    }

    @Override
    public void createReview(int doctorId, int patientId, String title, String description, int rating) {
        jdbcTemplate.update("INSERT INTO review(doctor_id, patient_id, title, description, rating) " +
                "VALUES (?, ?, ?, ?, ?)", doctorId, patientId, title, description, rating);
    }

    @Override
    public void update(String answer, int reviewId) {
        String sql = "UPDATE review\n" +
                "SET answer = ?\n" +
                "WHERE review_id = ?;";

        jdbcTemplate.update(sql, answer, reviewId);

    }

    private Review mapRowToReview(SqlRowSet row) {
        Review review = new Review();

        int id = row.getInt("review_id");
        int doctorId = row.getInt("doctor_id");
        int patientId = row.getInt("patient_id");
        String title = row.getString("title");
        String description = row.getString("description");
        int rating = row.getInt("rating");
        String answer = row.getString("answer");

        review.setReviewId(id);
        review.setDoctorId(doctorId);
        review.setPatientId(patientId);
        review.setTitle(title);
        review.setDescription(description);
        review.setRating(rating);
        review.setAnswer(answer);

        return review;
    }

}
