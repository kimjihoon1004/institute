package com.eugene.fee.ctrl;
import com.eugene.common.db.SqlSessionCtrl;
import com.eugene.crs.item.CrsItem;
import com.eugene.fee.item.*;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import java.util.ArrayList;

public class FeeCtrl extends SqlSessionCtrl{
	
	public List<FeeItem> retrieveFeeList(List<FeeItem> feeItems, String date){
		List<FeeItem> bean = new ArrayList<FeeItem>();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			bean = session.selectList("FeeInfor.retrieveFeeList", date);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		for(int i = 0; i < bean.size(); i++) {
			for(int j = 0; j < feeItems.size(); j++) {
				if(bean.get(i).getStId() == feeItems.get(j).getStId()) {
					feeItems.get(j).setFeeDate(bean.get(i).getFeeDate());
					feeItems.get(j).setFeeId(bean.get(i).getFeeId());
				}
			}
		}
		return feeItems;
	}
	public int insertFee(FeeItem feeItem) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.insert("FeeInfor.insertFee",feeItem);
			
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
	
	public int updateFee(FeeItem feeItem) {
		int success = -1;
		SqlSession session = null;
		
		try{
			session = sqlSessionFactory.openSession();
			success = session.update("FeeInfor.updateFee",feeItem);
			
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
}
