package ua.ivashchuk.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.ivashchuk.dao.StudentRepository;
import ua.ivashchuk.domain.Student;

import java.util.List;

@Service
public class StudentService {
    private Logger logger = LoggerFactory.getLogger(Student.class);

    @Autowired
    private StudentRepository studentRepository;

    public Student save(Student student){
        logger.debug("Create new student item {} :" + student);
        return   studentRepository.save(student); }

    public List<Student> FindAllStudent(){
        logger.debug("Get all student item");
        return studentRepository.findAll(); }

    public void delete(Student student){
        logger.debug("Delete student item {} :" + student);
        studentRepository.delete(student); }



}
