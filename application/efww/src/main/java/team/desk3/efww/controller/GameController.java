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

    /**
     * the game method and strategy is different ,so there are two request mappings game1 and game2
     */
    @RequestMapping("/game1")
    public String toGame11(@RequestParam("gameId")String gameId, Model model){
        //select data from db where the category is 1-1
        QueryWrapper<Fauna> queryGame1 = Wrappers.query();
        queryGame1.eq("game_id",gameId);
        List<Fauna> faunaList = faunaService.list(queryGame1);
        model.addAttribute("faunaList",faunaList);
        //add the query number to the model
        model.addAttribute("cardNum",faunaList.size());
        //put the category into model
        model.addAttribute("sameParam",gameId);
        //put the another request param into model
        String diffParam = gameId.equals("1-1") ? "1-2" : "1-1";
        model.addAttribute("diffParam",diffParam);
        return "game/game1";
    }


    @RequestMapping("/game2")
    public String toGameHominidae(@RequestParam("gameId")String gameId,Model model){
        //first show the kind of Hominidae, monkey
        QueryWrapper<Fauna> queryGame2 = Wrappers.query();
        queryGame2.eq("game_id",gameId);
        List<Fauna> faunaList = faunaService.list(queryGame2);
        model.addAttribute("faunaList",faunaList);
        //add the query number to the model
        model.addAttribute("cardNum",faunaList.size());
        //put the category into model
        model.addAttribute("sameParam",gameId);
        //put the another request param into model
        String diffParam = gameId.equals("2-1") ? "2-2" : "2-1";
        model.addAttribute("diffParam",diffParam);
        return "game/game2";
    }


}
