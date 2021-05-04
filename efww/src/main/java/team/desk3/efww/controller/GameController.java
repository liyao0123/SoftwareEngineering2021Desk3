package team.desk3.efww.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import team.desk3.efww.bean.Fauna;
import team.desk3.efww.service.FaunaService;

import java.util.*;

/**
 * @author team desk3
 * @create 2021-04-26-23:13
 */
@Controller
public class GameController {
    @Autowired
    FaunaService faunaService;

    @RequestMapping("/game1/1")
    public String toGame1(Model model){
        //get data from the database where kind is null
        QueryWrapper<Fauna> query = Wrappers.query();
        query.isNull("kind");
        List<Fauna> faunaList = faunaService.list(query);
        model.addAttribute("faunaList",faunaList);
        //add the query number to the model
        model.addAttribute("cardNum",faunaList.size());
        return "game/game1";
    }



    @RequestMapping("/game2/1")
    public String toGame2(Model model){
        //first show the kind of Hominidae, monkey
        QueryWrapper<Fauna> query = Wrappers.query();
        query.eq("kind","Hominidae");
        List<Fauna> list = faunaService.list(query);
        model.addAttribute("hominidae",list);
        //add the query number to the model
        model.addAttribute("cardNum",list.size());
        return "game/game2";
    }
}
