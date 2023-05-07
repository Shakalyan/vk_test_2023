package com.shakalyan.vk_test_2023.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @GetMapping("/scoreboard")
    public String scoreboard() {
        return "scoreboard";
    }

}
