package ua.ivashchuk.service;

import org.springframework.web.multipart.MultipartFile;
import ua.ivashchuk.domain.Applicant;
import ua.ivashchuk.domain.Faculty;

import java.io.IOException;
import java.util.Base64;

public class ApplicantDTOHelper {

    public static Applicant createEntity(MultipartFile file, String firstName, String lastName, Integer age, String email, Faculty faculty, Integer points) throws IOException {
        Applicant applicant = new Applicant();
        applicant.setFirstName(firstName);
        applicant.setLastName(lastName);
        applicant.setAge(age);
        applicant.setEmail(email);
        applicant.setFaculty(faculty);
        applicant.setPoints(points);
        applicant.setEncodedImage(Base64.getEncoder().encodeToString(file.getBytes()));

        return applicant;
    }
}
