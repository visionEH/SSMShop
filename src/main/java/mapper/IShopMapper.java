package mapper;


import entity.Good;
import entity.Shop;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IShopMapper {

    @Select("select * from shop where userId=#{userId}")
    @Results({
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "userId",property = "userId"),
            @Result(column = "goodId",property = "goodId"),
            @Result(column = "number",property = "number"),
            @Result(column = "userId",property = "user",one =
                    @One(select = "mapper.IUserMapper.findUserById",fetchType=FetchType.EAGER)),
            @Result(column = "goodId",property = "good",one =
                    @One(select = "mapper.IGoodMapper.findGoodById",fetchType=FetchType.EAGER))
    })
    public List<Shop> showAllShopsByUserId(int userId);

    @Update("update shop set number=#{number} where userId=#{userId} and goodId=#{goodId}")
    public int updateById(Shop shop);

    @Delete("delete from shop where userId=#{userId} and goodId=#{goodId}")
    public int deleteShop(Shop shop);

    @Insert("insert into shop(goodId,userId,number) values(#{goodId},#{userId},#{number})")
    public int add(Shop shop);

    @Select("select * from shop where userId=#{userId} and goodId=#{goodId}")
    public Shop findByUserIdGoodId(Shop shop);

}
