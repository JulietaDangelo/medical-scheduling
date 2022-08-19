package com.techelevator.controller;

import com.techelevator.model.dao.AppointmentDAO;
import com.techelevator.model.dao.AvailabilityDAO;
import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dto.Appointment;
import com.techelevator.model.dto.Availability;
import com.techelevator.model.dto.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AppointmentController {
    private AppointmentDAO appointmentDAO;
    private AvailabilityDAO availabilityDAO;
    private DoctorDAO doctorDAO;

    @Autowired
    public AppointmentController(AppointmentDAO appointmentDAO, AvailabilityDAO availabilityDAO, DoctorDAO doctorDAO) {
        this.appointmentDAO = appointmentDAO;
        this.availabilityDAO = availabilityDAO;
        this.doctorDAO = doctorDAO;
    }

    @RequestMapping(path="/appointment/doctor", method= RequestMethod.GET)
    public String displayNewAppointment(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));

        Availability availability = availabilityDAO.getAvailabilityByDoctorId(id);
        Doctor doctor = doctorDAO.getDoctorById(id);

        int startingTime = availability.getStartingTimeAsInt();
        int endingTime = availability.getEndingTimeAsInt();

        request.setAttribute("availability", availability);
        request.setAttribute("doctor", doctor);
        request.setAttribute("startTime", startingTime);
        request.setAttribute("endTime", endingTime);

        return "appointment/newAppointment";
    }

}
