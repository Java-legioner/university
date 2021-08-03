package ua.ivashchuk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.ivashchuk.domain.Applicant;
import ua.ivashchuk.domain.Student;
import ua.ivashchuk.domain.User;
import ua.ivashchuk.service.ApplicantService;
import ua.ivashchuk.service.StudentService;
import ua.ivashchuk.service.UserService;

import java.util.Date;

@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private UserService userService;

    @Autowired
    private ApplicantService applicantService;

    @RequestMapping(value = "/students", method = RequestMethod.GET)
    public ModelAndView getAllStudents(){
        return getStudentItems();
    }

    @RequestMapping(value = "/student", method = RequestMethod.POST)
    public ModelAndView create(@RequestParam String applicantId){
        Applicant applicant = applicantService.findById(Integer.parseInt(applicantId));

        Student student = new Student();
        student.setApplicant(applicant);
        student.setPurchaseDate(new Date());

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String username = auth.getName();
        User user = userService.findByUsername(username);

        studentService.save(student);
        return getStudentItems();
    }

    @RequestMapping(value = "/student", method = RequestMethod.GET)
        public ModelAndView delete(@RequestParam String id){
            studentService.delete(new Student(Integer.parseInt(id.replaceAll("\\s", ""))));
            return getStudentItems();
        }



    private ModelAndView getStudentItems(){
        ModelAndView map = new ModelAndView("student");
        map.addObject("studentItems", studentService.FindAllStudent());
                return map;
    }
}
