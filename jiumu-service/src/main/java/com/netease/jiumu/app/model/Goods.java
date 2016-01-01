package com.netease.jiumu.app.model;

import java.math.BigDecimal;
import java.util.Date;
import org.springframework.format.annotation.DateTimeFormat;

/**
* Created by hedongyu.
* 799374340@qq.com
*/
public class Goods{

    private Long id;//主键
    private String name;//商品名称
    private String serialNum;//商品编号
    private Integer publishStatus;//发布状态
    private BigDecimal marketPrice;//市场价格
    private BigDecimal sellPrice;//销售价格
    private BigDecimal buyPrice;//进货价格
    private String smallPic;//商品小图
    private String bigPic;//商品大图
    private Integer storeNum;//库存数量
    private Long oneCategoryId;//商品一级分类
    private Long twoCategoryId;//商品二级分类
    private Long threeCategoryId;//商品三级分类
    private String guigeOne;//商品规格一
    private String guigeTwo;//商品规格二
    private String guigeThree;//商品规格三
    private String guigeFour;//商品规格四
    private String danwei;//单位
    private String biaohao;//产品标号
    private String createDay;//生产日期
    private String fixDay;//保质期
    private String createPlace;//产地
    private String factory;//厂家
    private String goodDesc;//详细描述
    private String operator;//操作人
    @DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss" )
    private Date createTime;//创建日期
    @DateTimeFormat( pattern = "yyyy-MM-dd HH:mm:ss" )
    private Date updateTime;//更改日期
    private Integer top;//是否推荐到首页

    public Long getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public String getSerialNum(){
        return serialNum;
    }
    public Integer getPublishStatus(){
        return publishStatus;
    }
    public BigDecimal getMarketPrice(){
        return marketPrice;
    }
    public BigDecimal getSellPrice(){
        return sellPrice;
    }
    public BigDecimal getBuyPrice(){
        return buyPrice;
    }
    public String getSmallPic(){
        return smallPic;
    }
    public String getBigPic(){
        return bigPic;
    }
    public Integer getStoreNum(){
        return storeNum;
    }
    public Long getOneCategoryId(){
        return oneCategoryId;
    }
    public Long getTwoCategoryId(){
        return twoCategoryId;
    }
    public Long getThreeCategoryId(){
        return threeCategoryId;
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
    public String getDanwei(){
        return danwei;
    }
    public String getBiaohao(){
        return biaohao;
    }
    public String getCreateDay(){
        return createDay;
    }
    public String getFixDay(){
        return fixDay;
    }
    public String getCreatePlace(){
        return createPlace;
    }
    public String getFactory(){
        return factory;
    }
    public String getGoodDesc(){
        return goodDesc;
    }
    public String getOperator(){
        return operator;
    }
    public Date getCreateTime(){
        return createTime;
    }
    public Date getUpdateTime(){
        return updateTime;
    }
    public Integer getTop(){
        return top;
    }
    public void setId(Long id){
        this.id = id;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setSerialNum(String serialNum){
        this.serialNum = serialNum;
    }
    public void setPublishStatus(Integer publishStatus){
        this.publishStatus = publishStatus;
    }
    public void setMarketPrice(BigDecimal marketPrice){
        this.marketPrice = marketPrice;
    }
    public void setSellPrice(BigDecimal sellPrice){
        this.sellPrice = sellPrice;
    }
    public void setBuyPrice(BigDecimal buyPrice){
        this.buyPrice = buyPrice;
    }
    public void setSmallPic(String smallPic){
        this.smallPic = smallPic;
    }
    public void setBigPic(String bigPic){
        this.bigPic = bigPic;
    }
    public void setStoreNum(Integer storeNum){
        this.storeNum = storeNum;
    }
    public void setOneCategoryId(Long oneCategoryId){
        this.oneCategoryId = oneCategoryId;
    }
    public void setTwoCategoryId(Long twoCategoryId){
        this.twoCategoryId = twoCategoryId;
    }
    public void setThreeCategoryId(Long threeCategoryId){
        this.threeCategoryId = threeCategoryId;
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
    public void setDanwei(String danwei){
        this.danwei = danwei;
    }
    public void setBiaohao(String biaohao){
        this.biaohao = biaohao;
    }
    public void setCreateDay(String createDay){
        this.createDay = createDay;
    }
    public void setFixDay(String fixDay){
        this.fixDay = fixDay;
    }
    public void setCreatePlace(String createPlace){
        this.createPlace = createPlace;
    }
    public void setFactory(String factory){
        this.factory = factory;
    }
    public void setGoodDesc(String goodDesc){
        this.goodDesc = goodDesc;
    }
    public void setOperator(String operator){
        this.operator = operator;
    }
    public void setCreateTime(Date createTime){
        this.createTime = createTime;
    }
    public void setUpdateTime(Date updateTime){
        this.updateTime = updateTime;
    }
    public void setTop(Integer top){
        this.top = top;
    }

}
