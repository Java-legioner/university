package ua.ivashchuk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ua.ivashchuk.dao.StatementRepository;
import ua.ivashchuk.domain.Statement;

import java.util.List;

@Service
public class StatementService {

    @Autowired
    private StatementRepository statementRepository;


    public Statement save(Statement statement){
        return statementRepository.save(statement);
    }

    public List<Statement> findAllStatement(){
        return statementRepository.findAll();
    }

    public void delete(Statement statement){
        statementRepository.delete(statement);
    }

    public Statement findById(Integer id){
        return statementRepository.getById(id);
    }
}
