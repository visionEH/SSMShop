package service;

import entity.Good;
import mapper.IGoodMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import util.JsonUtil;

import java.util.ArrayList;
import java.util.List;

@Service
public class GoodService {

    private IGoodMapper goodMapper;
    @Autowired
    public GoodService(IGoodMapper goodMapper){
        this.goodMapper=goodMapper;
    }

    @Transactional
    public int  addGood(Good good){
        return goodMapper.insert(good);
    }
    @Transactional
    public int delete(int id){
        return goodMapper.delete(id)==1?0:1;
    }



    public List<Good> showAllGoods(){
        List<Good>  goods=goodMapper.ShowAllGoods();
        System.out.println(goods.toString());
        if(goods==null){
            goods=new ArrayList<>();
        }
        return goods;
    }

    @Transactional
    public int update(Good good){
        return goodMapper.update(good)==1?0:1;
    }
}
