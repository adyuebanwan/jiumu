package com.netease.jiumu.app.utils;

import com.netease.jiumu.app.category.dto.CategoryListDto;
import com.netease.jiumu.app.category.service.CategoryService;
import com.netease.jiumu.app.model.Category;
import com.netease.worldhero.core.common.utils.MapUtil;
import com.netease.worldhero.core.common.utils.MapUtils;
import com.netease.worldhero.core.spring.SpringContainer;
import org.springframework.ui.ModelMap;

import java.util.List;
import java.util.Map;

/**
 * Created by hedongyu on 2015/5/22.
 * 799374340@qq.com
 */
public class ProjectUtil {
    public static Map<String,Object> buildMap(String key,Object value ,Object... args){
        return MapUtils.buildMap(key, value, args);
    }

    public static void commonModel(ModelMap model){
        CategoryService categoryService = SpringContainer.getBean("categoryService",CategoryService.class);
        List<CategoryListDto> categoryListDtoList = categoryService.list();
        model.addAttribute("categoryDtoList",categoryListDtoList);
        model.addAttribute("categoryList",categoryService.getCategoryList(MapUtil.buildMap("parentId",0L)));
    }

    private static final String UNIT = "万千佰拾亿千佰拾万千佰拾元角分";
    private static final String DIGIT = "零壹贰叁肆伍陆柒捌玖";
    private static final double MAX_VALUE = 9999999999999.99D;
    public static String moneyUpper(double v) {
        if (v < 0 || v > MAX_VALUE){
            return "参数非法!";
        }
        long l = Math.round(v * 100);
        if (l == 0){
            return "零元整";
        }
        String strValue = l + "";
        // i用来控制数
        int i = 0;
        // j用来控制单位
        int j = UNIT.length() - strValue.length();
        String rs = "";
        boolean isZero = false;
        for (; i < strValue.length(); i++, j++) {
            char ch = strValue.charAt(i);
            if (ch == '0') {
                isZero = true;
                if (UNIT.charAt(j) == '亿' || UNIT.charAt(j) == '万' || UNIT.charAt(j) == '元') {
                    rs = rs + UNIT.charAt(j);
                    isZero = false;
                }
            } else {
                if (isZero) {
                    rs = rs + "零";
                    isZero = false;
                }
                rs = rs + DIGIT.charAt(ch - '0') + UNIT.charAt(j);
            }
        }
        if (!rs.endsWith("分")) {
            rs = rs + "整";
        }
        rs = rs.replaceAll("亿万", "亿");
        return rs;
    }

    public static void main(String[] args){
        System.out.println(moneyUpper(199.10));
    }
}
