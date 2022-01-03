package com.ytc.controller;

import java.util.List;

import com.ytc.model.Bank;
import com.ytc.service.BankService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/bank")
public class BankController {

    @Autowired
    private BankService bankService;

    @RequestMapping("/getAll")
    @ResponseBody
    public List<Bank> getAll(){
    	System.out.println("hi");
        return bankService.getAll();
    }
}
