package com.wja.edu.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

import com.wja.base.common.CommConstants;
import com.wja.base.common.CommEntity;

/**
 * @ClassName Enterprise
 * @Description TODO(就业企业实体类)
 * @author huangxingbo
 * @Date 2017年9月6日 下午9:37:44
 * @version 1.0.0
 */

@Entity
@Table(name = "t_enterprise_info")
@Where(clause = " valid = " + CommConstants.DATA_VALID)
public class Enterprise extends CommEntity {

    // 企业简称
    @Column(name = "enterprise_name_short", length = 30)
    private String enterpriseNameShort;

    // 企业全称
    @Column(name = "enterprise_name_full", length = 80)
    private String enterpriseNameFull;

    // 企业规模
    @Column(length = 10)
    private String scale;

    // 注册地址
    @Column(name = "registered_address", length = 30)
    private String registeredAddress;

    // 企业法人
    @Column(name = "legal_person", length = 30)
    private String legalPerson;

    // 注册资本
    @Column(name = "registered_capital", length = 20)
    private String registeredCapital;

    public String getEnterpriseNameShort() {
        return enterpriseNameShort;
    }

    public void setEnterpriseNameShort(String enterpriseNameShort) {
        this.enterpriseNameShort = enterpriseNameShort;
    }

    public String getEnterpriseNameFull() {
        return enterpriseNameFull;
    }

    public void setEnterpriseNameFull(String enterpriseNameFull) {
        this.enterpriseNameFull = enterpriseNameFull;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public String getRegisteredAddress() {
        return registeredAddress;
    }

    public void setRegisteredAddress(String registeredAddress) {
        this.registeredAddress = registeredAddress;
    }

    public String getLegalPerson() {
        return legalPerson;
    }

    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson;
    }

    public String getRegisteredCapital() {
        return registeredCapital;
    }

    public void setRegisteredCapital(String registeredCapital) {
        this.registeredCapital = registeredCapital;
    }

}
