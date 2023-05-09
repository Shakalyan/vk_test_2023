package com.shakalyan.vk_test_2023.repository;

import com.shakalyan.vk_test_2023.model.TaskCategory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TaskCategoryRepository extends CrudRepository<TaskCategory, Integer> {
}
