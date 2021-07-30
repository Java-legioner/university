package ua.ivashchuk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import ua.ivashchuk.domain.Applicant;
import ua.ivashchuk.service.ApplicantService;

@Controller
public class ApplicantController {

    @Autowired
    private ApplicantService applicantService;

    @RequestMapping(value = "/addApplicant", method = RequestMethod.POST)
    public String createApplicant(@Validated @ModelAttribute("periodical")Applicant applicant, BindingResult bindingResult){
        applicantService.save(applicant);
        return "redirect:/home";
    }

    @RequestMapping(value = "/all-applicants", method = RequestMethod.GET)
    public ModelAndView main(){
        ModelAndView map = new ModelAndView("allApplicants" );
        map.addObject("applicants", applicantService.findAllApplicants());

        return map;
    }


}
