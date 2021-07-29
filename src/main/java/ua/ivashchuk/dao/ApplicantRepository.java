package ua.ivashchuk.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.ivashchuk.domain.Applicant;

@Repository
public interface ApplicantRepository extends JpaRepository<Applicant, Integer> {
}
