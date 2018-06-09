package controller;

import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.UserService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("Account")
public class AccountController {

    @Autowired
    public UserService userService;
    @Autowired
    public HttpSession session;
    @RequestMapping("/login")
    public String login(){
        return "page/login";
    }
    @RequestMapping("/register")
    public String register(){
        return "page/register";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(User user, RedirectAttributes redirect ){
             User u=userService.login(user);
             if(u==null){//登录失败
                 redirect.addFlashAttribute("msg","用户名或密码错误");
                 redirect.addAttribute("msg","error");
                 return  "redirect:/Account/login";
             }else{
                 //返回index首页
                 session.setAttribute("user",u);
                 if(u.getIsAdmin()==1){
                     return "redirect:/Admin/";
                 }else{
                     return "redirect:/";
                 }
             }
    }
    @RequestMapping(value = "/register",method = RequestMethod.POST )
    public String register(User user, RedirectAttributes redirect){
          //默认情况下不能注册管理员
           user.setIsAdmin(0);
           boolean ans=userService.register(user);
           if(ans){
               session.setAttribute("user",user);
               return "redirect:/";
           }else{
               redirect.addFlashAttribute("msg","注册失败");
               return  "redirect:/Account/register";
           }
    }
    @RequestMapping("/logout")
    public String logout( RedirectAttributes redirect){
        session.setAttribute("user",null);
        return  "redirect:/Account/login";
    }
}
