package ua.ivashchuk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.ivashchuk.dao.StudentRepository;
import ua.ivashchuk.domain.Student;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public Student save(Student student){
      return   studentRepository.save(student);

    }

    public List<Student> FindAllStudent(){
        return studentRepository.findAll();
    }

}
