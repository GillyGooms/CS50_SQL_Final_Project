--Find all doctors by name under a specific specialty. For this example, we will use 'cardiologist'
SELECT "first_name", "last_name"
FROM "doctor"
WHERE "specialty" IS 'veterinarian';

--A patient wants to know if their prescription can be filled. Check for inventory of a specific medication
SELECT "availability"
FROM "inventory"
WHERE "item_name" LIKE '%quack%';

--Gilly Gooms Center has a new patient! Help to add them to the portal
INSERT INTO "patient" ("first_name", "last_name", "age", "birth_date", "patient_sex", "home_address", "phone_number", "insurance_provider", "pharmacy")
VALUES ('CS50', 'Duck', 10, '2015-01-01', 'male', '0101 Not Yale Avenue', '5555555555', 'Harvard', 'Gilly Gooms Pharmacy');

--Gilly Gooms Center wants to add a new doctor! Help add them to the portal
INSERT INTO "doctor" ("first_name", "last_name", "specialty", "schedule_date", "schedule_time")
VALUES ('Duck', 'Debugger', 'veterinarian', 'Mon-Wed', '10-3');

-- Add a new appointment status
INSERT INTO "appointment" ("patient_id", "doctor_id", "appointment_date", "appointment_status")
VALUES (1, 1, '2025-01-01', 'completed');

--Add a new item to inventory
INSERT INTO "inventory" ("item_name", "availability")
VALUES ('dequack', 'available');
