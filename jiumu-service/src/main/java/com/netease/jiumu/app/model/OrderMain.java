package com.netease.jiumu.app.model;

import java.math.BigDecimal;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
* Created by hedongyu.
* 799374340@qq.com
*/
public class OrderMain{

    private Long id;//订单号
    private BigDecimal account;//订单总额
    private BigDecimal realPay;//客户实付金额
    private String buyerName;//购货单位
    private String buyerAdress;//地址
    private String buyerPhone;//电话
    @DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss" )
    private Date createTime;//下单日期
    @DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss" )
    private Date updateTime;//更新日期
    private String operator;//操作人
    private Integer orderStatus;//订单状态

    public Long getId(){
        return id;
    }
    public BigDecimal getAccount(){
        return account;
    }
    public BigDecimal getRealPay(){
        return realPay;
    }
    public String getBuyerName(){
        return buyerName;
    }
    public String getBuyerAdress(){
        return buyerAdress;
    }
    public String getBuyerPhone(){
        return buyerPhone;
    }
    public Date getCreateTime(){
        return createTime;
    }
    public Date getUpdateTime(){
        return updateTime;
    }
    public String getOperator(){
        return operator;
    }
    public Integer getOrderStatus(){
        return orderStatus;
    }
    public void setId(Long id){
        this.id = id;
    }
    public void setAccount(BigDecimal account){
        this.account = account;
    }
    public void setRealPay(BigDecimal realPay){
        this.realPay = realPay;
    }
    public void setBuyerName(String buyerName){
        this.buyerName = buyerName;
    }
    public void setBuyerAdress(String buyerAdress){
        this.buyerAdress = buyerAdress;
    }
    public void setBuyerPhone(String buyerPhone){
        this.buyerPhone = buyerPhone;
    }
    public void setCreateTime(Date createTime){
        this.createTime = createTime;
    }
    public void setUpdateTime(Date updateTime){
        this.updateTime = updateTime;
    }
    public void setOperator(String operator){
        this.operator = operator;
    }
    public void setOrderStatus(Integer orderStatus){
        this.orderStatus = orderStatus;
    }

}
