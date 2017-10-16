package cn.citms;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;
import org.springframework.test.context.junit4.SpringRunner;

import cn.blue.dao.UserDao;

@RunWith(SpringRunner.class)
@DataJpaTest
public class UserRepositoryTests {
	@Autowired
	private TestEntityManager entityManager;

	@Autowired
	private UserDao repository;

	@Test
	public void findByUsernameShouldReturnUser(){
		
	}
}
