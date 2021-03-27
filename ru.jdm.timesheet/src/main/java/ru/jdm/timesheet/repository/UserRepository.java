package ru.jdm.timesheet.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.jdm.timesheet.entity.User;

@Repository
public interface UserRepository extends CrudRepository<User, Long> {

}
