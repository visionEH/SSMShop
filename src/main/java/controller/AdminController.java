package controller;

import com.alibaba.fastjson.JSON;
import entity.Classify;
import entity.Good;
import entity.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.ClassifyService;
import service.GoodService;
import service.OrderService;
import util.JsonUtil;

import javax.servlet.http.HttpServletRequest;
import javax.xml.transform.Result;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Admin")
public class AdminController {


    @Autowired
    public GoodService goodService;
    @Autowired
    public ClassifyService classifyService;
    @Autowired
    public OrderService orderService;

    @Autowired
    public HttpServletRequest request;

    @RequestMapping("/")
    public String index(){
        return "page/admin/index";
    }

    @RequestMapping("/goodList")
    public String goodlist(){
        return "page/admin/goodList";
    }

    @RequestMapping("/addGood")
    public String addGood(){
        return "page/admin/addGood";
    }

    @RequestMapping("/editGood")
    public String editGood(){
        return "page/admin/updateGood";
    }


    @RequestMapping(value = "/good/show",method = RequestMethod.POST)
    @ResponseBody
    public String good(){
        return JsonUtil.toJsonString(goodService.showAllGoods());
    }

    @RequestMapping(value = "/good/delete",method = RequestMethod.POST)
    @ResponseBody
    public String deleteGood(String id){
           int _id=Integer.parseInt(id);
           int ans=goodService.delete(_id);
           if(ans==1){
               return "success";
           }else{
               return "error";
           }
    }

    @RequestMapping(value = "/good/add",method = RequestMethod.POST)
    public String addGood(Good good,RedirectAttributes redirect){
         int ans=goodService.addGood(good);
         if(ans==1){
             redirect.addAttribute("msg","success");

             return "page/admin/goodList";
            /* return  "redirect:/Admin/";*/
         }else{
             redirect.addAttribute("msg","error");
             /*return  "redirect:/Admin/addGood";*/
             return "page/admin/addGood";
         }
    }

    @RequestMapping(value = "/good/update",method = RequestMethod.POST)
    public String updateGood(Good good,RedirectAttributes redirect){
        int ans=goodService.update(good);
        if(ans==1){
            redirect.addAttribute("msg","success");
            return  "redirect:/Admin/";
        }else{
            redirect.addAttribute("msg","error");
            return  "redirect:/Admin/editGood";
        }
    }

    @RequestMapping("/classify")
    public String  showClassify(){
        return "page/admin/classifyIndex";
    }

    @RequestMapping(value = "/classify/show",method = RequestMethod.POST)
    @ResponseBody
    public String getAllClassify(){
         return   classifyService.showAllClassify();
    }

    @RequestMapping("/classify/add")
    public String addClassify(){
        return "page/admin/addGood";
    }

    @RequestMapping(value = "/classify/add",method = RequestMethod.POST)
    public String addClassify(Classify classify,RedirectAttributes redirect){
        int ans=classifyService.addClassify(classify);
        if(ans==1){
            redirect.addAttribute("msg","success");
            return  "redirect:/Admin/classify";
        }else{
            redirect.addAttribute("msg","error");
            return  "redirect:/Admin/classify/add";
        }
    }


    @RequestMapping(value = "/classify/delete",method = RequestMethod.POST)
    @ResponseBody
    public String deleteClassify(int id){
           if(classifyService.delete(id)==0){
               return "error";
           }else{
               return "success";
           }
    }


    @RequestMapping(value = "/order")
    public String order(){
        return "/page/admin/orderIndex";
    }

    @RequestMapping(value = "/order/get",method = RequestMethod.POST)
    @ResponseBody
    public String orderShow(){
       List<Order> orders= orderService.getAllOrders();
       return JsonUtil.toJsonString(orders);
    }
    @RequestMapping(value = "/order/delete")
    @ResponseBody
    public String orderDelete(int userId,int goodId){
             if(orderService.delete(userId,goodId)==1){
                 return "success";
             }else{
                 return "error";
             }
    }


    @RequestMapping(value = "/upload/img",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadImg(HttpServletRequest request, @RequestParam("file") MultipartFile file) throws IOException {
//如果文件内容不为空，则写入上传路径
        if (!file.isEmpty()) {
            //上传文件路径
            String path =request.getServletContext().getRealPath("/images/") ;
            System.out.println("文件名称"+file.getOriginalFilename());
            //上传文件名
            String filename = file.getOriginalFilename();
            File filepath = new File(path, filename);
            //判断路径是否存在，没有就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文档中
            File file1 = new File(path + File.separator + filename);
            if(!file1.exists()){
                file.transferTo(file1);
            }
            Map<String, Object> res = new HashMap<>();
            //返回的是一个url对象
            res.put("url", file1);
            return res;
        } else {
            return new HashMap<>();
        }

    }


}
