package mapper;

import com.sun.org.apache.regexp.internal.RE;
import entity.Good;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
public interface IGoodMapper {


    @Select("select * from good")
    @Results({
             @Result(id=true,column = "id",property = "id"),
             @Result(column = "name",property = "name"),
             @Result(column = "stock",property = "stock"),
             @Result(column = "price",property = "price"),
             @Result(column = "msg",property = "msg"),
             @Result(column = "classId",property = "classId"),
             @Result(column = "classId",property = "classify",one = @One(
                     select = "mapper.IClassifyMapper.findClassById",fetchType=FetchType.EAGER))
    })
    public List<Good> ShowAllGoods();
    @Insert("insert into good(name,price,stock,msg,classId,img) values(#{name},#{price},#{stock},#{msg},#{classId},#{imgUrl})")
    public int insert(Good good);
    @Select("select * from good where name=#{name}")
    public Good getGoodByName(String name);
    @Select("select * from good where id=#{id}")
    public Good findGoodById(int id);
    @Update("update good set name=#{name},price=#{price},stock=#{stock},msg=#{msg},classId=#{classId} where id=#{id}")
    public int update(Good good);
    @Delete("delete from good where id=#{id}")
    public int delete(int id);



}
