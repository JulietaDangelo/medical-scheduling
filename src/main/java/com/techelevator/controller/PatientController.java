package com.techelevator.controller;


import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dao.PatientDAO;
import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.Patient;
import com.techelevator.model.dto.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class PatientController {

    private PatientDAO patientDAO;


    @Autowired
    public PatientController(PatientDAO patientDAO) {
        this.patientDAO = patientDAO;
    }

    @RequestMapping(path="/users/new/patient", method= RequestMethod.GET)
    public String displayNewPatientForm(ModelMap modelHolder) {

        return "patient/newPatient";
    }

    @RequestMapping(path="/users/new/patient", method=RequestMethod.POST)
    public String createDoctor(@Valid @ModelAttribute Patient patient, BindingResult result, RedirectAttributes flash, HttpSession session) {
        if(result.hasErrors()) {
            flash.addFlashAttribute("patient", patient);
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "patient", result);
            return "redirect:/users/new/patient";
        }
        User user = (User)session.getAttribute("currentUser");
        patientDAO.savePatientUser(user.getId(), patient.getFirstName(), patient.getLastName(), patient.getAge(), patient.getGender(), patient.getEmail());

        return  "redirect:/";
    }

    @RequestMapping(path="/patient/profile")
    public String profilePagePatient(HttpServletRequest request, HttpSession session) {

        return "patient/patientProfile";
    }
}
