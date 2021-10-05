package com.jcpdev.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.jcpdev.dto.Comment;
import com.jcpdev.mybatis.SqlSessionBean;

public class CommentDao {
	
	SqlSessionFactory factory = SqlSessionBean.getSessionFactory();
	private static CommentDao dao = new CommentDao();
	
	private CommentDao() { }
	public static CommentDao getInstance() {
		return dao;
	}

	public List<Comment> getComments(int mref){   
		List<Comment> list = null;
		SqlSession mapper = factory.openSession();
		list = mapper.selectList("getComments",mref);
		mapper.close();
		return list;
	}
	
	public void insert(Comment dto) {
		SqlSession mapper = factory.openSession();
		mapper.insert("comment.insert", dto);   // mapper xml 파일의 네임스페이스.id 로 첫번째 인자값.
		mapper.commit();
		mapper.close();
	}
	
	public void delete(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.delete("comment.delete", idx);
		mapper.commit();
		mapper.close();
	}
	
	
	public void updateCommentCnt(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("updateCommentCnt", idx);
		mapper.commit();
		mapper.close();
	}
	
	public void updateCountAll(int idx) {
		SqlSession mapper = factory.openSession();
		mapper.update("updateCountAll", idx);
		mapper.commit();
		mapper.close();
	}
}