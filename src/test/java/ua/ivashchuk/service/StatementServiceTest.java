package ua.ivashchuk.service;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit4.SpringRunner;
import ua.ivashchuk.dao.ApplicantRepository;
import ua.ivashchuk.dao.StatementRepository;
import ua.ivashchuk.dao.UserRepository;
import ua.ivashchuk.domain.*;

import java.util.Collections;
import java.util.Date;
import java.util.List;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@TestPropertySource("/application-test.properties")
class StatementServiceTest {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ApplicantService applicantService;

    @Autowired
    private ApplicantRepository applicantRepository;

    @Autowired
    private StatementService statementService;

    @Autowired
    private StatementRepository statementRepository;



    @Test
    void addToStatementTest() {
        User user = new User();
        user.setUsername("w");
        user.setLastName("ww");
        user.setPassword("1");
        user.setEmail("user@mail.com");
        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));

        userService.addUser(user);
        User userFromDB = userRepository.findAll().stream().findFirst().get();


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
        Applicant applicantFromDB = applicantRepository.findAll().stream().findFirst().get();

        Date date = new Date();
        Statement statement = new Statement();
        statement.setUser(userFromDB);
        statement.setApplicant(applicantFromDB);
        statement.setPurchaseDate(date);

        List<Statement> statements = statementRepository.findAll();
        assertThat(statements, hasSize(0));

        statementService.save(statement);
        statements = statementRepository.findAll();
        assertThat(statements, hasSize(1));


        statementService.delete(statement);
        statements = statementRepository.findAll();
        assertThat(statements, hasSize(0));

    }


    @Test
    void delete() {
//        User user = new User();
//        user.setUsername("w");
//        user.setLastName("ww");
//        user.setPassword("1");
//        user.setEmail("user@mail.com");
//        user.setActive(true);
//        user.setRoles(Collections.singleton(Role.USER));
//
//        userService.addUser(user);
//        User userFromDB = userRepository.findAll().stream().findFirst().get();


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
        Applicant applicantFromDB = applicantRepository.findAll().stream().findFirst().get();

        Date date = new Date();
        Statement statement = new Statement();
        statement.setUser(statement.getUser());
        statement.setApplicant(applicantFromDB);
        statement.setPurchaseDate(date);

        List<Statement> statements = statementRepository.findAll();
        assertThat(statements, hasSize(0));

        statementService.save(statement);
        statements = statementRepository.findAll();
        assertThat(statements, hasSize(1));


        statementService.delete(statement);
        statements = statementRepository.findAll();
        assertThat(statements, hasSize(0));

    }


}