package com.netease.jiumu.app.category.dto;

/**
 * Created by hzhedongyu on 2016/1/5.
 */
public class CategoryTreeDto {
    private Long id;
    private String name;
    private Long parentId;
    private boolean open;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public boolean isOpen() {
        return open;
    }

    public void setOpen(boolean open) {
        this.open = open;
    }
}
