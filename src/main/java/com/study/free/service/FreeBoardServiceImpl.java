package com.study.free.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.common.exception.BizDuplicateException;
import com.study.common.exception.BizException;
import com.study.common.exception.BizNotFoundException;
import com.study.common.exception.BizRegistFailException;
import com.study.free.dao.IFreeBoardDao;
import com.study.free.vo.FreeBoardVO;
import com.study.free.vo.FreeSearchVO;


@Service
public class FreeBoardServiceImpl implements IFreeBoardService{

	//private IFreeBoardDao freeDao=new FreeBoardDaoOracle();
	@Autowired
	private IFreeBoardDao freeDao;
	@Override
	public List<FreeBoardVO> getBoardList(FreeSearchVO searchVO) throws BizException {
		try {
			int rowCount=freeDao.getBoardCount(searchVO);
			searchVO.setTotalRowCount(rowCount);
			searchVO.setting();
			return freeDao.getBoardList(searchVO);
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public FreeBoardVO getBoard(int boNum) throws BizException {
		
		try {
			FreeBoardVO board = freeDao.getBoard(boNum);
			if(board ==null)throw new BizNotFoundException("글번호:"+boNum+"을 조회하지 못했습니다.");
			return board;
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public void registBoard(FreeBoardVO board) throws BizException {
		
		try {
			int res =freeDao.insertBoard(board);
			if(res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			//중복에러
			if(e.getErrorCode()==1) {
				throw new BizDuplicateException();
			}
			throw new BizException(e);
		}
		
	}

	@Override
	public void modifyBoard(FreeBoardVO board) throws BizException {
		try {
			int res =freeDao.updateBoard(board);
			if(res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			throw new BizException(e);
		}
	}

	@Override
	public void removeBoard(FreeBoardVO board) throws BizException {
		try {
			int res =freeDao.deleteBoard(board);
			if(res<1) {
				throw new BizRegistFailException();
			}
		} catch (SQLException e) {
			throw new BizException(e);
		}

	}

	@Override
	public void increaseHit(int boNum) throws BizException {
		try {
			freeDao.increaseHit(boNum);
		} catch (SQLException e) {
			throw new BizException(e);
		}
		
	}

	@Override
	public void removeCheckedBoard(int[] boNums) throws BizException {
		try {
			freeDao.deleteCheckBoard(boNums);
		} catch (SQLException e) {
			throw new BizException(e);
		}		
	}

	
}
