package team.desk3.efww.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author team desk3
 * @create 2021-04-26-23:13
 */
@Controller
public class GameController {
    @RequestMapping("/game")
    public String gameStart(){
        return "game/gameindex";
    }
}
