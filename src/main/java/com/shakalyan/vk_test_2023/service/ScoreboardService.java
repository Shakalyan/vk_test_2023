package com.shakalyan.vk_test_2023.service;

import com.shakalyan.vk_test_2023.dto.EmployeeCompletionsDto;
import com.shakalyan.vk_test_2023.dto.EmployeeTasksStatDto;
import com.shakalyan.vk_test_2023.exception.EntityNotFoundException;
import com.shakalyan.vk_test_2023.model.TaskCategory;
import com.shakalyan.vk_test_2023.repository.TaskCategoryRepository;
import com.shakalyan.vk_test_2023.repository.TaskRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ScoreboardService {

    private final TaskRepository taskRepository;
    private final TaskCategoryRepository taskCategoryRepository;

    public EmployeeTasksStatDto getEmployeeTasksStat(UUID employeeId, Integer categoryId) {

        Optional<TaskCategory> category = taskCategoryRepository.findById(categoryId);
        if (category.isEmpty()) {
            String message = String.format("Category with id %d not found", categoryId);
            throw new EntityNotFoundException(message);
        }

        String categoryName = category.get().getName();
        Integer totalTasksCount = taskRepository.getTasksCount(categoryId);
        List<EmployeeCompletionsDto> employeesBoard = taskRepository.getEmployeesCompletionsBoard(categoryId);
        Integer totalParticipantsCount = employeesBoard.size();

        int place = 1, completedTasksCount = 0;
        for (var ecd : employeesBoard) {
            if (ecd.getEmployeeId().equals(employeeId)) {
                completedTasksCount = ecd.getCount();
                break;
            }
            ++place;
        }

        return new EmployeeTasksStatDto(categoryName, completedTasksCount, totalTasksCount, place, totalParticipantsCount);
    }

    public List<TaskCategory> getCategories() {
        List<TaskCategory> categories = new ArrayList<>();
        taskCategoryRepository.findAll().forEach(categories::add);
        return categories;
    }

}
