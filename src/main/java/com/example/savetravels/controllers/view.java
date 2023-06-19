package com.example.savetravels.controllers;

import com.example.savetravels.Services.ExpenseService;
import com.example.savetravels.models.Expense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

@Controller
public class view {
//    private final ExpenseService expenseService;
    @Autowired
    ExpenseService expenseService;

    @GetMapping("/expenses")
    public String mainView(@ModelAttribute("expense") Expense expense){
        return "index.jsp";
    }
    @PostMapping("/expenses/add")
    public void save(){

    }
    @GetMapping("/expenses/edit/{number}")
    public String editView(Model model, @PathVariable("number") String number){
        Long expenseId = Long.parseLong(number);
        Expense expense = expenseService.findexpense(expenseId);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    }
    @GetMapping("/expenses/{number}")
    public String singleView(@PathVariable("number") String number){
        int expenseId = Integer.parseInt(number);
        return "singleView.jsp";
    }
}
