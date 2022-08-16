package com.techelevator.controller;

import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class DoctorController {

    private DoctorDAO doctorDAO;

    @Autowired
    public DoctorController(DoctorDAO doctorDAO) {
        this.doctorDAO = doctorDAO;
    }

    @RequestMapping(path="/users/new/doctor", method= RequestMethod.GET)
    public String displayNewDoctorForm(ModelMap modelHolder) {
        return "doctor/newDoctor";
    }


    @RequestMapping(path="/users/new/doctor", method=RequestMethod.POST)
    public String createDoctor(@Valid @ModelAttribute Doctor doctor, BindingResult result, RedirectAttributes flash, HttpSession session) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("doctor", doctor);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "doctor", result);
            return "redirect:/users/new/doctor";
        }
        User user = (User)session.getAttribute("currentUser");
        doctorDAO.saveDoctorUser(user.getId(), doctor.getFirstName(), doctor.getLastName(), doctor.getEmail(), doctor.getHourCost(), doctor.getAddress(), doctor.getPhoneNumber(), doctor.getMedicalSpecialty());

        return  "redirect:/";
    }

}
