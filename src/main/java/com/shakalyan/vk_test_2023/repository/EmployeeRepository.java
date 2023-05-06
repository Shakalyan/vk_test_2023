package com.shakalyan.vk_test_2023.repository;

import com.shakalyan.vk_test_2023.model.Employee;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, UUID> {

    Optional<Employee> findByUsername(String username);

}
