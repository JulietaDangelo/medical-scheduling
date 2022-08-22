package com.techelevator.controller;

import com.techelevator.model.dao.AvailabilityDAO;
import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dto.Availability;
import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
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
public class DoctorController {

    private DoctorDAO doctorDAO;
    private AvailabilityDAO availabilityDAO;

    @Autowired
    public DoctorController(DoctorDAO doctorDAO, AvailabilityDAO availabilityDAO) {
        this.doctorDAO = doctorDAO;
        this.availabilityDAO = availabilityDAO;
    }

    // Display form with specific information to new doctors
    @RequestMapping(path="/users/new/doctor", method= RequestMethod.GET)
    public String displayNewDoctorForm(ModelMap modelHolder) {
        List<String> specialtyList = Doctor.getSpecialtyList();
        modelHolder.put("specialtyList", specialtyList);
        return "doctor/newDoctor";
    }

    // Get information about new doctor
    @RequestMapping(path="/users/new/doctor", method=RequestMethod.POST)
    public String createDoctor(@Valid @ModelAttribute Doctor doctor, BindingResult result, RedirectAttributes flash, HttpSession session) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("doctor", doctor);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "doctor", result);
            return "redirect:/users/new/doctor";
        }
        User user = (User)session.getAttribute("currentUser");

        doctorDAO.saveDoctorUser(user.getId(), doctor.getFirstName(), doctor.getLastName(), doctor.getEmail(), doctor.getHourCost(), doctor.getAddress(), doctor.getPhoneNumber(), doctor.getMedicalSpecialty());

        return  "redirect:/users/new/doctor/availability";
    }

    // Get the list of all the doctors
    @RequestMapping("/doctor-list")
    public String getAllDoctors(HttpServletRequest request, ModelMap modelMap) {
        List<Doctor> doctor = doctorDAO.getDoctor(request);
        modelMap.put("doctors", doctor);
        List<String> specialtyList = Doctor.getSpecialtyList();
        modelMap.put("specialtyList", specialtyList);
        return "doctor/doctorList";
    }

    // Show the personal profile page of the doctor
    @RequestMapping("/doctor/profile")
    public String profilePage(HttpServletRequest request, HttpSession session) {
        User user = (User)session.getAttribute("currentUser");
        int id = user.getId();

        Doctor doctor = doctorDAO.getDoctorById(id);
        Availability availability = availabilityDAO.getAvailabilityByDoctorId(id);
        int startingTime = availability.getStartingTimeAsInt();
        int endingTime = availability.getEndingTimeAsInt();

        request.setAttribute("doctor", doctor);
        request.setAttribute("availability", availability);
        request.setAttribute("startTime", startingTime);
        request.setAttribute("endTime", endingTime);

        return "doctor/doctorPersonalProfile";
    }

    // Show the public profile of the doctors
    @RequestMapping("/doctor-list/public-profile")
    public String details(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));

        Doctor doctor = doctorDAO.getDoctorById(id);
        Availability availability = availabilityDAO.getAvailabilityByDoctorId(id);
        int startingTime = availability.getStartingTimeAsInt();
        int endingTime = availability.getEndingTimeAsInt();

        request.setAttribute("doctor", doctor);
        request.setAttribute("availability", availability);
        request.setAttribute("startTime", startingTime);
        request.setAttribute("endTime", endingTime);

        return "doctor/doctorPublicProfile";
    }

    // Display form to choose hours in new doctor
    @RequestMapping(path="/doctor/profile/update", method= RequestMethod.GET)
    public String displayHours(HttpServletRequest request, HttpSession session) {
        User user = (User)session.getAttribute("currentUser");
        int id = user.getId();

        Doctor doctor = doctorDAO.getDoctorById(id);
        Availability availability = availabilityDAO.getAvailabilityByDoctorId(id);

        request.setAttribute("doctor", doctor);
        request.setAttribute("availability", availability);

        return "doctor/updateDoctorHours";
    }

    // Get hours from new doctor
    @RequestMapping(path="/users/profile/update", method=RequestMethod.POST)
    public String updateHours(@Valid @ModelAttribute Availability availability,
                              BindingResult result,
                              RedirectAttributes flash,
                              HttpSession session) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("availability", availability);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "availability", result);
            return "redirect:/users/profile/update";
        }
        User user = (User)session.getAttribute("currentUser");

        availabilityDAO.updateAvailability(user.getId(), availability.getStartingTime(), availability.getEndingTime());

        return  "redirect:/doctor/profile";
    }

    // Get form to update hours from existing doctor
    @RequestMapping(path= "/users/new/doctor/availability", method= RequestMethod.GET)
    public String setAvailableHours(HttpServletRequest request, HttpSession session, Model model) {
        User user = (User)session.getAttribute("currentUser");
        int id = user.getId();

        Doctor doctor = doctorDAO.getDoctorById(id);

        model.addAttribute("availability", new Availability());
        request.setAttribute("doctor", doctor);

        return "doctor/doctorsAvailability";
    }

    // Update hours from existing doctor
    @RequestMapping(path="/users/new/doctor/availability", method=RequestMethod.POST)
    public String updateAvailableHours(@Valid @ModelAttribute Availability availability,
                              BindingResult result,
                              RedirectAttributes flash,
                              HttpSession session) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("availability", availability);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "availability", result);
            return "redirect:/users/profile/update";
        }
        User user = (User)session.getAttribute("currentUser");

        availabilityDAO.saveAvailability(user.getId(), availability.getStartingTime(), availability.getEndingTime());

        return  "redirect:/";
    }

    // Display form to update personal info from doctor
    @RequestMapping(path="/users/update/doctor", method= RequestMethod.GET)
    public String displayUpdateInfoForm(ModelMap modelHolder) {
        List<String> specialtyList = Doctor.getSpecialtyList();

        modelHolder.put("specialtyList", specialtyList);
        return "doctor/updateDoctorInfo";
    }

    // Get new personal info from doctor
    @RequestMapping(path="/users/update/doctor", method=RequestMethod.POST)
    public String updateDoctorInfo(@Valid @ModelAttribute Doctor doctor, HttpSession session) {
        User user = (User)session.getAttribute("currentUser");

        doctorDAO.update(user.getId(), doctor.getEmail(), doctor.getAddress(), doctor.getPhoneNumber(), doctor.getMedicalSpecialty(), doctor.getHourCost());

        return  "redirect:/doctor/profile";
    }
}
