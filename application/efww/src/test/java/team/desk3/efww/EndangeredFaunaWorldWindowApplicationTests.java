package team.desk3.efww;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.jdbc.core.JdbcTemplate;
import team.desk3.efww.bean.Fauna;
import team.desk3.efww.mapper.UserMapper;
import team.desk3.efww.service.FaunaService;

import java.util.List;
import java.util.Map;
@Slf4j
@SpringBootTest
class EndangeredFaunaWorldWindowApplicationTests {

    @Test
    void contextLoads() {
    }
    /*
    @Autowired
    JdbcTemplate jdbcTemplate;

    @Autowired
    UserMapper userMapper;
    */
    @Autowired
    FaunaService faunaService;

    //test if I can connect the mysql successfully
    /*
    @Test
    public void testConnection(){
        //select data from the test demo table user
        List<Map<String, Object>> maps = jdbcTemplate.queryForList("select * from user;");
        System.out.println(maps.toString());
        //works
    }

    @Test
    public void testUserMapper(){
        Object o = userMapper.selectById(1);
        log.info(o.toString());
    }
    */
    /**
     * test the fauna data stored in the database
     */
    @Test
    public void testFaunaMapper(){
//        List<Fauna> list = faunaService.list();
//        log.info(list.toString());
        //works

        //get random data where kind is null
        QueryWrapper<Fauna> query = Wrappers.query();
        query.isNull("game_id");
        List<Fauna> list = faunaService.list(query);
        log.info(list.toString());
    }

    /**
     * test the data of Hominidae
     */
    @Test
    public void testHominidae(){
        //List<Fauna> list = faunaService.list();
        QueryWrapper<Fauna> query = Wrappers.query();
        query.eq("game_id","2-1");
        List<Fauna> list = faunaService.list(query);
        log.info(list.toString());
    }
}
