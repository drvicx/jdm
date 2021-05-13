package ru.jdm.timesheet.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import ru.jdm.timesheet.entity.TimeData;

import java.time.LocalDate;
import java.util.Collection;

//DAO OBJECTS
@Repository
public interface TimeDataRepository extends CrudRepository<TimeData, Long> {

    //-с типом LocalDate была проблема т.к дата в БД хранится в формате литерала "yyyy-mm-dd"
    //TimeData findByUserIdAndDate(Long userId, LocalDate date);

    //-и пришлось изменить тип на String
    TimeData findByUserIdAndDate(Long userId, String date);
    TimeData findTDById(Long id);

    //-НЕ_ПРАВИЛЬНО: возвращается набор данных, а не единичный объект
    //TimeData findByUserId(Long userId);

    //-ПРАВИЛЬНО
    Collection<TimeData> findByUserId(Long userId);
}
