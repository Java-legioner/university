package ua.ivashchuk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ua.ivashchuk.domain.Faculty;
import ua.ivashchuk.domain.Subject;
import ua.ivashchuk.service.ApplicantDTOHelper;
import ua.ivashchuk.service.ApplicantService;

import java.io.IOException;

@Controller
public class ApplicantController {

    @Autowired
    private ApplicantService applicantService;

    @RequestMapping(value = "/addApplicant", method = RequestMethod.POST)
    public ModelAndView createApplicant(
            @RequestParam MultipartFile image,
            @RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam Integer age,
            @RequestParam String email,
            @RequestParam Faculty faculty,
            @RequestParam Subject subject1,
            @RequestParam Subject subject2,
            @RequestParam Subject subject3,
            @RequestParam Integer point1,
            @RequestParam Integer point2,
            @RequestParam Integer point3
    ) throws IOException {

        Integer GPA = (point1 + point2 + point3)/3;


        applicantService.save(ApplicantDTOHelper.createEntity(image, firstName, lastName, age, email, faculty,subject1, subject2, subject3, point1, point2, point3, GPA));
        return new ModelAndView( "congrats");
    }

    @RequestMapping(value = "/all-applicants", method = RequestMethod.GET)
    public ModelAndView main(){
        ModelAndView map = new ModelAndView("allApplicants" );
        map.addObject("applicants", applicantService.findAllApplicants());

        return map;
    }




}
