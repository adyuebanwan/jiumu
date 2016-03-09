package com.netease.jiumu.app.online.dto;

import java.io.Serializable;

/**
 * Created by www.magicalcoder.com on 2015/6/23.
 * 799374340@qq.com
 */
public class OnlineUserDto implements Serializable{

    private Long id;
    private String nickName;
    private String province;
    private String city;
    private int gender;
    private String smallLogoUrl;
    private String middleLogoUrl;
    private String largeLogoUrl;
    private String birthday;

    public OnlineUserDto() {
    }

    public OnlineUserDto(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getSmallLogoUrl() {
        return smallLogoUrl;
    }

    public void setSmallLogoUrl(String smallLogoUrl) {
        this.smallLogoUrl = smallLogoUrl;
    }

    public String getMiddleLogoUrl() {
        return middleLogoUrl;
    }

    public void setMiddleLogoUrl(String middleLogoUrl) {
        this.middleLogoUrl = middleLogoUrl;
    }

    public String getLargeLogoUrl() {
        return largeLogoUrl;
    }

    public void setLargeLogoUrl(String largeLogoUrl) {
        this.largeLogoUrl = largeLogoUrl;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
