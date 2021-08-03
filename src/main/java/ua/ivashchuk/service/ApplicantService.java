package ua.ivashchuk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.ivashchuk.dao.ApplicantRepository;
import ua.ivashchuk.domain.Applicant;

import java.util.List;

@Service
public class ApplicantService  {

    @Autowired
    private ApplicantRepository applicantRepository;

    public Applicant save(Applicant applicant){
        return applicantRepository.save(applicant);
    }

    public List<Applicant> findAllApplicants(){

        return applicantRepository.findAll();
    }

    public Applicant findById(Integer id){
        return applicantRepository.getById(id);
    }

    public void delete(Applicant applicant){
        applicantRepository.delete(applicant);
    }


}
