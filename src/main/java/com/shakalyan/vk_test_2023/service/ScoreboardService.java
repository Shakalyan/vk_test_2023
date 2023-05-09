package com.shakalyan.vk_test_2023.service;

import com.shakalyan.vk_test_2023.dto.EmployeeCompletionsDto;
import com.shakalyan.vk_test_2023.dto.EmployeeTasksStatDto;
import com.shakalyan.vk_test_2023.repository.TaskRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class ScoreboardService {

    private final TaskRepository taskRepository;

    public EmployeeTasksStatDto getEmployeeTasksStat(UUID employeeId, Integer categoryId) {

        Integer totalTasksCount = taskRepository.getTasksCount(categoryId);
        List<EmployeeCompletionsDto> employeesBoard = taskRepository.getEmployeesCompletionsBoard(categoryId);

        int place = 1, completedTasksCount = 0;
        for (var ecd : employeesBoard) {
            if (ecd.getEmployeeId().equals(employeeId)) {
                completedTasksCount = ecd.getCount();
                break;
            }
            ++place;
        }

        return new EmployeeTasksStatDto(categoryId, completedTasksCount, totalTasksCount, place);
    }

}
