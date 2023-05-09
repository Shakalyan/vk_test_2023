package com.shakalyan.vk_test_2023.repository;

import com.shakalyan.vk_test_2023.dto.EmployeeCompletionsDto;
import com.shakalyan.vk_test_2023.model.Task;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.UUID;

@Repository
public interface TaskRepository extends CrudRepository<Task, UUID> {

    @Query(
            value = "SELECT COUNT(*) FROM tasks WHERE category_id = :#{#categoryId}",
            nativeQuery = true
    )
    Integer getTasksCount(@Param("categoryId") Integer categoryId);

    @Query(
            value = """
                    SELECT employee_id as employeeId, COUNT(*) as count
                    FROM tasks_completions
                    JOIN tasks on tasks.id = tasks_completions.task_id
                    WHERE category_id = :#{#categoryId}
                    GROUP BY employee_id
                    ORDER BY count DESC;
                    """,
            nativeQuery = true
    )
    List<EmployeeCompletionsDto> getEmployeesCompletionsBoard(@Param("categoryId") Integer categoryId);


}
