package com.techelevator.model.dao;

import com.techelevator.model.dto.Availability;

public interface AvailabilityDAO {

    Availability getAvailabilityByDoctorId(int id);

    void updateAvailability(int id, Availability availability);

}
