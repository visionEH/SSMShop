package mapper;


import entity.Order;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IOrderMapper {

    @Select("select * from orders")
    @Results({
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "orderId" ,property = "orderId"),
            @Result(column = "date" ,property = "date"),
            @Result(column = "number" ,property = "number"),
            @Result(column = "goodId" ,property = "goodId"),
            @Result(column = "price" ,property = "price"),
            @Result(column = "idDistributed" ,property = "idDistributed"),
            @Result(column = "userId",property = "user", one =
            @One(select = "mapper.IUserMapper.findUserById",fetchType=FetchType.EAGER)),
            @Result(column = "goodId",property = "good", one =
            @One(select = "mapper.IGoodMapper.findGoodById",fetchType=FetchType.EAGER))
    }
    )
    public List<Order> showAllOrders();


    @Select("select * from orders where userId =#{userId}")
    @Results({
            @Result(id=true,column = "id",property = "id"),
            @Result(column = "orderId" ,property = "orderId"),
            @Result(column = "date" ,property = "date"),
            @Result(column = "number" ,property = "number"),
            @Result(column = "goodId" ,property = "goodId"),
            @Result(column = "price" ,property = "price"),
            @Result(column = "idDistributed" ,property = "idDistributed"),
            @Result(column = "userId",property = "user", one =
            @One(select = "mapper.IUserMapper.findUserById",fetchType=FetchType.EAGER)),
            @Result(column = "goodId",property = "good", one =
            @One(select = "mapper.IGoodMapper.findGoodById",fetchType=FetchType.EAGER))
    }
    )
    public List<Order> getOrdersByUserId(int userId);

    @Insert("insert into orders(orderId,date,number,price,isDistributed,userId,goodId) values(#{orderId},#{date}" +
            ",#{number},#{price},#{isDistributed},#{userId},#{goodId})")
    public int addOrder(Order order);
    @Update("update orders set idDistributed=#{state} where id=#{id}")
    public int updateState(int id,int state);


}
