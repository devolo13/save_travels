package com.example.savetravels.controllers;

import com.example.savetravels.Services.ExpenseService;
import com.example.savetravels.models.Expense;
import jakarta.validation.Valid;
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
    public String save(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model){
        if (result.hasErrors()){
            List<Expense> allExpenses = expenseService.allExpenses();
            model.addAttribute("allExpenses", allExpenses);
            return "index.jsp";
        }
        expenseService.createExpense(expense);
        return "redirect:/expenses";
    }

    @PostMapping("/expenses/update/{id}")
    public String edit(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model, @PathVariable("id") long id){
//        Expense expense = new Expense(name, vendor, amount, description);
        if (result.hasErrors()){
            model.addAttribute("expense", expense);
            return "edit.jsp";
        }
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

    @GetMapping("/expenses/delete/{id}")
    public String delete(@PathVariable("id") long id){
//        Expense expense = expenseService.findexpense(id);
        expenseService.deleteExpense(id);
        return "redirect:/expenses";
    }
}
