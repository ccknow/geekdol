package com.wooxun.geekdol.hmedia.model;

import com.soft863.dolphin.common.CommonEntity;
import com.wooxun.geekdol.system.model.AppUser;

/**
 * 
* @Title
* @Description
* @version 1.0.0
* @Author kangtianyu	
* @CreateDate 2016年7月30日 
* @param 
* @see 
* @modified 修改履历
*==========================================================
* No    修改人员			修改日期  	   			描述
* 1. 	 kangtianyu	2016年7月30日  下午5:07:43 		创建
*==========================================================
*
 */
public class AroundStoreComment extends CommonEntity {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** 主键 */
    private Long id;

    /** 周边店id */
    private Long aroundStoreId;

    /** 评论内容 */
    private String content;

    /** 是否违规:是,否 */
    private String illegalStatus;

    /** 对这条评论进行点赞数量 */
    private Integer likesNumber;

    /** 对这条评论进行负赞数量 */
    private Integer hateNumber;

    /** 这一条评论的浏览量 */
    private Integer viewNumber;

    /** 这一条评论的回复量 */
    private Integer replyNumber;

    /** 评论的评论 有多少违规的 */
    private Integer illegalNumber;

    /** 评论的星级:可分为1,2,3,4,5 */
    private String starType;

    /** 发布评论人的Ip */
    private String opreaterIp;
    
    /** 评论人信息 */
    private AppUser appUser;

	/**
     *
     * 获取  主键
     *
     * @return  id
     */
    public Long getId() {
        return id;
    }

    /**
     *
     * 设置  主键
     *
     * @param id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     *
     * 获取  周边店id
     *
     * @return  aroundStoreId
     */
    public Long getAroundStoreId() {
        return aroundStoreId;
    }

    /**
     *
     * 设置  周边店id
     *
     * @param aroundStoreId
     */
    public void setAroundStoreId(Long aroundStoreId) {
        this.aroundStoreId = aroundStoreId;
    }

    /**
     *
     * 获取  评论内容
     *
     * @return  content
     */
    public String getContent() {
        return content;
    }

    /**
     *
     * 设置  评论内容
     *
     * @param content
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }

    /**
     *
     * 获取  是否违规:是,否
     *
     * @return  illegalStatus
     */
    public String getIllegalStatus() {
        return illegalStatus;
    }

    /**
     *
     * 设置  是否违规:是,否
     *
     * @param illegalStatus
     */
    public void setIllegalStatus(String illegalStatus) {
        this.illegalStatus = illegalStatus == null ? null : illegalStatus.trim();
    }

    /**
     *
     * 获取  对这条评论进行点赞数量
     *
     * @return  likesNumber
     */
    public Integer getLikesNumber() {
        return likesNumber;
    }

    /**
     *
     * 设置  对这条评论进行点赞数量
     *
     * @param likesNumber
     */
    public void setLikesNumber(Integer likesNumber) {
        this.likesNumber = likesNumber;
    }

    /**
     *
     * 获取  对这条评论进行负赞数量
     *
     * @return  hateNumber
     */
    public Integer getHateNumber() {
        return hateNumber;
    }

    /**
     *
     * 设置  对这条评论进行负赞数量
     *
     * @param hateNumber
     */
    public void setHateNumber(Integer hateNumber) {
        this.hateNumber = hateNumber;
    }

    /**
     *
     * 获取  这一条评论的浏览量
     *
     * @return  viewNumber
     */
    public Integer getViewNumber() {
        return viewNumber;
    }

    /**
     *
     * 设置  这一条评论的浏览量
     *
     * @param viewNumber
     */
    public void setViewNumber(Integer viewNumber) {
        this.viewNumber = viewNumber;
    }

    /**
     *
     * 获取  这一条评论的回复量
     *
     * @return  replyNumber
     */
    public Integer getReplyNumber() {
        return replyNumber;
    }

    /**
     *
     * 设置  这一条评论的回复量
     *
     * @param replyNumber
     */
    public void setReplyNumber(Integer replyNumber) {
        this.replyNumber = replyNumber;
    }

    /**
     *
     * 获取  评论的评论 有多少违规的
     *
     * @return  illegalNumber
     */
    public Integer getIllegalNumber() {
        return illegalNumber;
    }

    /**
     *
     * 设置  评论的评论 有多少违规的
     *
     * @param illegalNumber
     */
    public void setIllegalNumber(Integer illegalNumber) {
        this.illegalNumber = illegalNumber;
    }

    /**
     *
     * 获取  评论的星级:可分为1,2,3,4,5
     *
     * @return  starType
     */
    public String getStarType() {
        return starType;
    }

    /**
     *
     * 设置  评论的星级:可分为1,2,3,4,5
     *
     * @param starType
     */
    public void setStarType(String starType) {
        this.starType = starType == null ? null : starType.trim();
    }

    /**
     *
     * 获取  发布评论人的Ip
     *
     * @return  opreaterIp
     */
    public String getOpreaterIp() {
        return opreaterIp;
    }

    /**
     *
     * 设置  发布评论人的Ip
     *
     * @param opreaterIp
     */
    public void setOpreaterIp(String opreaterIp) {
        this.opreaterIp = opreaterIp == null ? null : opreaterIp.trim();
    }

	public AppUser getAppUser() {
		return appUser;
	}

	public void setAppUser(AppUser appUser) {
		this.appUser = appUser;
	}
    
}