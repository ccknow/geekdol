package com.soft863.dolphin.common;

import java.io.Serializable;

public abstract interface CrudService<T extends Serializable> {
	public abstract T get(T paramT) throws Exception;

	public abstract T get(String paramString) throws Exception;

	public abstract T get(Long paramLong) throws Exception;

	public abstract int delete(T paramT) throws Exception;

	public abstract int delete(String paramString) throws Exception;

	public abstract int delete(Long paramLong) throws Exception;

	public abstract int save(T paramT) throws Exception;

	public abstract int saveSelective(T paramT) throws Exception;

	public abstract int update(T paramT) throws Exception;

	public abstract int updateSelective(T paramT) throws Exception;
}
