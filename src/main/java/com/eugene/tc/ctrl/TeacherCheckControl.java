package com.eugen.tc.ctrl;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.eugen.common.db.SqlSessionManager;
import com.eugen.tc.bean.TeacherItem;

import java.util.ArrayList;

public class TeacherCheckControl extends SqlSessionManager {
	
	public List<TeacherItem> searchName(TeacherItem teacheritem) {
		List<TeacherItem> teacherItems = new ArrayList<TeacherItem>();
		SqlSession session = null;
		
		try {
			session = sqlSession.openSession();
			teacherItems = session.selectList("Testt.retrieveCheck", teacheritem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return teacherItems;
	}
	
	public TeacherItem teacherInformation(TeacherItem teacheritem) {
		TeacherItem teacherItems = new TeacherItem();
		SqlSession session = null;
		
		try {
			session = sqlSession.openSession();
			teacherItems = session.selectOne("Testt.teacherInform", teacheritem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		return teacherItems;
	}
	
	public TeacherItem teacherDelete(TeacherItem teacheritem) {
		TeacherItem teacherItems = new TeacherItem();
		SqlSession session = null;
		
		try {
			session = sqlSession.openSession();
			teacherItems = session.selectOne("Testt.teacherDelete", teacheritem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return teacherItems;
	}
	
	public TeacherItem teacherUpdate(TeacherItem teacheritem) {
		TeacherItem teacherItems = new TeacherItem();
		SqlSession session = null;
		
		try {
			session = sqlSession.openSession();
			teacherItems = session.selectOne("Testt.teacherUpdate", teacheritem);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return teacherItems;
	}
	
	public TeacherCheckControl()
	{
		System.out.println("success");
	}
	
	public List <TeacherItem> retrieveCheck(List<TeacherItem> teacherItem)
	{
		List<TeacherItem> Item = new ArrayList<TeacherItem>();
		
		try(SqlSession session = sqlSession.openSession()){
			Item = session.selectList("Testt.retrieveCheck");
			  }
		return Item;
	}
	
	public int retrieveMember(TeacherItem teacherItem)
	{
		// StudentBean Bean = new StudentBean();
		int result;
		
		try(SqlSession session = sqlSession.openSession()){
			result = session.insert("Testt.retrieveCheck", teacherItem);
			  }
		return result;
	}

}
