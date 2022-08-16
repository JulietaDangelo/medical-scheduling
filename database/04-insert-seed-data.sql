-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

INSERT INTO app_user(user_name, password, role, salt)
VALUES ('Carreyra12', 'password1', 'patient', '4141414141')
     , ('DAngelo12', 'password2', 'doctor', '41448325')
     , ('Costanzo12', 'password3', 'doctor', '414145321');

INSERT INTO doctor(doctor_id, user_name, first_name, last_name, email, address, phone_number, medical_specialty, hour_cost)
VALUES ( (SELECT id FROM app_user WHERE user_name = 'DAngelo12'), 'DAngelo12', 'Julieta', 'DAngelo', 'juli@gmail.com', 'hello 234', '4141414141', 'Dermatologist', '100')
      , ( (SELECT id FROM app_user WHERE user_name = 'Costanzo12'), 'Costanzo12', 'Sofia', 'Costanzo', 'sofi@gmail.com', 'bye 1234', '4141414122', 'Cardiologist', '10');

INSERT INTO patient(patient_id, user_name, first_name, last_name, age, gender, email)
VALUES ( (SELECT id FROM app_user WHERE user_name = 'Carreyra12'), 'Carreyra12', 'Magali', 'Carreyra', '23', 'Female', 'maga@gmail.com');


COMMIT;