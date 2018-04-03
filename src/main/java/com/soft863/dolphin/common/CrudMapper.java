package com.soft863.dolphin.common;

import java.io.Serializable;
import org.springframework.dao.DataAccessException;

public abstract interface CrudMapper<T extends Serializable> {
	public abstract T selectByPrimaryKey(T paramT) throws DataAccessException;

	public abstract T selectByPrimaryKey(String paramString)
			throws DataAccessException;

	public abstract T selectByPrimaryKey(Long paramLong)
			throws DataAccessException;

	public abstract int deleteByPrimaryKey(T paramT) throws DataAccessException;

	public abstract int deleteByPrimaryKey(String paramString)
			throws DataAccessException;

	public abstract int deleteByPrimaryKey(Long paramLong)
			throws DataAccessException;

	public abstract int insert(T paramT) throws DataAccessException;

	public abstract int insertSelective(T paramT) throws DataAccessException;

	public abstract int updateByPrimaryKey(T paramT) throws DataAccessException;

	public abstract int updateByPrimaryKeySelective(T paramT)
			throws DataAccessException;
}