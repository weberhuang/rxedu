package com.wja.edu.dao;

import org.springframework.stereotype.Repository;

import com.wja.base.common.CommRepository;
import com.wja.edu.entity.WeeklyReport;

@Repository
public interface WeeklyReportDao extends CommRepository<WeeklyReport, String> {

    WeeklyReport findByTitle(String title);
    

}
