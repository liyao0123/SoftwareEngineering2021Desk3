package team.desk3.efww.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.HashMap;
import java.util.Map;

/**
 * @author team desk3
 * @create 2021-04-24-23:02
 */

@Controller
public class IndexController {

    @GetMapping(value = {"/index","/"})
    public String toIndex(Model model){

        return "index";
    }
}
