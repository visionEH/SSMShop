package mapper;

import entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.ResultMap;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserMapper {

    @Select("select * from user where username=#{username} and password=#{password}")
    public User findUser(User user);
    @Insert("insert into user(username,password,name,type) values(#{username},#{password},#{name},'shop')")
    public int addUser(User user);
    @Select("select * from user where id=#{id}")
    public User findUserById(int id);




}
