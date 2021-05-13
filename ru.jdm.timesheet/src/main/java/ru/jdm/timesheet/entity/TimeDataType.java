package ru.jdm.timesheet.entity;


public enum TimeDataType {
    PRESENT("Я"),               //явка в рабочее время;
    WORK("Р"),                  //работа в праздник или выходной;
    HOLIDAY("В"),               //выходной | не рабочее время;
    VACATION("О"),              //отпуск;
    SICK("Б"),                  //больничный;
    CHILD("ДО"),                //декретный отпуск;
    SKIPPED("ПР");              //прогул;

    private String code;

    TimeDataType(String code) {
        this.code = code;
    }

    public String getCode() {
        return this.code;
    }
}
