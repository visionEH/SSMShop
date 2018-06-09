package service;

import entity.Shop;
import mapper.IShopMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.nio.cs.ext.SJIS;
import util.JsonUtil;

import java.util.ArrayList;
import java.util.List;

@Service
public class ShopService {

    private IShopMapper shopMapper;
    @Autowired
    public ShopService(IShopMapper shopMapper) {
        this.shopMapper = shopMapper;
    }

    public List<Shop> getShopByUserId(int userId){
       List<Shop> shops=shopMapper.showAllShopsByUserId(userId);
       if(shops==null){
           shops=new ArrayList<>();
       }
       return shops;
    }

    @Transactional
    public int add(Shop shop){
       return shopMapper.add(shop);
    }

    @Transactional
    public int update(Shop shop){
        return shopMapper.updateById(shop);
    }

    @Transactional
    public int delete(Shop shop){
        return shopMapper.deleteShop(shop);
    }

    public boolean IsExist(Shop shop){
        Shop shop1=shopMapper.findByUserIdGoodId(shop);
        if(shop1==null){
            return false;
        }else{
            return true;
        }
    }
}

