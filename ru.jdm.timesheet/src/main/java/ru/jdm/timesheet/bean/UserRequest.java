package ru.jdm.timesheet.bean;

import lombok.Data;


//POJO Класс
@Data
public class UserRequest {
    private Long userId;
    private String login;
    private String name;
    private String surname;
}
