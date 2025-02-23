--Represents the patients on file in the "Gilly Gooms Center"
CREATE TABLE "patient" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" NUMERIC NOT NULL,
    "birth_date" DATE NOT NULL,
    "patient_sex" TEXT NOT NULL CHECK("patient_sex" IN ('male', 'female')),
    "home_address" TEXT NOT NULL,
    "phone_number" NUMERIC NOT NULL,
    "insurance_provider" TEXT NOT NULL,
    "pharmacy" TEXT NOT NULL,
    PRIMARY KEY("id")
);

--Representents the appointments and status of the appointments for patients
CREATE TABLE "appointment" (
    "id" INTEGER,
    "patient_id" INTEGER,
    "doctor_id" INTEGER,
    "appointment_date" DATETIME NOT NULL,
    "appointment_status" TEXT NOT NULL CHECK("appointment_status" IN ('upcoming', 'completed', 'canceled', 'rescheduled')),
    PRIMARY KEY ("id"),
    FOREIGN KEY("patient_id") REFERENCES "patient"("id"),
    FOREIGN KEY("doctor_id") REFERENCES "doctor"("id")
);

--Represents inventory and availability of medication
CREATE TABLE "inventory" (
    "id" INTEGER,
    "item_name" TEXT NOT NULL,
    "availability" TEXT NOT NULL CHECK("availability" IN ('available', 'unavailable')),
    PRIMARY KEY("id")
);

--Represents the doctors within the healthcare system
CREATE TABLE "doctor" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "specialty" TEXT NOT NULL,
    "schedule_date" TEXT NOT NULL,
    "schedule_time" NUMERIC NOT NULL,
    PRIMARY KEY("id")
);

--Create indexes to speed up common searches
CREATE INDEX "patient_name_search" ON "patient" ("first_name", "last_name");
CREATE INDEX "doctor_availability" ON "doctor" ("schedule_date", "schedule_time");
CREATE INDEX "appointment_availability" ON "appointment" ("appointment_date", "appointment_status");

--Create a view to clearly see patient, appointment, and doctor overlap
CREATE VIEW "upcoming_appointment" AS
SELECT "patient"."first_name" AS "patient first name", "patient"."last_name" AS "patient last name", "appointment_date" AS "appointment date", "doctor"."first_name" AS "doctor first name", "doctor"."last_name" AS "doctor last name"
FROM "appointment"
    JOIN "patient" ON "patient"."id" = "appointment"."patient_id"
    JOIN "doctor" ON "doctor"."id" = "appointment"."doctor_id"
WHERE "appointment_status" IS 'upcoming'
ORDER BY "appointment_date" DESC;
