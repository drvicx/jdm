package ru.jdm.timesheet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.ui.ModelMap;
import org.springframework.ui.Model;
import ru.jdm.timesheet.entity.User;
import ru.jdm.timesheet.repository.UserRepository;

import java.util.Map;
import java.util.HashMap;



/*https://www.baeldung.com/spring-mvc-model-model-map-model-view*/
/**
 *=КОРНЕВОЙ КОНТОЛЛЕР РАЗДЕЛА "tests"
 * http://localhost:8080/timesheet/tests/
 * import org.springframework.stereotype.Controller;
 * import org.springframework.web.bind.annotation.RequestMapping;
*/

@Controller
@RequestMapping("/tests")
public class TestController {

    @Autowired
    UserRepository userRepository;

    /**
     *=ДОЧЕРНИЙ КОНТРОЛЛЕР 0: возвращает страницу с текстом "POST Response"
     * http://localhost:8080/timesheet/tests
     * import org.springframework.web.bind.annotation.GetMapping;
     * import org.springframework.web.bind.annotation.ResponseBody;
     * import org.springframework.http.ResponseEntity;
     * import org.springframework.http.HttpStatus;
     * */
    @GetMapping("")
    public @ResponseBody
    ResponseEntity<String> post() {
        return new ResponseEntity<String>("POST Response: OK", HttpStatus.OK);
    }

    /**
     *=ДОЧЕРНИЙ КОНТРОЛЛЕР 1: возвращает страницу и передает в нее текстовое сообщение
     * http://localhost:8080/timesheet/tests/test1
     * import org.springframework.web.servlet.ModelAndView;
     * - pass values to a View
     *   allows us to pass all the information required by Spring MVC in one return
     * */
    @GetMapping("/test1")
    public ModelAndView passParametersWithModelAndView() {
        ModelAndView modelAndView = new ModelAndView("tests/test1");
        modelAndView.addObject("message", "Hello from Controller 1");
        return modelAndView;
    }

    /**
     *=КОНТРОЛЛЕР 2: возвращает страницу и передает в нее несколько текстовых сообщений
     * http://localhost:8080/timesheet/tests/test2
     * import org.springframework.ui.ModelMap;
     * - ModelMap is used to pass values to render a view.
     *   The advantage of ModelMap is it gives us the ability to pass a collection of values
     *   and treat these values as if they were within a Map;
     * */
    @GetMapping("/test2")
    public String passParametersWithModelMap(ModelMap map) {
        map.addAttribute("message1", "Message1 text");
        map.addAttribute("message2", "Message2 text");
        return "tests/test2";
    }

    /**
     *=КОНТРОЛЛЕР 3: создает Модель из двух Объектов содержащих сообщения и передает её в Вид
     * http://localhost:8080/timesheet/tests/test3
     * import org.springframework.ui.Model;
     * import java.util.Map;
     * import java.util.HashMap;
     * - Simply put, the Model can supply attributes used for rendering views.
     *   To provide a view with usable data, we simply add this data to its Model object.
     *   Additionally, maps with attributes can be merged with Model instances;
     * */
    @GetMapping("/test3")
    public String passParametersWithModel(Model model) {
        Map<String, String> map = new HashMap<>();
        map.put("messageObj1", "text1");
        model.addAttribute("messageObj2", "text2");
        model.mergeAttributes(map);
        return "tests/test3";
    }

    /**
     *=КОНТРОЛЛЕР 4: передает значение полей объекта User через Модель в Вид
     * http://localhost:8080/timesheet/tests/test4
     * import ru.jdm.timesheet.entity.User;
     * */
    @GetMapping("/test4")
    public String passParametersWithModelFromEntity(Model model) {

        User user = new User();
        user.setUserId(1L);
        user.setLogin("testuser");
        user.setName("John");
        user.setSurname("Doe");

        model.addAttribute("userId", user.getUserId());
        model.addAttribute("userLogin", user.getLogin());
        model.addAttribute("userName", user.getName());
        model.addAttribute("userSurname", user.getSurname());

        return "tests/test4";
    }

    /**
     *=КОНТРОЛЛЕР ИЗВЛЕКАЕТ 1 ЗАПИСЬ ИЗ БД ПО HARDCODED ИДЕНТИФИКАТОРУ
     * И ВЫДАЕТ ДАННЫЕ В ВИД ЧЕРЕЗ ОБЪЕКТ МОДЕЛИ
     * import org.springframework.beans.factory.annotation.Autowired;
     * UserRepository userRepository;
     * */
    @GetMapping("/test5")
    public String passParametersWithModelFromRepository(Model model) {

        User user = userRepository.findById(1L).get();

        model.addAttribute("userId", user.getUserId());
        model.addAttribute("userLogin", user.getLogin());
        model.addAttribute("userName", user.getName());
        model.addAttribute("userSurname", user.getSurname());

        return "tests/test4";
    }

    /**
     *=КОНТРОЛЛЕР ИЗВЛЕКАЕТ 1 ЗАПИСЬ ИЗ БД ПО ПЕРЕДАННОМУ ИЗ ВИДА ИДЕНТИФИКАТОРУ
     * И ВЫДАЕТ ДАННЫЕ В ВИД ЧЕРЕЗ ОБЪЕКТ МОДЕЛИ
     * >Spring @RequestParam Annotation
     *  https://www.baeldung.com/spring-request-param
     * >Зависимости:
     *  import org.springframework.beans.factory.annotation.Autowired;
     *      UserRepository userRepository;
     *  import org.springframework.web.bind.annotation.RequestParam;
     * */
    @GetMapping("/test6")
    public String passParametersWithModelFromRepositoryById(@RequestParam Long id, Model model) {

        User user = userRepository.findById(id).get();

        model.addAttribute("userId", user.getUserId());
        model.addAttribute("userLogin", user.getLogin());
        model.addAttribute("userName", user.getName());
        model.addAttribute("userSurname", user.getSurname());

        return "tests/test4";
    }

}
