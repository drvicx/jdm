package ru.jdm.timesheet;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ru.jdm.timesheet.entity.User;

import java.util.Collection;
import java.util.LinkedList;

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

    @RequestMapping("/user")
    public ModelAndView user(Long userId) {
        User user = new User();
        user.setLogin("user1");
        user.setName("Иван");
        user.setSurname("Иванов");

        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.setViewName("user/form");

        return mv;
    }

    @RequestMapping("/user/list")
    public ModelAndView users() {
        Collection<User> users = new LinkedList<>();

        User user = new User();
        user.setLogin("user1");
        user.setName("Иван");
        user.setSurname("Иванов");
        users.add(user);

        user = new User();
        user.setLogin("user2");
        user.setName("Петр");
        user.setSurname("Петров");
        users.add(user);

        ModelAndView mv = new ModelAndView();
        mv.addObject("users", users);
        mv.setViewName("user/list");

        return mv;
    }
}
