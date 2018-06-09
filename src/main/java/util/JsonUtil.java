package util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.*;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import entity.Good;
import entity.Shop;


public class JsonUtil {

    public static String toJsonString(List list){
        Map<String , Object > map=new HashMap<String, Object>();
        map.put("code", "0");
        map.put("msg", "");
        map.put("count", ""+list.size());
        Object object=JSON.toJSON(list);
        map.put("data", object);
        String ans=JSON.toJSONString(map);
        return ans;
    }
    public static List<Good> ToLists(String json){
        List<Good> goodList= JSON.parseArray(json,Good.class);
        return goodList;
    }
    public static List<Shop> ToShopLists(String json){
        List<Shop> shopList= JSON.parseArray(json,Shop.class);
        return shopList;
    }



}
