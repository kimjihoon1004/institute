package com.sample.mybatis.dao;

import java.util.List;
import com.sample.mybatis.dto.Tc;

public interface TcMapper {
	public List<String> selectAllTc();
	public Tc selectTc(String name);
	public void insertTc(Tc tc);
	public void updateTc(Tc tc);
	public void deleteTc(String tc_mail);
	public String loginTc(String tc_mail);
	public String findID(Tc tc);
	public String findPW(Tc tc);
	public String findName(String tc_mail);
	public List<String> selectAllMail();
}
