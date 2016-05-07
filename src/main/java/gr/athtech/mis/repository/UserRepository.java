package gr.athtech.mis.repository;

import gr.athtech.mis.model.Role;
import gr.athtech.mis.model.User;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import java.util.List;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Service("userRepository")
public class UserRepository {

    private static final Logger logger = LoggerFactory.getLogger(UserRepository.class);

    @Resource
    IUserRepository repo;
    @Resource
    IRoleRepository roleRepo;

    public List<User> findAll() {
        List<User> users = repo.findAll();

        logger.info("---------Users", users);
        return users;
    }

    public User findOne(Long id) {

        User user = repo.findOne(id);

        return user;
    }

    /**
     * Get users based on a certain role
     *
     * @param role
     * @return
     */
    public List<User> findByRole(Role role) {
        List<User> users = repo.findByRoles(role);

        return users;
    }

    /**
     * Return the users who have "medical visitor" as a role
     *
     * @return
     */
    public List<User> getMedicalVisitors() {

        Role medicalVisitor = roleRepo.findByName("ROLE_MEDICAL_VISITOR");
        List<User> medicalVisitors = repo.findByRoles(medicalVisitor);

        return medicalVisitors;
    }

    /**
     * Save a new user instance
     *
     * @param user
     * @return
     */
    public User save(User user) {
        user.setPassword(encodePassword(user.getPassword()));
        user = repo.save(user);
        return user;
    }

    /**
     * Update the user instance
     *
     * @param user
     * @return
     */
    public User update(User user) {
        user.setPassword(encodePassword(user.getPassword()));
        user = repo.save(user);
        return user;
    }

    /**
     * Delete a user based on Id
     *
     * @param id
     */
    public void delete(Long id) {
        repo.delete(id);
    }

    /**
     * Encode the user's password 
     * 
     * @param password
     * @return 
     */
    private String encodePassword(String password) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String hashedPassword = passwordEncoder.encode(password);
        return hashedPassword;
    }

}
