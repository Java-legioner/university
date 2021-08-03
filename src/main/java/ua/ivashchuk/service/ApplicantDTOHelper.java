package ua.ivashchuk.service;

import org.springframework.web.multipart.MultipartFile;
import ua.ivashchuk.domain.Applicant;
import ua.ivashchuk.domain.Faculty;
import ua.ivashchuk.domain.Subject;

import java.io.IOException;
import java.util.Base64;

public class ApplicantDTOHelper {

    public static Applicant createEntity(MultipartFile file, String firstName, String lastName, Integer age, String email, Faculty faculty, Subject subject1, Subject subject2, Subject subject3, Integer point1, Integer point2, Integer point3, Integer GPA) throws IOException {
        Applicant applicant = new Applicant();
        applicant.setFirstName(firstName);
        applicant.setLastName(lastName);
        applicant.setAge(age);
        applicant.setEmail(email);
        applicant.setFaculty(faculty);
        applicant.setSubject1(subject1);
        applicant.setSubject2(subject2);
        applicant.setSubject3(subject3);
        applicant.setPoint1(point1);
        applicant.setPoint2(point2);
        applicant.setPoint3(point3);
        applicant.setGPA(GPA);
        applicant.setEncodedImage(Base64.getEncoder().encodeToString(file.getBytes()));

        return applicant;
    }
}
