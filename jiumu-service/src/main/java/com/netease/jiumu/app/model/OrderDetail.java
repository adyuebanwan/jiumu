package com.netease.jiumu.app.model;

import java.math.BigDecimal;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
* Created by www.magicalcoder.com.
* 799374340@qq.com
*/
public class OrderDetail{

    private Long id;//订单详情ID
    private String goodsSerialNum;//商品编号
    private String goodsName;//商品名称
    private String danwei;//单位
    private Integer buyCount;//购买数量
    private BigDecimal price;//商品单价
    private String mark;//备注
    private String guigeOne;//用户购买的商品规格一
    private String guigeTwo;//用户购买的商品规格二
    private String guigeThree;//用户购买的商品规格三
    private String guigeFour;//用户购买的商品规格四
    private Long orderMainId;//订单ID
    private Long goodsId;//商品ID
    @DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss" )
    private Date createTime;//下单日期
    @DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss" )
    private Date updateTime;//更新日期
    private String operator;//操作人

    public Long getId(){
        return id;
    }
    public String getGoodsSerialNum(){
        return goodsSerialNum;
    }
    public String getGoodsName(){
        return goodsName;
    }
    public String getDanwei(){
        return danwei;
    }
    public Integer getBuyCount(){
        return buyCount;
    }
    public BigDecimal getPrice(){
        return price;
    }
    public String getMark(){
        return mark;
    }
    public String getGuigeOne(){
        return guigeOne;
    }
    public String getGuigeTwo(){
        return guigeTwo;
    }
    public String getGuigeThree(){
        return guigeThree;
    }
    public String getGuigeFour(){
        return guigeFour;
    }
    public Long getOrderMainId(){
        return orderMainId;
    }
    public Long getGoodsId(){
        return goodsId;
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
    public void setId(Long id){
        this.id = id;
    }
    public void setGoodsSerialNum(String goodsSerialNum){
        this.goodsSerialNum = goodsSerialNum;
    }
    public void setGoodsName(String goodsName){
        this.goodsName = goodsName;
    }
    public void setDanwei(String danwei){
        this.danwei = danwei;
    }
    public void setBuyCount(Integer buyCount){
        this.buyCount = buyCount;
    }
    public void setPrice(BigDecimal price){
        this.price = price;
    }
    public void setMark(String mark){
        this.mark = mark;
    }
    public void setGuigeOne(String guigeOne){
        this.guigeOne = guigeOne;
    }
    public void setGuigeTwo(String guigeTwo){
        this.guigeTwo = guigeTwo;
    }
    public void setGuigeThree(String guigeThree){
        this.guigeThree = guigeThree;
    }
    public void setGuigeFour(String guigeFour){
        this.guigeFour = guigeFour;
    }
    public void setOrderMainId(Long orderMainId){
        this.orderMainId = orderMainId;
    }
    public void setGoodsId(Long goodsId){
        this.goodsId = goodsId;
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

}
