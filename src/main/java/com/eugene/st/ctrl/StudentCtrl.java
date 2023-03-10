package com.eugene.st.ctrl;

import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.st.bean.StudentBean;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class StudentCtrl extends SqlSessionCtrl{

	public List<StudentBean> retrieveStudentList() {
		List<StudentBean> stBean = new ArrayList<StudentBean>();
		
		try(SqlSession session = sqlSessionFactory.openSession()){
			stBean = session.selectList("StudentInfor.retrieveStudentList");
		}
		
		return stBean;
	}
	
	public List<StudentBean> PartialRetrieveStudentList(String stName) {
		List<StudentBean> stBean = new ArrayList<StudentBean>();
		
		try(SqlSession session = sqlSessionFactory.openSession()){
			stBean = session.selectList("StudentInfor.PartialRetrieveStudentList", stName);
		}
		
		return stBean;
	}
	
	public StudentBean retireveStudent(StudentBean stBean) {
		StudentBean st = new StudentBean();
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			st = session.selectOne("retrieveStudent", stBean);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			session.close();
		}
		
		return st;
	}
	
	public int insertStudent(StudentBean stBean) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("StudentInfor.insertStudent",stBean);
			System.out.println("\n insert " + stBean.getStName() + " success " + success + "\n");
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	public int deleteStudent(StudentBean stBean) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.delete("StudentInfor.deleteStudent",stBean);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	
	public int updateStudent(StudentBean stBean) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.update("StudentInfor.updateStudent",stBean);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally {
			session.commit();
			session.close();
		}
		return success;
	}
	
	
}
