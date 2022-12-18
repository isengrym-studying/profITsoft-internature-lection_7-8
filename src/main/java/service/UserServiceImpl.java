package service;

import entity.User;
import repository.UserRepository;

import java.util.List;
import java.util.UUID;

public class UserServiceImpl implements UserService {
    private final UserRepository userRepo;

    public UserServiceImpl(UserRepository userRepo) {
        this.userRepo = userRepo;
    }

    @Override
    public boolean isRegistered(User user) {
        List<User> users = userRepo.findAll();
        return users.stream()
                .anyMatch(user::equals);
    }

    @Override
    public List<User> findAll() {
        return userRepo.findAll();
    }

    @Override
    public String generateAuthToken() {
        //UUID isn't good as authentication token
        return UUID.randomUUID().toString();
    }
}
