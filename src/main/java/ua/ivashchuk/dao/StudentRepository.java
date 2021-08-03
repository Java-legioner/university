package ua.ivashchuk.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.ivashchuk.domain.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {
}
