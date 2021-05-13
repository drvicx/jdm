package ru.jdm.timesheet.entity;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;
import javax.persistence.GenerationType;
import javax.persistence.GeneratedValue;
import javax.persistence.Column;

import java.time.LocalDate;


@NoArgsConstructor
@Data
@Entity
@Table(name="TIMEDATA")
public class TimeData {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="ID")
    private Long id;

    @Column(name="USERID")
    private Long userId;

    @Column(name="HOUR")
    private Integer hour;

    @Column(name="TYPE_")
    private String type;

    //private TimeDataType type;

    //@Column(name="DATE")
    //private LocalDate date;

    @Column(name="DATE")
    private String date;
}
