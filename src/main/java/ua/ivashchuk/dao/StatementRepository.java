package ua.ivashchuk.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ua.ivashchuk.domain.Statement;

@Repository
public interface StatementRepository extends JpaRepository<Statement, Integer> {
}
