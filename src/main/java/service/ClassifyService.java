package service;

import entity.Classify;
import mapper.IClassifyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import util.JsonUtil;

import java.util.ArrayList;
import java.util.List;

@Service
public class ClassifyService {

    public IClassifyMapper classifyMapper;

    @Autowired
    public ClassifyService(IClassifyMapper classifyMapper) {
        this.classifyMapper = classifyMapper;
    }


    public String showAllClassify(){
        List<Classify> list=classifyMapper.getAllClassify();
        if(list==null){
            list=new ArrayList<>();
        }
        return JsonUtil.toJsonString(list);
    }
    @Transactional
    public int addClassify(Classify classify){
       return  classifyMapper.addClassify(classify);
    }
    @Transactional
    public int delete(int id){
        return classifyMapper.deleteClassify(id);
    }
    @Transactional
    public int update(Classify classify){
        return classifyMapper.updateClassify(classify);
    }
}
