package team.desk3.efww;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("team.desk3.efww.mapper")
@SpringBootApplication
public class EndangeredFaunaWorldWindowApplication {

    public static void main(String[] args) {
        SpringApplication.run(EndangeredFaunaWorldWindowApplication.class, args);
    }

}
