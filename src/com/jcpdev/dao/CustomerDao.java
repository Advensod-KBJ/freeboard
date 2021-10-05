package com.jcpdev.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Customer;
import com.jcpdev.dto.SessionDto;
import com.jcpdev.mybatis.SqlSessionBean;

public class CustomerDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static CustomerDao dao = new CustomerDao();
	
	private CustomerDao() { }
	public static CustomerDao getInstance() {
		return dao;
	}

	public SessionDto login(Map<String,String> map) {
		SessionDto dto=null;
		SqlSession mapper = factory.openSession();
		dto = mapper.selectOne("loginCheck", map);	
		return dto;
	}
}