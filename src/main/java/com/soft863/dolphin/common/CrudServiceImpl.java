package com.soft863.dolphin.common;

import java.io.Serializable;

public abstract class CrudServiceImpl<T extends Serializable> implements
		CrudService<T> {
	private final CrudMapper<T> crudMapper;

	public CrudServiceImpl(CrudMapper<T> crudMapper) {
		this.crudMapper = crudMapper;
	}

	public T get(T t) throws Exception {
		return this.crudMapper.selectByPrimaryKey(t);
	}

	public T get(String id) throws Exception {
		return this.crudMapper.selectByPrimaryKey(id);
	}

	public T get(Long id) throws Exception {
		return this.crudMapper.selectByPrimaryKey(id);
	}

	public int delete(T t) throws Exception {
		return this.crudMapper.deleteByPrimaryKey(t);
	}

	public int delete(String id) throws Exception {
		return this.crudMapper.deleteByPrimaryKey(id);
	}

	public int delete(Long id) throws Exception {
		return this.crudMapper.deleteByPrimaryKey(id);
	}

	public int save(T t) throws Exception {
		return this.crudMapper.insert(t);
	}

	public int saveSelective(T t) throws Exception {
		return this.crudMapper.insertSelective(t);
	}

	public int update(T t) throws Exception {
		return this.crudMapper.updateByPrimaryKey(t);
	}

	public int updateSelective(T t) throws Exception {
		return this.crudMapper.updateByPrimaryKeySelective(t);
	}
}
