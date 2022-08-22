package com.techelevator.controller;

import com.techelevator.model.dao.AvailabilityDAO;
import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dao.PrescriptionDAO;
import com.techelevator.model.dao.ReviewDAO;
import com.techelevator.model.dto.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalTime;


@Controller
public class PrescriptionController {

    private PrescriptionDAO prescriptionDAO;
    private DoctorDAO doctorDAO;

    @Autowired
    public PrescriptionController(PrescriptionDAO prescriptionDAO, DoctorDAO doctorDAO) {
        this.prescriptionDAO = prescriptionDAO;
        this.doctorDAO = doctorDAO;
    }

    // Display form to get new prescription
    @RequestMapping(path="/doctor/appointments/prescription", method= RequestMethod.GET)
    public String displayNewPrescription(HttpServletRequest request) {

        return "prescription/newPrescription";
    }

    // Create new prescription
    @RequestMapping(path="/doctor/appointments/prescription", method=RequestMethod.POST)
    public String createAppointment(HttpSession session, @ModelAttribute Prescription prescription, HttpServletRequest request) {
        // Prescription prescription = new Prescription();
        int id = Integer.parseInt(request.getParameter("id"));
        User user = (User)session.getAttribute("currentUser");
        request.setAttribute("prescription", prescription);

        prescriptionDAO.createNewPrescription(prescription.getPrescriptionName(), prescription.getCost(), id, user.getId());

        return  "redirect:/patient/appointments";
    }
}
