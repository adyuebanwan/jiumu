package com.netease.jiumu.web.controller.admin.category;

import com.netease.jiumu.app.category.dto.CategoryTreeDto;
import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.model.Category;
import com.netease.jiumu.app.utils.ProjectUtil;
import com.netease.worldhero.core.common.utils.ListUtils;
import com.netease.worldhero.core.common.utils.StringUtils;
import com.netease.worldhero.core.common.dto.AjaxData;
import com.netease.worldhero.core.common.utils.copy.Copyer;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping({"/admin/category/"})
@Controller
public class AdminCategoryListController extends AdminLoginController
{

  @Resource(name="categoryService")
  private CategoryService categoryService;

  @RequestMapping(value = "tree")
  public String tree(){


    return "admin/category/categoryTree";
  }
  @RequestMapping(value={"init_node"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void initNode(HttpServletResponse response){
      List<Category> categoryList = categoryService.getCategoryList(null);
      List<CategoryTreeDto> list = new ArrayList<CategoryTreeDto>();
      CategoryTreeDto treeDto = new CategoryTreeDto();
      treeDto.setId(0L);
      treeDto.setName("根节点");
      treeDto.setParentId(null);
      treeDto.setOpen(true);
      list.add(treeDto);
      if(ListUtils.isNotBlank(categoryList)){

        for(Category category:categoryList){
          CategoryTreeDto tree = new CategoryTreeDto();
          tree.setId(category.getId());
          tree.setName(category.getName());
          tree.setParentId(category.getParentId());
          tree.setOpen(true);
          list.add(tree);
        }
      }
    toSimpleJson(response, list);
  }

  @RequestMapping(value={"add_node/{parentId}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void addNode(@PathVariable Long parentId,HttpServletResponse response){
      Category category = new Category();
      category.setParentId(parentId);
      category.setName("新节点");
      Long id = categoryService.insertCategory(category);
      toSimpleJson(response, id);
  }

  @RequestMapping(value={"remove_node/{id}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void removeNode(@PathVariable Long id,HttpServletResponse response){
      categoryService.deleteCategory(id);
      toSimpleJson(response,"ok");
  }

  @RequestMapping(value={"rename_node/{id}/{name}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void renameNode(@PathVariable Long id,@PathVariable String name,HttpServletResponse response){
    Category category = categoryService.getCategory(id);
    category.setName(name);
    categoryService.updateCategory(category);
    toSimpleJson(response, "ok");
  }


  @RequestMapping(value={"list"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String list(ModelMap model, HttpServletResponse response)
  {
    return "admin/category/categoryList";
  }

  @RequestMapping(value={"page/{pageIndex}/{pageCount}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public void page(@PathVariable Integer pageIndex, @PathVariable Integer pageCount, @RequestParam(required=false, value="orderBy") String orderBy,
          @RequestParam(required=false, value="name") String name,
HttpServletResponse response)
  {
    int idx = (pageIndex.intValue() - 1) * 20;
    Map<String,Object> query = ProjectUtil.buildMap("orderBy", orderBy, new Object[] {
            "name",name,

  "limitIndex",Integer.valueOf(idx),"limit", Integer.valueOf(20) });
    List pageList = this.categoryService.getCategoryList(query);

    query.remove("orderBy");
    query.remove("limitIndex");
    query.remove("limit");
    if ((pageCount == null) || (pageCount.intValue() == 0)) {
      pageCount = this.categoryService.getCategoryListCount(query);
    }

    Map ajaxData = new HashMap();
    ajaxData.put("pageList", pageList);
    ajaxData.put("pageCount", pageCount);
    toJson(response, new AjaxData("ok", "success", ajaxData));
  }

  @RequestMapping({"/detail"})
  public String detail(ModelMap model) {
    detailDeal(null, model);
    return "admin/category/categoryDetail";
  }

  @RequestMapping({"/detail/{id}"})
  public String detailId(@PathVariable Long id, ModelMap model) {
    detailDeal(id, model);
    return "admin/category/categoryDetail";
  }
  private void detailDeal(Long id, ModelMap model) {
    Category entity = new Category();
    if (id != null) {
      entity = this.categoryService.getCategory(id);
    }
    model.addAttribute("category", entity);
  }

  @RequestMapping(value={"save"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String save(@ModelAttribute Category category) {
    if (category.getId() == null) {
      this.categoryService.insertCategory(category);
    } else {
      Category entity = this.categoryService.getCategory(category.getId());
      Copyer.copy(category, entity);
      this.categoryService.updateCategory(entity);
    }
    return "redirect:/admin/category/list";
  }

  @RequestMapping({"/delete/{id}"})
  public void delete(@PathVariable Long id, HttpServletResponse response) {
    this.categoryService.deleteCategory(id);
    toJson(response, new AjaxData("ok", "", ""));
  }
  @RequestMapping({"/batchdelete/{ids}"})
  public void batchDelete(@PathVariable String ids, HttpServletResponse response) {
    if(StringUtils.isNotBlank(ids)){
        String[] idArr = ids.split(",");
        List<Long> list = new ArrayList<Long>();
        for(String id:idArr){
            if(StringUtils.isNotBlank(id)){
                list.add(Long.valueOf(id));
            }
        }
        if(ListUtils.isNotBlank(list)){
            this.categoryService.batchDeleteCategory(list);
            toJson(response, new AjaxData("ok", "", ""));
        }
    }else{
        toJson(response, new AjaxData("error", "没有要删除的主键", ""));
    }
  }
}