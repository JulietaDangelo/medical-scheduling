package com.techelevator.model.dto;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

public class Patient {


    private int patientId;

    private String userName;
    @NotBlank(message = "Your First Name is required")
    private String firstName;
    @NotBlank(message = "Your Last Name is required")
    private String lastName;

    @Email
    @NotBlank(message = "Your Email is required")
    private String email;
    @NotNull(message = "Your Age is required")
    @Pattern.List({
            @Pattern(regexp=".*\\d.*", message="Must be only numbers")
    })
    private int age;


    @NotBlank(message = "Your Gender is required")
    private String gender;

    public Patient() {
    }

    public int getPatientId() {
        return patientId;
    }

    public void setPatientId(int patientId) {
        this.patientId = patientId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
