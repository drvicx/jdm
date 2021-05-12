package ru.jdm.timesheet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.jdm.timesheet.entity.User;
import ru.jdm.timesheet.repository.UserRepository;

import java.util.Collection;

//=FOR DEBUGGING


/**
 * User controller
 *
 */
@Controller
@RequestMapping("/user")
public class UserController
{
    @Autowired
    UserRepository userRepository;

    //для получения данных используется GetMapping
    //при создании данных используется метод @PatchMapping
    //при изменении данных используется метод @PostMapping
    //при удалении данных используется метод @DeleteMapping
    //@RequestMapping("/user")
    //@RequestMapping("")
    //@RequestMapping(value = "", method = RequestMethod.GET)

    //--РЕДАКТИРОВАНИЕ СОТРУДНИКА--
    @GetMapping("edit")
    public ModelAndView showFormUserEdit(@RequestParam(value = "userId", required = false) Long userId) {
        User user = userRepository.findById(userId).get();

        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.setViewName("user/formUserEdit");

        return mv;
    }

    //--ПРОСМОТР СОТРУДНИКА--
    @GetMapping("view")
    public ModelAndView showFormUserView(@RequestParam(value = "userId", required = false) Long userId) {
        User user = userRepository.findById(userId).get();

        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.setViewName("user/formUserView");

        return mv;
    }

    //--ОТОБРАЖАЕНИЕ СПИСКА СОТРУДНИКОВ (ТолькоЧтение/Изменение)--
    //=Отображение Списка Сотрудников в режиме ТолькоПросмотр
    @GetMapping("listview")
    public ModelAndView showFormUserListView() {

        Collection<User> users = (Collection<User>) userRepository.findAll();

        ModelAndView mv = new ModelAndView();
        mv.addObject("users", users);
        mv.setViewName("user/formUserListView");

        return mv;
    }

    //=Отображение Списка Сотрудников с элементами Добавления/Изменения Записей
    @GetMapping("listedit")
    public ModelAndView showFormUserListEdit() {

        Collection<User> users = (Collection<User>) userRepository.findAll();

        ModelAndView mv = new ModelAndView();
        mv.addObject("users", users);
        mv.setViewName("user/formUserListEdit");

        return mv;
    }


    //--СОХРАНЕНИЕ ДАННЫХ О ПОЛЬЗОВАТЕЛЕ--

    //=РАБОТАЕТ
    //=ЗАГЛУШКА: возвращает страницу с текстом "POST Response"
    // import org.springframework.http.ResponseEntity;
    // import org.springframework.http.HttpStatus;
    /*
    @PostMapping("/save")
    public @ResponseBody
    ResponseEntity<String> postTest() {
        return new ResponseEntity<String>("POST Response", HttpStatus.OK);
    }
    */

    //=РАБОТАЕТ
    // *2021.04.15 09:20
    // *2021.05.11 13:20
    @PostMapping(value = "save")
    public ModelAndView saveUser(@ModelAttribute("user") User user) {

        userRepository.save(user);

        //-остаемся на этой-же странице (форме редактирования Сотрудника)
        //ModelAndView mv = new ModelAndView();
        //mv.addObject("user", user);
        //mv.setViewName("user/formUserView");
        //return mv;

        //--переадресация на страницу со списком сотрудников после сохранения
        //-так по факту не работает (и IDE не показывает ошибку)
        //return new ModelAndView("redirect:user/formUserListEdit");
        //-а так работает (но IDE показывает ошибку: "Cannot resolve controller URL 'listedit'")
        return new ModelAndView("redirect: listedit");
    }


    //--ДОБАВЛЕНИЕ НОВОГО ПОЛЬЗОВАТЕЛЯ--
    /**
     *=КОНТРОЛЛЕР ОБРАБАТЫВАЮЩИЙ НАЖАТИЕ КНОПКИ "Add Person" В ВИДЕ "user/list"
     * Issues:  "240 - Add Customer - Setting up the Add Button - Part 2.mp4"
     *          "241 - Add Customer - Creating the HTML Form - Part 1.mp4"
     *          "242 - Add Customer - Creating the HTML Form - Part 2.mp4"
     * Depends:
     *          import org.springframework.ui.Model;
     *          import ru.jdm.timesheet.entity.User;
     * */
    //--НЕ_РАБОТАЕТ
    //  org.hibernate.id.IdentifierGenerationException: ids for this class must be manually assigned before calling save():
    //  перед вызовом метода save() не определен идентификатор объекта
    /*
    @GetMapping("/new")
    public String showFormUserAdd(Model model) {


        //-create model attribute to bind form data;
        // у объекта Model есть несколько Конструкторов один из который принимает 2 параметра
        // ключ и ссылку на Объект;
        User newUser = new User();
        model.addAttribute("user", newUser);
        userRepository.save(newUser);
        return "user/formUserAdd";
    }
     */

    //--ТЕСТ
    @GetMapping("new")
    public ModelAndView showFormUserNew(@ModelAttribute("user") User user) {

        //userRepository.save(user);

        //User newUser = new User();
        ModelAndView mv = new ModelAndView();
        //mv.addObject("user", newUser);
        mv.setViewName("user/formUserNew");

        return mv;
    }


    //=ТЕСТ: по сути обработка этого URL и Метод не нужны, т.к они дублируют уже существующие
    // @PostMapping(value = "/add")
    // public ModelAndView saveUser(..){..}
    //
    // *2021.05.11 16:47
    @PostMapping(value = "add")
    public ModelAndView addUser(@ModelAttribute("user") User user) {

        //--неРаботает
        //userRepository.save(user);
        //userRepository.saveOrUpdate(user);

        //--ТЕСТ1: создаем объект явно и также явно указываем id создаваемого объекта;
        //  *результат: объект в базу добавлен
        //
        //User testUser = new User();
        //testUser.setUserId(100L);
        //testUser.setSurname("Иванов");
        //testUser.setName("Иван");
        //testUser.setLogin("ivanii");

        //--ТЕСТ2: создаем объект явно но не указываем id создаваемого объекта;
        //  *результат: ОШИБКА:
        //   nested exception is org.springframework.orm.jpa.JpaSystemException:
        //      org.hibernate.id.IdentifierGenerationException:
        //          ids for this class must be manually assigned before calling save()
        //
        //  *РЕШЕНИЕ:
        //   - в User.java необходимо добавить аннотацию которая описывает поле id как автоинкрементный идентификатор
        //     @GeneratedValue(strategy = GenerationType.IDENTITY)
        //
        //User user = new User();
        //user.setSurname("Петров");
        //user.setName("Петр");
        //user.setLogin("petrovpp");

        //--ТЕСТ3: передаем объект из формы
        //

        //-сохраняем поля объекта в БД;
        userRepository.save(user);

        //-остаемся на этой-же странице (форме редактирования Сотрудника)
        //ModelAndView mv = new ModelAndView();
        //mv.addObject("user", user);
        //mv.setViewName("user/formUserView");
        //return mv;

        //--переадресация на страницу со списком сотрудников после сохранения
        //-так по факту не работает (и IDE не показывает ошибку)
        //return new ModelAndView("redirect:user/formUserListEdit");
        //-а так работает (но IDE не показывает ошибку: "Cannot resolve controller URL 'listedit'")
        return new ModelAndView("redirect: listedit");
    }

    //--УДАЛЕНИЕ СОТРУДНИКА--
    //--НЕ РАБОТАЕТ
    //  ОШИБКА:
    //      HTTP Status 405 – Method Not Allowed
    //      Message Request method 'GET' not supported
    // *2021.05.11 16:54
    /*
    @PostMapping(value = "/delete")
    public ModelAndView deleteUser(@ModelAttribute("user") User user) {

        //-удаление записи из БД по ID (который передается не явно)
        userRepository.delete(user);

        //-переадресация на страницу со списком сотрудников после удаления
        return new ModelAndView("redirect: listedit");
    }
    */

    //--РАБОТАЕТ
    //  *точно такая-же обработка GET-параметра как и при нажатии кнопки "изменить" в списке Сотрудников
    //  в методе showFormUserEdit()
    //  *2021.05.11 17:05
    @GetMapping("delete")
    public ModelAndView deleteUser(@RequestParam(value = "userId", required = false) Long userId) {
        User user = userRepository.findById(userId).get();

        //-удаление записи из БД по ID (который передается не явно)
        userRepository.delete(user);

        //-переадресация на страницу со списком сотрудников после удаления
        return new ModelAndView("redirect: listedit");
    }

}
