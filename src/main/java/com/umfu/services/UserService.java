package com.umfu.services;

import com.sun.tools.javac.util.List;
import com.umfu.entities.User;
import com.umfu.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    UserRepository userRepository;

    public List<User> getAllUsers(){

        List<User> userList = (List<User>) userRepository.findAll();

        if(userList.size() > 0) {
            return userList;
        }
        return userList;
    }

    public User getUserById(Long id)
    {
        Optional<User> employee = userRepository.findById(id);

        if(employee.isPresent()) {
            return employee.get();
        }else {
            return null;
        }

    }

    public User createOrUpdateUser (User entity)
    {
        Optional<User> employee = userRepository.findById(entity.getId());

        if(employee.isPresent())
        {
            User newEntity = employee.get();
            newEntity.setFirstName(entity.getFirstName());
            newEntity.setLastName(entity.getLastName());
            newEntity.setUsername(entity.getUsername());
            newEntity.setPassword(entity.getPassword());

            newEntity = userRepository.save(newEntity);

            return newEntity;
        } else {
            entity = userRepository.save(entity);

            return entity;
        }


    }
}
