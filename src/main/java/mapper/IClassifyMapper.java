package mapper;

import entity.Classify;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IClassifyMapper {

    @Select("select * from classify where id=#{id}")
    public Classify findClassById(int id);

    @Insert("insert into classify(name) values(#{name})")
    public int addClassify(Classify classify);

    @Delete("delete from classify where id=#{id}")
    public int deleteClassify(int id);

    @Update("update classify set name=#{name} where id=#{id}")
    public int updateClassify(Classify classify);

    @Select("select * from classify")
    public List<Classify> getAllClassify();

}
