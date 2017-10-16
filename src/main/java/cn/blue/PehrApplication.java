package cn.blue;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import cn.citms.core.repository.CustomRepositoryFactoryBean;

@ComponentScan(basePackages = { "cn.blue"})
@SpringBootApplication
@EnableJpaRepositories(repositoryFactoryBeanClass = CustomRepositoryFactoryBean.class)//donglc?
public class PehrApplication {
	
	public static void main(String[] args) {
				SpringApplication.run(PehrApplication.class, args);
	}

}
