package controller;

import com.sun.org.apache.xml.internal.resolver.helpers.PublicId;
import entity.Order;
import entity.Shop;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.GoodService;
import service.OrderService;
import service.ShopService;
import sun.util.locale.provider.FallbackLocaleProviderAdapter;
import util.JsonUtil;

import javax.jws.soap.SOAPBinding;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("/")
public class IndexController {


    @Autowired
    public ShopService shopService;
    @Autowired
    public GoodService goodService;
    @Autowired
    public OrderService orderService;
    @Autowired
    public HttpSession session;



    @RequestMapping("/")
    public String layout(){
        return "index";
    }
    @RequestMapping("/top")
    public String top(){
        return "page/top";
    }


    @RequestMapping("/good")
    public ModelAndView goodlist(RedirectAttributes redirect){
        ModelAndView view=new ModelAndView();
        view.addObject("goodlist",goodService.showAllGoods());
        view.setViewName("page/goodIndex");
        return view;
    }
    @RequestMapping("/good/detail{id}")
    public ModelAndView goodDetail(@PathVariable String id){
        ModelAndView view=new ModelAndView();
        view.addObject("goodlist",goodService.showAllGoods());
        view.setViewName("page/goodIndex");
        return view;
    }

    @RequestMapping(value = "/shop/get",method = RequestMethod.POST)
    @ResponseBody
    public String getShop(){
        User user= (User) session.getAttribute("user");
        if(user.getShops()==null){
            user.setShops(shopService.getShopByUserId(user.getId()));
        }
        return JsonUtil.toJsonString(user.getShops());
    }
    @RequestMapping(value = "/shop")
    public String shop(){
        return "page/shop";
    }


    @RequestMapping(value = "/shop/add",method = RequestMethod.POST)
    @ResponseBody
    public String addShop(int goodId){
        System.out.print("11100");
        User user=(User) session.getAttribute("user");
        Shop shop=new Shop();
        shop.setGoodId(goodId);
        shop.setUserId(user.getId());
        shop.setNumber(1);
        if(shopService.IsExist(shop)){
            return "exist";
        }
        int ans=shopService.add(shop);
        if(ans==1){
            update();
            return "success";
        }else{
            return "error";
        }
    }

    @RequestMapping(value = "/shop/update",method = RequestMethod.POST)
    @ResponseBody
    public String updateShop(Shop shop){
        int ans=shopService.update(shop);
        if(ans==1){
            update();
            return "success";
        }else{
            return "error";
        }
    }
    @RequestMapping(value = "/shop/order",method = RequestMethod.POST)
    @ResponseBody
    public String addOrders(String lists){
        //添加订单，并删除购物车中的商品记录
         List<Shop> shopList= JsonUtil.ToShopLists(lists);
         int ans=1;
         for(int i=0;i<shopList.size();i++){
             ans*=addOrder(shopList.get(i));
         }
         if(ans==1){
             return "success";
         }else{
             return "error";
         }
    }
    @Transactional
    public int addOrder(Shop shop){
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString =format.format(date);
        Order order=new Order();
        order.setGoodId(shop.getGoodId());
        order.setIsDistributed(0);
        order.setNumber(shop.getNumber());
        order.setUserId(shop.getUserId());
        order.setOrderId(""+shop.getUserId()+shop.getNumber()+shop.getGoodId()+date.getTime());
        order.setPrice(shop.getNumber()*shop.getGood().getPrice());
        order.setDate(dateString);
        int ans= orderService.add(order);
        ans*=shopService.delete(shop);
        update();
        return ans;
    }

    public void update(){
        User user= (User) session.getAttribute("user");
        if(user.getShops()!=null){
            user.setShops(shopService.getShopByUserId(user.getId()));
        }
    }
    @RequestMapping("/message")
    public String message(){
        return "page/message";
    }


    @RequestMapping(value = "/order/get",method = RequestMethod.POST)
    @ResponseBody
    public String orderShow(){
        User user= (User) session.getAttribute("user");
        return JsonUtil.toJsonString(orderService.getAllUserOrder(user.getId()));
    }

    @RequestMapping(value = "/order/delete",method = RequestMethod.POST)
    public String deleteOrder(){
            return "sss";
    }


}
