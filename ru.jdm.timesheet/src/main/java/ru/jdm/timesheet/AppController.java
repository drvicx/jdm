package ru.jdm.timesheet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Root app controller
 *
 */
@Controller
public class AppController
{
    @RequestMapping("/")
    public String index() {
        return "index";
    }

    //-страница-404 заглушка для пока несуществующих разделов
    @RequestMapping("/page404")
    public String underConstruction() {
        return "page404";
    }

}
