package com.netease.jiumu.app.model;


/**
* Created by hedongyu.
* 799374340@qq.com
*/
public class Category{

    private Long id;//主键
    private String name;//分类名称
    private Long parentId;//父亲节点ID
    private Integer sortNum;//排序从小到大

    public Long getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public Long getParentId(){
        return parentId;
    }
    public Integer getSortNum(){
        return sortNum;
    }
    public void setId(Long id){
        this.id = id;
    }
    public void setName(String name){
        this.name = name;
    }
    public void setParentId(Long parentId){
        this.parentId = parentId;
    }
    public void setSortNum(Integer sortNum){
        this.sortNum = sortNum;
    }

}
