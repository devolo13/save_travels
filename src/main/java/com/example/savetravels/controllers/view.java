package com.example.savetravels.controllers;

import com.example.savetravels.Services.ExpenseService;
import com.example.savetravels.models.Expense;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class view {
//    private final ExpenseService expenseService;
    @Autowired
    ExpenseService expenseService;

    @GetMapping("/expenses")
    public String mainView(Model model, @ModelAttribute("expense") Expense expense){
        List<Expense> allExpenses = expenseService.allExpenses();
        model.addAttribute("allExpenses", allExpenses);
        return "index.jsp";
    }
    @PostMapping("/expenses/save")
    public String save(
            @RequestParam("name") String name,
            @RequestParam("vendor") String vendor,
            @RequestParam("amount") double amount,
            @RequestParam("description") String description
    ){
        Expense expense = new Expense(name, vendor, amount, description);
        expenseService.createExpense(expense);
        return "redirect:/expenses";
    }
    @PostMapping("/expenses/update/{id}")
    public String edit(
            @RequestParam("name") String name,
            @RequestParam("vendor") String vendor,
            @RequestParam("amount") double amount,
            @RequestParam("description") String description,
            @PathVariable("id") long id
    ){
        Expense expense = new Expense(name, vendor, amount, description);
        expenseService.createExpense(expense);
        return "redirect:/expenses";
    }
    @GetMapping("/expenses/edit/{id}")
    public String editView(Model model, @PathVariable("id") long id){
        Expense expense = expenseService.findexpense(id);
        model.addAttribute("expense", expense);
        return "edit.jsp";
    }
    @GetMapping("/expenses/{id}")
    public String singleView(Model model, @PathVariable("id") long id){
        Expense expense = expenseService.findexpense(id);
        model.addAttribute("expense", expense);
        return "singleView.jsp";
    }
}
