package com.techelevator.controller;

import com.techelevator.model.dao.AvailabilityDAO;
import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dao.ReviewDAO;
import com.techelevator.model.dto.Availability;
import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.Review;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
public class ReviewController {
    private ReviewDAO reviewDAO;
    private DoctorDAO doctorDAO;

    @Autowired
    public ReviewController(ReviewDAO reviewDAO, DoctorDAO doctorDAO) {
        this.reviewDAO = reviewDAO;
        this.doctorDAO = doctorDAO;
    }

    // Show all reviews for a doctor
    @RequestMapping("/doctor/reviews")
    public String displayReviewsByDoctorId(HttpServletRequest request, HttpSession session) {
        User user = (User)session.getAttribute("currentUser");
        int id = user.getId();

        List<Review> reviews = reviewDAO.getReviewsByDoctorId(id);

        request.setAttribute("reviews", reviews);

        return "review/displayReviews";
    }

    // Show form to send a new review
    @RequestMapping("/doctor-list/public-profile/review")
    public String displayNewReviewForm(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));

        Doctor doctor = doctorDAO.getDoctorById(id);
        request.setAttribute("doctor", doctor);

        return "review/newReview";
    }

    // Send a new review
    @RequestMapping(path="/doctor-list/public-profile/review", method= RequestMethod.POST)
    public String postNewReview(@Valid @ModelAttribute Review review,
                                BindingResult result,
                                RedirectAttributes flash,
                                HttpServletRequest request,
                                HttpSession session) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("review", review);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "review", result);
            return "redirect:/doctor-list/public-profile/review";
        }
        int doctorId = Integer.parseInt(request.getParameter("id"));
        User user = (User)session.getAttribute("currentUser");

        reviewDAO.createReview(doctorId, user.getId(), review.getTitle(), review.getDescription(), review.getRating());

        return  "redirect:/doctor-list";
    }

}
