package ua.ivashchuk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ua.ivashchuk.domain.Applicant;
import ua.ivashchuk.service.ApplicantService;

@Controller
public class MainController {

    @Autowired
    private ApplicantService applicantService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView main(){
        ModelAndView map = new ModelAndView("home" );
        map.addObject("applicants", applicantService.findAllApplicants());

        return map;
    }

    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView welcome(){
        ModelAndView map = new ModelAndView("home");
        map.addObject("applicants", applicantService.findAllApplicants());

        return map;
    }

    @RequestMapping(value = "/create-applicant", method = RequestMethod.GET)
    @PreAuthorize("hasAuthority('ADMIN')")
    public ModelAndView createApplicant(Model model){
        return new ModelAndView("createApplicant", "applicant", new Applicant());
    }



}
