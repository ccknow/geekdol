package com.soft863.dolphin.common;

import java.io.Serializable;
import java.util.Date;

public abstract class CommonEntity implements Serializable {
	private static final long serialVersionUID = -5802669203869603329L;
	private Date insYmdhms;
	private Long insId;
	private Long updEac;
	private Date updYmdhms;
	private Long updId;
	private String delFlag;
	private int pageFlag = 1;
	private long totalCount;
	private int totalPage;
	private long lowNum = 1L;
	private long highNum = 1L;
	private int pageNum = 1;
	private int numPerPage = 20;
	private int pageNumShown = 10;

	public Date getInsYmdhms() {
		return this.insYmdhms;
	}

	public void setInsYmdhms(Date insYmdhms) {
		this.insYmdhms = insYmdhms;
	}

	public Long getInsId() {
		return this.insId;
	}

	public void setInsId(Long insId) {
		this.insId = insId;
	}

	public Long getUpdEac() {
		return this.updEac;
	}

	public void setUpdEac(Long updEac) {
		this.updEac = updEac;
	}

	public Date getUpdYmdhms() {
		return this.updYmdhms;
	}

	public void setUpdYmdhms(Date updYmdhms) {
		this.updYmdhms = updYmdhms;
	}

	public Long getUpdId() {
		return this.updId;
	}

	public void setUpdId(Long updId) {
		this.updId = updId;
	}

	public String getDelFlag() {
		return this.delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

	public long getTotalCount() {
		return this.totalCount;
	}

	public void setTotalCount(long cnt) {
		this.totalCount = (cnt < 0L ? 0L : cnt);
		this.totalPage = ((int) ((this.totalCount - 1L) / this.numPerPage + 1L));
		this.pageNum = (this.pageNum < 1 ? 1
				: this.pageNum > this.totalPage ? this.totalPage : this.pageNum);
		this.lowNum = ((this.pageNum - 1) * this.numPerPage);
		this.highNum = this.numPerPage;
	}

	public int getTotalPage() {
		return this.totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public long getLowNum() {
		return this.lowNum;
	}

	public void setLowNum(long lowNum) {
		this.lowNum = lowNum;
	}

	public long getHighNum() {
		return this.highNum;
	}

	public void setHighNum(long highNum) {
		this.highNum = highNum;
	}

	public int getPageNum() {
		return this.pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getNumPerPage() {
		return this.numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPageNumShown() {
		return this.pageNumShown;
	}

	public void setPageNumShown(int pageNumShown) {
		this.pageNumShown = pageNumShown;
	}

	public int getPageFlag() {
		return this.pageFlag;
	}

	public void setPageFlag(int pageFlag) {
		this.pageFlag = pageFlag;
	}
}
