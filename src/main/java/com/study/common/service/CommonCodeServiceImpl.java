package com.study.common.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.common.dao.ICommonCodeDao;
import com.study.common.exception.BizException;
import com.study.common.vo.CodeVO;

//스프링 대상 관리 객체
@Service
public class CommonCodeServiceImpl implements ICommonCodeService{
	
	//생성
	@Autowired
	private ICommonCodeDao codeDao;
	
	@Override
	public List<CodeVO> getCodeListByParent(String code) throws BizException {		
		try {
			return codeDao.getCodeListByParent(code);
		} catch (SQLException e) {
			throw new BizException(e);
		}
		
	}

}
