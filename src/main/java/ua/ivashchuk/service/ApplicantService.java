package ua.ivashchuk.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.ivashchuk.dao.ApplicantRepository;
import ua.ivashchuk.domain.Applicant;

import java.util.List;

@Service
public class ApplicantService  {

    Logger logger = LoggerFactory.getLogger(Applicant.class);

    @Autowired
    private ApplicantRepository applicantRepository;

    public Applicant save(Applicant applicant){
        return applicantRepository.save(applicant);
    }

    public List<Applicant> findAllApplicants(){
        logger.debug("Get all applicant item");
        return applicantRepository.findAll();
    }

    public Applicant findById(Integer id){
        logger.debug("Get applicant item by id" + id);
        return applicantRepository.getById(id);
    }

    public void delete(Applicant applicant){
        logger.debug("Delete applicant item {}: " + applicant);
        applicantRepository.delete(applicant);
    }


}
