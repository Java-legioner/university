package ua.ivashchuk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ua.ivashchuk.domain.Faculty;
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
            @RequestParam Integer points
    ) throws IOException {

        applicantService.save(ApplicantDTOHelper.createEntity(image, firstName, lastName, age, email, faculty, points));
        return new ModelAndView( "redirect:/home");
    }

    @RequestMapping(value = "/all-applicants", method = RequestMethod.GET)
    public ModelAndView main(){
        ModelAndView map = new ModelAndView("allApplicants" );
        map.addObject("applicants", applicantService.findAllApplicants());

        return map;
    }




}
