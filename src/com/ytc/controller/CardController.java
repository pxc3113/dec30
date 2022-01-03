package com.ytc.controller;

import com.ytc.model.Page;
import com.ytc.model.Card;
import com.ytc.service.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/card")
public class CardController {
    @Autowired
    private CardService cardService;
    @Autowired
    private BankService bankService;
    
    @RequestMapping("/getAll")
    public String getAll(Model model,Page page,Card card) {
        int totalRows = cardService.getTotalRows(page,card);
        page = new Page(page.getCurrentPage(), totalRows);
        System.out.println(cardService.getAll(page, card));
        model.addAttribute("page", cardService.getAll(page, card));
        return "results";
    }

    @RequestMapping("/toGetAll")
    public String toGetAll() {  
        return "query";
    }
}
