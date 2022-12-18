package repository;

import entity.User;

import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {
    @Override
    public List<User> findAll() {
        return new ArrayList<>(List.of(
                new User("eaglebearer", "alexios", "gfdg4gwsdf2"),
                new User("johnnysilverhand", "johhny", "burnnightc1tyburn"),
                new User("donniebrasco", "donnie", "dgsg23fj565j21"),
                new User("weirdo215", "whosasking", "fdlkl765kl12kld")
                ));
    }
}
