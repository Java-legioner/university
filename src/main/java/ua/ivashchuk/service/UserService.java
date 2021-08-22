package ua.ivashchuk.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import ua.ivashchuk.dao.UserRepository;
import ua.ivashchuk.domain.Role;
import ua.ivashchuk.domain.User;

import java.util.Collections;

@Service
public class UserService implements UserDetailsService {
    private Logger logger = LoggerFactory.getLogger(User.class);

    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return userRepository.findByUsername(username);
    }



    public User findByUsername(String username){
        logger.debug("Get user item bu user name :" + username);
        return userRepository.findByUsername(username);
    }

    public boolean addUser(User user){
        User userFromDB = userRepository.findByUsername(user.getUsername());

        if(userFromDB != null){
            return false;
        }

        user.setActive(true);
        user.setRoles(Collections.singleton(Role.USER));
        userRepository.save(user);

        return true;
    }


}
