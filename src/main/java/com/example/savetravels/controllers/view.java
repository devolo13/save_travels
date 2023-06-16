package com.example.savetravels.controllers;

import com.example.savetravels.models.Expense;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class view {
    @GetMapping("/expenses")
    public String mainView(@ModelAttribute("expense") Expense expense){
        return "index.jsp";
    }
}
