package ua.ivashchuk.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.ivashchuk.dao.StatementRepository;
import ua.ivashchuk.domain.Statement;

import java.util.List;

@Service
public class StatementService {
    Logger logger = LoggerFactory.getLogger(Statement.class);

    @Autowired
    private StatementRepository statementRepository;


    public Statement save(Statement statement){
        logger.debug("Create new statement item {} :" + statement);
        return statementRepository.save(statement);
    }

    public List<Statement> findAllStatement() {
        logger.debug("Get all statement item");
        return statementRepository.findAll();
    }

    public void delete(Statement statement) {
        logger.debug("Delete statement item {} :" + statement);
        statementRepository.delete(statement);
    }


}
