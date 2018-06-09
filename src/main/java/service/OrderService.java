package service;

import entity.Order;
import mapper.IOrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderService {

    public IOrderMapper iOrderMapper;

    @Autowired
    public OrderService(IOrderMapper iOrderMapper){
        this.iOrderMapper=iOrderMapper;
    }


    public List<Order> getAllOrders(){
           return iOrderMapper.showAllOrders();
    }

    @Transactional
    public int add(Order order){
        return iOrderMapper.addOrder(order);
    }

    public int delete(int userId,int goodId){
        return 1;
    }


    public List<Order> getAllUserOrder(int userId){
        return iOrderMapper.getOrdersByUserId(userId);
    }
}
