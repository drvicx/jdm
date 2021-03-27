package ru.jdm.timesheet.entity;

/**
 *=ПАКЕТ "lombok"
 * - реализует автоматический "Resource Management",
 *   автоматическую генерацию Методов: getters, setters, equals, hashCode, toString, и прочее!
 *   https://projectlombok.org/api/
 *   https://projectlombok.org/setup/maven
 */
import lombok.NoArgsConstructor;
import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.Column;

/**
 *=КЛАСС "Пользователь"
 * - поля класса защищены модификатором доступа private, это значит что:
 *   1. доступ к этим полям может быть только из объектов этого класса;
 *   2. инициализировать и работать с ними можно только через getter/setter методы Класса;
 * - @Data annotation:
 *   Generates getters for all fields, a useful toString method,
 *   and hashCode and equals implementations that check all non-transient fields
 *   https://projectlombok.org/api/lombok/Data.html
 * - @NoArgsConstructor annotation:
 *   Generates a no-args constructor.
 *   Will generate an error message if such a constructor cannot be written due to the existence of final fields.
 *   https://projectlombok.org/api/lombok/NoArgsConstructor.html
 */
@NoArgsConstructor
@Data
@Entity
@Table(name="USER")
public class User {
    @Id
    @Column(name="ID")
    private Long userId;
    @Column(name="LOGIN")
    private String login;
    @Column(name="NAME")
    private String name;
    @Column(name="SURNAME")
    private String surname;
}
