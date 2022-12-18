package service;

import entity.User;

import java.util.List;

public interface UserService {
    boolean isRegistered(User user);
    List<User> findAll();
    String generateAuthToken();
}
