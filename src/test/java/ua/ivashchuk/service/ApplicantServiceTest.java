package ua.ivashchuk.service;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import ua.ivashchuk.dao.ApplicantRepository;
import ua.ivashchuk.dao.UserRepository;
import ua.ivashchuk.domain.Applicant;
import ua.ivashchuk.domain.Faculty;
import ua.ivashchuk.domain.Subject;

import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.junit.jupiter.api.Assertions.assertTrue;

@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource("/application-test.properties")
class ApplicantServiceTest {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ApplicantService applicantService;

    @Autowired
    private ApplicantRepository applicantRepository;

    @Test
    void saveApplicants() {

        List<Applicant> applicants = applicantRepository.findAll();
        assertThat(applicants, hasSize(0));

        Applicant applicant = new Applicant();
        applicant.setFirstName("1");
        applicant.setLastName("2");
        applicant.setAge(21);
        applicant.setEncodedImage("1");
        applicant.setEmail("some@email.com");
        applicant.setFaculty(Faculty.ECONOMIC);
        applicant.setSubject1(Subject.BIOLOGY);
        applicant.setSubject2(Subject.ENGLISH);
        applicant.setSubject3(Subject.GEOGRAPHY);
        applicant.setPoint1(181);
        applicant.setPoint2(179);
        applicant.setPoint3(175);
        applicant.setGPA(585);

        applicantService.save(applicant);

        applicants = applicantRepository.findAll();
        assertThat(applicants, hasSize(1));

        Applicant applicantFromDb = applicants.get(0);
        assertTrue(applicantFromDb.getFirstName().equals(applicant.getFirstName()));
        assertTrue(applicantFromDb.getLastName().equals(applicant.getLastName()));
        assertTrue(applicantFromDb.getAge().equals(applicant.getAge()));
        assertTrue(applicantFromDb.getEncodedImage().equals(applicant.getEncodedImage()));
        assertTrue(applicantFromDb.getEmail().equals(applicant.getEmail()));
        assertTrue(applicantFromDb.getFaculty().equals(applicant.getFaculty()));
        assertTrue(applicantFromDb.getSubject1().equals(applicant.getSubject1()));
        assertTrue(applicantFromDb.getSubject2().equals(applicant.getSubject2()));
        assertTrue(applicantFromDb.getSubject3().equals(applicant.getSubject3()));
        assertTrue(applicantFromDb.getPoint1().equals(applicant.getPoint1()));
        assertTrue(applicantFromDb.getPoint2().equals(applicant.getPoint2()));
        assertTrue(applicantFromDb.getPoint3().equals(applicant.getPoint3()));
        assertTrue(applicantFromDb.getGPA().equals(applicant.getGPA()));



    }


    @Test
    void deleteApplicants() {

        List<Applicant> applicants = applicantRepository.findAll();
        assertThat(applicants, hasSize(1));

        Applicant applicant = new Applicant();
        applicant.setFirstName("1");
        applicant.setLastName("2");
        applicant.setAge(21);
        applicant.setEncodedImage("1");
        applicant.setEmail("some@email.com");
        applicant.setFaculty(Faculty.ECONOMIC);
        applicant.setSubject1(Subject.BIOLOGY);
        applicant.setSubject2(Subject.ENGLISH);
        applicant.setSubject3(Subject.GEOGRAPHY);
        applicant.setPoint1(181);
        applicant.setPoint2(179);
        applicant.setPoint3(175);
        applicant.setGPA(585);

        applicantService.save(applicant);

        applicants = applicantRepository.findAll();
        assertThat(applicants, hasSize(2));

        Applicant applicantFromDb = applicants.get(0);
        assertTrue(applicantFromDb.getFirstName().equals(applicant.getFirstName()));
        assertTrue(applicantFromDb.getLastName().equals(applicant.getLastName()));
        assertTrue(applicantFromDb.getAge().equals(applicant.getAge()));
        assertTrue(applicantFromDb.getEncodedImage().equals(applicant.getEncodedImage()));
        assertTrue(applicantFromDb.getEmail().equals(applicant.getEmail()));
        assertTrue(applicantFromDb.getFaculty().equals(applicant.getFaculty()));
        assertTrue(applicantFromDb.getSubject1().equals(applicant.getSubject1()));
        assertTrue(applicantFromDb.getSubject2().equals(applicant.getSubject2()));
        assertTrue(applicantFromDb.getSubject3().equals(applicant.getSubject3()));
        assertTrue(applicantFromDb.getPoint1().equals(applicant.getPoint1()));
        assertTrue(applicantFromDb.getPoint2().equals(applicant.getPoint2()));
        assertTrue(applicantFromDb.getPoint3().equals(applicant.getPoint3()));
        assertTrue(applicantFromDb.getGPA().equals(applicant.getGPA()));

        applicantService.delete(applicant);
        applicants = applicantRepository.findAll();
        assertThat(applicants, hasSize(1));

    }

    @Test
    public void findApplicantById(){

        List<Applicant> applicants = applicantRepository.findAll();
        assertThat(applicants, hasSize(1));

        Applicant applicant = new Applicant();
        applicant.setFirstName("1");
        applicant.setLastName("2");
        applicant.setAge(21);
        applicant.setEncodedImage("1");
        applicant.setEmail("some@email.com");
        applicant.setFaculty(Faculty.ECONOMIC);
        applicant.setSubject1(Subject.BIOLOGY);
        applicant.setSubject2(Subject.ENGLISH);
        applicant.setSubject3(Subject.GEOGRAPHY);
        applicant.setPoint1(181);
        applicant.setPoint2(179);
        applicant.setPoint3(175);
        applicant.setGPA(585);

        applicantService.save(applicant);

        applicants = applicantRepository.findAll();
        assertThat(applicants, hasSize(2));

        Applicant applicantFromDb = applicantService.findById(1);
        assertTrue(applicantFromDb.getFirstName().equals(applicant.getFirstName()));
        assertTrue(applicantFromDb.getLastName().equals(applicant.getLastName()));
        assertTrue(applicantFromDb.getAge().equals(applicant.getAge()));
        assertTrue(applicantFromDb.getEncodedImage().equals(applicant.getEncodedImage()));
        assertTrue(applicantFromDb.getEmail().equals(applicant.getEmail()));
        assertTrue(applicantFromDb.getFaculty().equals(applicant.getFaculty()));
        assertTrue(applicantFromDb.getSubject1().equals(applicant.getSubject1()));
        assertTrue(applicantFromDb.getSubject2().equals(applicant.getSubject2()));
        assertTrue(applicantFromDb.getSubject3().equals(applicant.getSubject3()));
        assertTrue(applicantFromDb.getPoint1().equals(applicant.getPoint1()));
        assertTrue(applicantFromDb.getPoint2().equals(applicant.getPoint2()));
        assertTrue(applicantFromDb.getPoint3().equals(applicant.getPoint3()));
        assertTrue(applicantFromDb.getGPA().equals(applicant.getGPA()));

        applicantService.delete(applicant);
        applicants = applicantRepository.findAll();
        assertThat(applicants, hasSize(1));

    }


}