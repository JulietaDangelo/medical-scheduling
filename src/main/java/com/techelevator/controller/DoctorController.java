package com.techelevator.controller;

import com.techelevator.model.dao.DoctorDAO;
import com.techelevator.model.dto.Doctor;
import com.techelevator.model.dto.SpecialtyFilter;
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
import java.util.List;

@Controller
public class DoctorController {

    private DoctorDAO doctorDAO;

    @Autowired
    public DoctorController(DoctorDAO doctorDAO) {
        this.doctorDAO = doctorDAO;
    }

    @RequestMapping(path="/users/new/doctor", method= RequestMethod.GET)
    public String displayNewDoctorForm(ModelMap modelHolder) {
        List<String> specialtyList = Doctor.getSpecialtyList();
        modelHolder.put("specialtyList", specialtyList);
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

    @RequestMapping("/doctor-list")
    public String getAllDoctors(HttpServletRequest request, ModelMap modelMap) {
        List<Doctor> doctor = getDoctor(request);
        modelMap.put("doctors", doctor);
        List<String> specialtyList = Doctor.getSpecialtyList();
        modelMap.put("specialtyList", specialtyList);
        return "doctorList";
    }


    private List<Doctor> getDoctor(HttpServletRequest request) {
        SpecialtyFilter filter = getFilters(request);
        List<Doctor> doctors = doctorDAO.getAll(filter);

        return doctors;
    }

    private SpecialtyFilter getFilters(HttpServletRequest request) {
        SpecialtyFilter filter = new SpecialtyFilter();

        if (request.getParameter("specialty") != null) {
            String medicalSpecialty = String.valueOf(request.getParameter("specialty"));
            filter.setSpecialty(medicalSpecialty);
        }

        return filter;
    }

}
