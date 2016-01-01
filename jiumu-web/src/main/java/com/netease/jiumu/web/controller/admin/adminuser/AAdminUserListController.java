package com.netease.jiumu.web.controller.admin.adminuser;
import com.netease.jiumu.app.adminuser.AAdminUserConstant;
import com.netease.jiumu.app.adminuser.service.AAdminUserService;
import com.netease.jiumu.app.model.AAdminUser;
import com.netease.jiumu.app.utils.ProjectUtil;
import com.netease.permission.app.dto.AdminUserContextDto;
import com.netease.permission.app.utils.AdminUserContext;
import com.netease.worldhero.core.common.dto.AjaxData;
import com.netease.worldhero.core.common.utils.StringUtils;
import com.netease.worldhero.core.common.utils.copy.Copyer;
import com.netease.worldhero.core.common.utils.date.DateFormatUtils;
import com.netease.worldhero.core.spring.admin.AdminLoginController;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/**
 * Created by hedongyu on 2015/4/29.
 * 799374340@qq.com
 */
@RequestMapping(value = "/admin/aAdminUser")
@Controller
public class AAdminUserListController extends AdminLoginController {
    @Resource(name="aAdminUserService")
    private AAdminUserService aAdminUserService;
    @RequestMapping(value = "list",method = RequestMethod.GET)
    public String list(ModelMap model,HttpServletResponse response){
        return "admin/aAdminUser/aAdminUserList";
    }
    @RequestMapping(value = "page/{pageIndex}/{pageCount}",method = RequestMethod.GET)
    public void page(@PathVariable Integer pageIndex,@PathVariable Integer pageCount ,
                      @RequestParam(required = false,value = "orderBy") String orderBy ,
                      @RequestParam(required = false,value = "userName") String userName ,
                      @RequestParam(required = false,value = "realName") String realName ,
                      @RequestParam(required = false,value = "email") String email ,
                      HttpServletResponse response){
        int idx = (pageIndex-1)* AAdminUserConstant.PAGE_SIZE;
        List<AAdminUser> pageList = aAdminUserService.getAAdminUserList(ProjectUtil.buildMap(
"userName" , userName,"realName" , realName,"email" , email,                "orderBy",orderBy,"limitIndex", idx,"limit", AAdminUserConstant.PAGE_SIZE        ));
        if(pageCount==null || pageCount==0){
            pageCount = aAdminUserService.getAAdminUserListCount(ProjectUtil.buildMap(
"userName" , userName,"realName" , realName,"email" , email            ));
        }
        Map<String,Object> ajaxData = new HashMap<String, Object>();
        ajaxData.put("pageList",pageList);
        ajaxData.put("pageCount",pageCount);
        toJson(response,new AjaxData("ok","success",ajaxData));
    }
    //新增
    @RequestMapping(value = "/detail")
    public String detail(ModelMap model){
        detailDeal(null,model);
        return "admin/aAdminUser/aAdminUserDetail";
    }
    //详情
    @RequestMapping(value = "/detail/{id}")
    public String detailId(@PathVariable Long id,ModelMap model){
        detailDeal(id,model);
        return "admin/aAdminUser/aAdminUserDetail";
    }
    private void detailDeal(Long id,ModelMap model){
        AAdminUser entity = new AAdminUser();
        if(id!=null){
            entity = aAdminUserService.getAAdminUser(id);
        }
        model.addAttribute("aAdminUser",entity);
    }
    //保存
    @RequestMapping(value = "save",method = RequestMethod.POST)
    public String save(@ModelAttribute AAdminUser aAdminUser){
        AdminUserContextDto dto = AdminUserContext.getUserContextDto();
        Integer superAdmin = dto.getAdminUser().getSuperAdmin();
        if(superAdmin!=1 || StringUtils.isBlank(aAdminUser.getPassword())
                ||StringUtils.isBlank(aAdminUser.getUserName())){
            return "redirect:/admin/aAdminUser/list";
        }
        if(aAdminUser.getPassword().trim().length()<6){
            return "redirect:/admin/aAdminUser/list";
        }

        if(aAdminUser.getId()==null){
            aAdminUserService.insertAAdminUser(aAdminUser);
        }else{
            AAdminUser entity = aAdminUserService.getAAdminUser(aAdminUser.getId());
            Copyer.copy(aAdminUser,entity);
            aAdminUserService.updateAAdminUser(entity);
        }
        return "redirect:/admin/aAdminUser/list";
    }
    //删除
    @RequestMapping(value = "/delete/{id}")
    public void delete(@PathVariable Long id,HttpServletResponse response){
        AdminUserContextDto dto = AdminUserContext.getUserContextDto();
        Integer superAdmin = dto.getAdminUser().getSuperAdmin();
        if(superAdmin!=1){
            toJson(response,new AjaxData("error","",""));
            return ;
        }
        aAdminUserService.deleteAAdminUser(id);
        toJson(response,new AjaxData("ok","",""));
    }
}
