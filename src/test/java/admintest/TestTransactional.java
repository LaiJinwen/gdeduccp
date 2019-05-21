package admintest;



import java.util.Date;

import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.gd.ccp.service.AdminDocumentManageService;

public class TestTransactional {
	
	@Test
	public void testTransactional() {
		AbstractApplicationContext context = new ClassPathXmlApplicationContext("spring-dao.xml","spring-service.xml","spring-service.xml");
		AdminDocumentManageService bean = (AdminDocumentManageService) context.getBean("adminService");
		bean.publishDocument("测试数据", "测试标题",1, new Date(),"公办",  "本科院校", "其他", "test", "test");
	}
}	
