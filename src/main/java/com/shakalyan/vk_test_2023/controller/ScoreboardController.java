package com.shakalyan.vk_test_2023.controller;

import com.shakalyan.vk_test_2023.dto.EmployeeTasksStatDto;
import com.shakalyan.vk_test_2023.model.Employee;
import com.shakalyan.vk_test_2023.service.ScoreboardService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api")
public class ScoreboardController {

    private final ScoreboardService scoreboardService;

    @GetMapping("/stat")
    public ResponseEntity<EmployeeTasksStatDto> getEmployeeTasksStat(Authentication authentication,
                                                                     @RequestParam("category_id") Integer categoryId) {
        Employee employee = ((Employee) authentication.getPrincipal());
        return ResponseEntity.ok(scoreboardService.getEmployeeTasksStat(employee.getId(), categoryId));
    }

}
