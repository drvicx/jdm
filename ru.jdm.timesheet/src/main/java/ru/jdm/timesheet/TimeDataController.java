package ru.jdm.timesheet;

import lombok.val;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ru.jdm.timesheet.entity.TimeData;
import ru.jdm.timesheet.entity.TimeDataType;
import ru.jdm.timesheet.entity.User;
import ru.jdm.timesheet.repository.TimeDataRepository;

import java.time.LocalDate;
import java.util.Collection;
import java.util.LinkedList;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.validation.BindingResult;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;



/**
 * Time data operations Controller
 */
@Controller
@RequestMapping("/timedata")
public class TimeDataController {

    @Autowired
    TimeDataRepository timeDataRepository;

    //--ПРОСМОТР ЕДИНИЧНОЙ ЗАПИСИ---------------------------------------------------------------------------------------

    //--выборка по ID записи
    @GetMapping("viewrecord")
    public ModelAndView showFormUserTDataView1(@RequestParam(value = "id", required = false) Long id) {

        TimeData timeData = timeDataRepository.findById(id).get();

        ModelAndView mv = new ModelAndView();
        mv.addObject("timeData", timeData);
        mv.setViewName("timedata/formTDataView");

        return mv;
    }

    //--выборка по ID Сотрудника и Дате
    @GetMapping("viewuserday")
    public ModelAndView showFormUserTDataView2(@RequestParam(value = "userId", required = true) Long userId,
                             @RequestParam(value = "date", required = true)
                             @DateTimeFormat(pattern = "yyyy-MM-dd") String date) {
                           //@DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date) {

        TimeData timeData = timeDataRepository.findByUserIdAndDate(userId, date);

        ModelAndView mv = new ModelAndView();
        mv.addObject("timeData", timeData);
        //mv.setViewName("formUserTDataEdit");
        mv.setViewName("timedata/formTDataView");

        return mv;
    }


    //--ПРОСМОТР СПИСКА-------------------------------------------------------------------------------------------------

    //=РАБОТАЕТ
    //--выборка всех данных в режиме ТолькоПросмотр
    @GetMapping("viewusersdays")
    public ModelAndView showFormUserTDataListView() {

        Collection<TimeData> timeData = (Collection<TimeData>) timeDataRepository.findAll();

        ModelAndView mv = new ModelAndView();
        mv.addObject("timeData", timeData);
        mv.setViewName("timedata/formTDataListView");

        return mv;
    }

    //=РАБОТАЕТ
    //--выборка всех записей из TIMEDATA относящихся к Сотруднику с указанными userId
    // http://localhost:8080/timesheet/timedata/getuserdata?userId=1
    //@SuppressWarnings("unchecked")    //--подавление ошибки не решает причину ошибки
    @GetMapping("viewuserdays")
    public ModelAndView getUserAllData(@RequestParam(value = "userId", required = true) Long userId) {

        //--НЕ_ПРАВИЛЬНО: должен возвращаеться множественный а не единичный результат!
        //TimeData timeData = timeDataRepository.findByUserId(userId);

        //--ОШИБКА: требуется преобразование типа принимаемого набора данных
        //Collection<TimeData> timeData = timeDataRepository.findByUserId(userId);

        //--ОШИБКА: кастинг типа синтаксически правильно, но логически нет
        //Collection<TimeData> timeData = (Collection<TimeData>) timeDataRepository.findByUserId(userId);
        //..IDE подсказывает:
        //  Unchecked cast: 'ru.jdm.timesheet.entity.TimeData' to 'java.util.Collection<ru.jdm.timesheet.entity.TimeData>'

        //--Lombok синтаксис
        //val timeData = (Collection<TimeData>) timeDataRepository.findByUserId(userId);

        //--ПРАВИЛЬНО: это заработало после того как в TimeDataRepository
        //  Методу findByUserId(userId) был задан правильный Тип получаемого из БД результата - Collection
        //Collection<TimeData> timeData = timeDataRepository.findByUserId(userId);

        //--ПРАВИЛЬНО: Lombok синтаксис
        val timeData = timeDataRepository.findByUserId(userId);

        ModelAndView mv = new ModelAndView();
        mv.addObject("timeData", timeData);
        //mv.addObject("userData", userData);
        mv.setViewName("timedata/formTDataListView");

        return mv;
    }


    //--РЕДАКТИРОВАНИЕ СПИСКА-------------------------------------------------------------------------------------------

    //--выборка всех данных в режиме Просмотр/Изменение
    @GetMapping("editusersdays")
    public ModelAndView showFormUserTDataListEdit() {

        Collection<TimeData> timeData = (Collection<TimeData>) timeDataRepository.findAll();

        ModelAndView mv = new ModelAndView();
        mv.addObject("timeData", timeData);
        mv.setViewName("timedata/formTDataListEdit");

        return mv;
    }

    //--выборка по ID записи
    @GetMapping("editrecord")
    public ModelAndView showFormUserTDataEdit(@RequestParam(value = "id", required = false) Long id) {

        TimeData timeData = timeDataRepository.findById(id).get();

        ModelAndView mv = new ModelAndView();
        mv.addObject("timeData", timeData);
        mv.setViewName("timedata/formTDataEdit");

        return mv;
    }


    //--СОХРАНЕНИЕ ИЗМЕНЕНИЙ--------------------------------------------------------------------------------------------

    //=РАБОТАЕТ
    // *2021.05.12 17:25
    // - возможно BindingResult перехватывает HTTP-ответ и подавляет ошибку
    // - есть предположение что ошибка из-за поля с датой
    //public ModelAndView saveTimeData(@ModelAttribute("timeData") TimeData timeData, BindingResult bindingResult) {
    @PostMapping("save")
    public ModelAndView saveTimeData(@ModelAttribute("timeData") TimeData timeData) {
        //-сохраняем данные из формы в БД через DAO-объект
        timeDataRepository.save(timeData);
        //-возвращаем Вид в который хотим перейти после сохранения
        return new ModelAndView("redirect:editusersdays");
    }


    //--УДАЛЕНИЕ ЗАПИСЕЙ------------------------------------------------------------------------------------------------
    //--РАБОТАЕТ
    //  *2021.05.12 15:53
    @GetMapping("delete")
    public ModelAndView deleteTimeData(@RequestParam(value = "id", required = false) Long id) {
        //-находим объект в БД
        TimeData timeData = timeDataRepository.findById(id).get();
        //-удаляем записи об объекте из БД по ID
        timeDataRepository.delete(timeData);
        //-возвращаем Вид в который хотим перейти после сохранения
        return new ModelAndView("redirect:editusersdays");
    }


    //--ДОБАВЛЕНИЕ НОВЫХ ЗАПИСЕЙ----------------------------------------------------------------------------------------

    //=РАБОТАЕТ
    // *2021.05.12 18:35
    @GetMapping("new")
    public ModelAndView showFormTimeDataNew(@ModelAttribute("timeData") TimeData timeData) {

        ModelAndView mv = new ModelAndView();
        mv.setViewName("timedata/formTDataNew");
        return mv;
    }


    //--ТЕСТЫ-----------------------------------------------------------------------------------------------------------

    //=РАБОТАЕТ
    //=Выводим 1 запись из TIMEDATA по ID записи переданному как параметр в HTTP GET-запросе
    // http://localhost:8080/timesheet/timedata/getrecord?id=1
    //@RequestMapping("/timedata/getrecord")
    @RequestMapping("getrecord")
    public ModelAndView getSingleRecord(@RequestParam(value = "id", required = true) Long id) {

        TimeData singleTimeData = timeDataRepository.findTDById(id);

        ModelAndView mv = new ModelAndView();
        mv.addObject("singleTimeData", singleTimeData);
        mv.setViewName("tests/testSingleTimeData");

        return mv;
    }

    //=РАБОТАЕТ
    //=Выводим ВСЕ записи из TIMEDATA (все сотрудники и все даты)
    // http://localhost:8080/timesheet/timedata/getrecords
    //@RequestMapping("/timedata/getrecords")
    @RequestMapping("getrecords")
    public ModelAndView getAllRecords() {

        //-метод findAll() возвращает массив данных Типа TimeData,
        // который перед добавлением в Коллекцию необходимо привести
        // к Типу Коллекции параметризованной типом TimeData
        Collection<TimeData> multiTimeData = (Collection<TimeData>) timeDataRepository.findAll();

        ModelAndView mv = new ModelAndView();
        mv.addObject("multiTimeData", multiTimeData);
        mv.setViewName("tests/testMultiTimeData");

        return mv;
    }

    //=РАБОТАЛО до изменения типа поля DATE в TimeData.java
    //=1 запись --СТАТИЧЕСКИЕ ДАННЫЕ
    // http://localhost:8080/timesheet/timedata/userdaydata
    //@RequestMapping("/timedata/userdaydata")
    /*
    @RequestMapping("userdaydata")
    public ModelAndView userDayTData() {

        TimeData userDayData = new TimeData();

        userDayData.setId(1L);
        userDayData.setUserId(1001L);
        userDayData.setHour(8);
        userDayData.setType(TimeDataType.PRESENT.getCode());
        userDayData.setDate(LocalDate.of(2021, 1, 4));

        ModelAndView mv = new ModelAndView();

        //--слева указывается имя которое будет доступно во View в JSP файле при выводе данных
        //  справа - имя Объекта который будет связан с этим именем (они не обязательно должны совпадать)
        mv.addObject("userDayData", userDayData);
        mv.setViewName("tests/testUserDayData");

        return mv;
    }
    */


    //=РАБОТАЕТ
    //=1 запись --ДИНАМИЧЕСКИЕ ДАННЫЕ
    // http://localhost:8080/timesheet/timedata/getuserday?userId=1&date=2021-03-01
    @GetMapping("getuserday")
    public ModelAndView getUserDayData(@RequestParam(value = "userId", required = true) Long userId,
                                      @RequestParam(value = "date", required = true)
                                      @DateTimeFormat(pattern = "yyyy-MM-dd") String date) {
                                    //@DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date) {

        TimeData userDayData = timeDataRepository.findByUserIdAndDate(userId, date);

        ModelAndView mv = new ModelAndView();
        mv.addObject("userDayData", userDayData);
        mv.setViewName("tests/testUserDayData");

        return mv;
    }

    //=РАБОТАЛО до изменения типа поля DATE в TimeData.java
    //=Выводим несколько записей --СТАТИЧЕСКИЕ ДАННЫЕ
    // http://localhost:8080/timesheet/timedata/usermonthdata
    //@RequestMapping("/timedata/usermonthdata")
    /*
    @RequestMapping("usermonthdata")
    public ModelAndView userMonthTData() {

        Long timeDataId = 1L;
        Long userId = 1001L;
        Collection<TimeData> userMonthData = new LinkedList<>();

        //--день 01.04.2021
        TimeData userDayData = new TimeData();
        userDayData.setId(timeDataId++);
        userDayData.setUserId(userId);
        userDayData.setHour(8);
        userDayData.setType(TimeDataType.PRESENT.getCode());
        userDayData.setDate(LocalDate.of(2021, 4, 1));
        userMonthData.add(userDayData);

        //--день 02.04.2021
        userDayData = new TimeData();
        userDayData.setId(timeDataId++);
        userDayData.setUserId(userId);
        userDayData.setHour(8);
        userDayData.setType(TimeDataType.PRESENT.getCode());
        userDayData.setDate(LocalDate.of(2021, 4, 2));
        userMonthData.add(userDayData);

        //--день 03.04.2021
        userDayData = new TimeData();
        userDayData.setId(timeDataId++);
        userDayData.setUserId(userId);
        userDayData.setHour(0);
        userDayData.setType(TimeDataType.HOLIDAY.getCode());
        userDayData.setDate(LocalDate.of(2021, 4, 3));
        userMonthData.add(userDayData);

        //--день 04.04.2021
        userDayData = new TimeData();
        userDayData.setId(timeDataId++);
        userDayData.setUserId(userId);
        userDayData.setHour(0);
        userDayData.setType(TimeDataType.HOLIDAY.getCode());
        userDayData.setDate(LocalDate.of(2021, 4, 4));
        userMonthData.add(userDayData);

        ModelAndView mv = new ModelAndView();

        //--слева указывается имя которое будет доступно во View в JSP файле при выводе данных
        //  справа - имя Объекта который будет связан с этим именем (они не обязательно должны совпадать)
        mv.addObject("userMonthData", userMonthData);
        mv.setViewName("tests/testUserMonthData");

        return mv;
    }
     */

}
