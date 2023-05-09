package com.shakalyan.vk_test_2023.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;

@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class EmployeeTasksStatDto {

    Integer categoryId;

    Integer completedTasksCount;

    Integer totalTasksCount;

    Integer place;

}