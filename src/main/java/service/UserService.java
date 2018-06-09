package service;

import entity.User;
import mapper.IUserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserService {

    public IUserMapper userMapper;

    @Autowired
    public UserService(IUserMapper userMapper) {
        this.userMapper = userMapper;
    }


    public User login(User user){
        return userMapper.findUser(user);
    }

     //增删改的操作加上事务回滚
    @Transactional
    public boolean register(User user){
        int res=userMapper.addUser(user);
        if(res==1){
            return true;
        }else{
            return false;
        }
    }
}
