package com.techelevator.model.dao;

import com.techelevator.model.dto.Review;

import java.util.List;

public interface ReviewDAO {

    List<Review> getReviewsByDoctorId(int doctorId);

    void update(String answer, int reviewId);

    void createReview(int doctorId, int patientId, String title, String description, int rating);

}
