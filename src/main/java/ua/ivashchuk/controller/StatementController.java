package ua.ivashchuk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.ivashchuk.domain.Applicant;
import ua.ivashchuk.domain.Statement;
import ua.ivashchuk.domain.Student;
import ua.ivashchuk.domain.User;
import ua.ivashchuk.service.ApplicantService;
import ua.ivashchuk.service.StatementService;
import ua.ivashchuk.service.StudentService;
import ua.ivashchuk.service.UserService;

import java.util.Date;

@Controller
public class StatementController {

    @Autowired
    private StatementService statementService;

    @Autowired
    private UserService userService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private ApplicantService applicantService;

    @RequestMapping(value = "/statements", method = RequestMethod.GET)
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView getAllStudents() {
        return getStatementItems();
    }

    @RequestMapping(value = "/statement", method = RequestMethod.POST)
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView create(@RequestParam String applicantId) {
        Applicant applicant = applicantService.findById(Integer.parseInt(applicantId));
        Integer GPA = applicant.getGPA();
        Integer apl = applicant.getId();


        Statement statement = new Statement();
        statement.setApplicant(applicant);
        statement.setPurchaseDate(new Date());

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUserUsername(username);
        statement.setUser(user);

        statementService.save(statement);


        if (GPA > 175) {
            Student student = new Student();
            student.setApplicant(applicant);
            student.setPurchaseDate(new Date());
            studentService.save(student);
        }


        return getStatementItems();
    }


    @RequestMapping(value = "/statement", method = RequestMethod.GET)
    public ModelAndView delete(@RequestParam String id) {
        statementService.delete(new Statement(Integer.parseInt(id.replaceAll("\\s", ""))));
        return getStatementItems();
    }


    private ModelAndView getStatementItems() {
        ModelAndView map = new ModelAndView("statement");
        map.addObject("statementItems", statementService.findAllStatement());
        return map;
    }
}
