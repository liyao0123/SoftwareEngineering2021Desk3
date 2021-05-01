package team.desk3.efww.service.serviceImpl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import team.desk3.efww.bean.User;
import team.desk3.efww.mapper.UserMapper;
import team.desk3.efww.service.UserService;

/**
 * @author team desk3
 * @create 2021-04-30-11:54
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
