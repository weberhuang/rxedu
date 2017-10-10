package com.wja.edu.dao;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.wja.base.common.CommRepository;
import com.wja.edu.entity.Teacher;

@Repository
public interface TeacherDao extends CommRepository<Teacher, String>
{
    Teacher findByUserId(String userId);
    
    @Modifying
    @Query("update Teacher u set u.valid = 0 where u.userId = ?1 ")
    void logicDeleteByUserId(String userId);
}
