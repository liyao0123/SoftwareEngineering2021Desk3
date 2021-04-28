package team.desk3.efww.controller;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author team desk3
 * @create 2021-04-24-23:02
 */

public class DoorController {

    @RequestMapping("/")
    public String toIndex(){

        return "index_myself";
    }
}
