package admintest;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.junit.Test;
import org.apache.log4j.Logger;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.alibaba.fastjson.JSON;

import edu.gd.ccp.dao.DocumentMapper;
import edu.gd.ccp.dao.DocumentTypeMapper;
import edu.gd.ccp.entity.DocumentType;
import edu.gd.ccp.service.UserAccountService;
import net.sf.json.JSONObject;


@RunWith(SpringJUnit4ClassRunner.class) //表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:mybatis-config.xml", "classpath:spring-service.xml","classpath:spring-dao.xml","classpath:spring-web.xml" })
@WebAppConfiguration
public class TestDocument {
	
    @Resource
    private UserAccountService userAccountService ;
    @Resource
    private DocumentMapper documentMapper ;
 
    @Resource
    private DocumentTypeMapper documentTypeMapper ;
    
    @Test
    public void loginTest() {
    	JSONObject result = this.userAccountService.userLogin("zxm", "111");
    	
    	System.out.println(result);
         
    }
    @Test
    public void daoTest() {
//    	List<Map> docs=documentMapper.getDocumentsByCondation(0, 2,null, null, null, null, null);
    	List<DocumentType> docs=documentTypeMapper.selectDocumentTypes();
    	System.out.println(docs.size());
         
    }
}