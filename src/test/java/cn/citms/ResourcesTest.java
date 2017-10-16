package cn.citms;



//@RunWith(SpringRunner.class)
//@SpringBootTest
public class ResourcesTest  {
//	@Autowired
//	ResourcesRepository dao;
//	
//	@Autowired
//	RoleRepository roleDao;
//	
//	@Autowired
//	UserRepository userDao;
//	
//	 //@Test
//	  public void delete() {
//		 userDao.delete("402851815d6e421a015d6e4228820000");
//	     assertThat(userDao.exists("402851815d6e421a015d6e4228820000")).isFalse();
//	 }
//	
////	@Test
////	@Transactional
////	@Rollback(value=false)
//	public void init(){
//		Resources d1=new Resources();
//		d1.setName("爷爷1");
//		Resources d2=new Resources();
//		d2.setName("爸爸1");
//		Resources d3=new Resources();
//		d3.setName("儿子1");
//		d1.getSubs().add(d2);
//		d2.getSubs().add(d3);
//		dao.save(d1);
//	}
//@Test
//@Transactional
//@Rollback(value=false)
//	public void initRoleUser(){
//		SUser user=new SUser();
//		user.setName("张三111");
////		SUser user1=new SUser();
////		user.setName("李四");
//		SRole role=new SRole();
//		role.setName("角色2222");
//		user.setRole(role);
////		role.getUsers().add(user);
////		role.getUsers().add(user1);
////		roleDao.save(role);
//		userDao.save(user);
//	}
//
//////
////@Test
////@Transactional
////@Rollback(false)
//	public void deleteRole(){
//		SRole role=roleDao.findAll().get(0);
//		roleDao.delete(role);
//	}
//	
//
//@Test
//@Transactional
//@Rollback(false)
//public void deleteUser(){
//	SUser user=userDao.findAll().get(0);
//	userDao.delete(user);
//	
//}
////@Test
////@Transactional
////@Rollback(value=false)
//	public void deleteResource(){
////		Resources resource=dao.findOne("402851815d6656c8015d6656da2c0001");
////		List<Resources> parents=resource.getParents();
////		for(Resources parent:parents){
////			parent.getSubs().remove(resource);
////		}
////	resource.setParents(null);
////		dao.delete("402851815d8cd1fe015d8cd20a2f0000");
//	}
//	//@Test
//	public void getALL(){
//		System.out.println(dao.findAll().size());;
//	}
}
