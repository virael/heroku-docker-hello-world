package com.ljanusz.herokudockerhelloworld.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AppRestController {
    @GetMapping
    public String getWelcomeMessage() {
        return "Hello my friend. Stay a while and listen. - Decard Cain";
    }
}
