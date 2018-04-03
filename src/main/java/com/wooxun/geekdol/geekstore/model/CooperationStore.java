package com.wooxun.geekdol.geekstore.model;

import java.util.Date;
import java.util.List;

import com.soft863.dolphin.common.CommonEntity;

public class CooperationStore extends CommonEntity{
    
	private static final long serialVersionUID = 1L;

	/** 合作店Id */
    private Long id;

    /** 城市Id */
    private Long cityId;

    /** 区市Id */
    private Long countryId;

    /** 街道 */
    private Long streetId;

    /** 用户id */
    private Long userId;

    /** 店铺名称 */
    private String storeName;

    /** 超市id、便利店id、百货商店id */
    private String typeId;

    /** 起送金额 */
    private Double minDeliverPrice;

    /** 送货电话 */
    private String deliveryNumber;

    /** 联系人 */
    private String contcatName;

    /** 电话 */
    private String contcatNumber;

    /** 营业时间 */
    private Date openingTime;

    /** 关门时间 */
    private Date closingTime;

    /** 法人 */
    private String legalPerson;

    /** 法人身份证 */
    private String legalPersonId;

    /** 组织代码证 */
    private String organizationCode;

    /** 店铺地址 */
    private String storeAdress;

    /** 点赞起始值 */
    private Integer likingBaseValue;

    /** 缩略图 */
    private String thumbnail;

    /** 营业执照 */
    private String businessLicense;

    /** 简介 */
    private String remark;

    /** 未审核；正在营业；歇业；停业；回收站 */
    private String status;
    /**合作店铺与小区关系**/
    public List<CooperationStoreVillage> cooperationStoreVillage;

    /**
     *
     * 获取  合作店Id
     *
     * @return  id
     */
    public Long getId() {
        return id;
    }

    /**
     *
     * 设置  合作店Id
     *
     * @param id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     *
     * 获取  城市Id
     *
     * @return  cityId
     */
    public Long getCityId() {
        return cityId;
    }

    /**
     *
     * 设置  城市Id
     *
     * @param cityId
     */
    public void setCityId(Long cityId) {
        this.cityId = cityId;
    }

    /**
     *
     * 获取  区市Id
     *
     * @return  countryId
     */
    public Long getCountryId() {
        return countryId;
    }

    /**
     *
     * 设置  区市Id
     *
     * @param countryId
     */
    public void setCountryId(Long countryId) {
        this.countryId = countryId;
    }

    /**
     *
     * 获取  街道
     *
     * @return  streetId
     */
    public Long getStreetId() {
        return streetId;
    }

    /**
     *
     * 设置  街道
     *
     * @param streetId
     */
    public void setStreetId(Long streetId) {
        this.streetId = streetId;
    }

    /**
     *
     * 获取  用户id
     *
     * @return  userId
     */
    public Long getUserId() {
        return userId;
    }

    /**
     *
     * 设置  用户id
     *
     * @param userId
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     *
     * 获取  店铺名称
     *
     * @return  storeName
     */
    public String getStoreName() {
        return storeName;
    }

    /**
     *
     * 设置  店铺名称
     *
     * @param storeName
     */
    public void setStoreName(String storeName) {
        this.storeName = storeName == null ? null : storeName.trim();
    }

    /**
     *
     * 获取  超市id、便利店id、百货商店id
     *
     * @return  typeId
     */
    public String getTypeId() {
        return typeId;
    }

    /**
     *
     * 设置  超市id、便利店id、百货商店id
     *
     * @param typeId
     */
    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    /**
     *
     * 获取  起送金额
     *
     * @return  minDeliverPrice
     */
    public Double getMinDeliverPrice() {
        return minDeliverPrice;
    }

    /**
     *
     * 设置  起送金额
     *
     * @param minDeliverPrice
     */
    public void setMinDeliverPrice(Double minDeliverPrice) {
        this.minDeliverPrice = minDeliverPrice;
    }

    /**
     *
     * 获取  送货电话
     *
     * @return  deliveryNumber
     */
    public String getDeliveryNumber() {
        return deliveryNumber;
    }

    /**
     *
     * 设置  送货电话
     *
     * @param deliveryNumber
     */
    public void setDeliveryNumber(String deliveryNumber) {
        this.deliveryNumber = deliveryNumber == null ? null : deliveryNumber.trim();
    }

    /**
     *
     * 获取  联系人
     *
     * @return  contcatName
     */
    public String getContcatName() {
        return contcatName;
    }

    /**
     *
     * 设置  联系人
     *
     * @param contcatName
     */
    public void setContcatName(String contcatName) {
        this.contcatName = contcatName == null ? null : contcatName.trim();
    }

    /**
     *
     * 获取  电话
     *
     * @return  contcatNumber
     */
    public String getContcatNumber() {
        return contcatNumber;
    }

    /**
     *
     * 设置  电话
     *
     * @param contcatNumber
     */
    public void setContcatNumber(String contcatNumber) {
        this.contcatNumber = contcatNumber == null ? null : contcatNumber.trim();
    }

    /**
     *
     * 获取  营业时间
     *
     * @return  openingTime
     */
    public Date getOpeningTime() {
        return openingTime;
    }

    /**
     *
     * 设置  营业时间
     *
     * @param openingTime
     */
    public void setOpeningTime(Date openingTime) {
        this.openingTime = openingTime;
    }

    /**
     *
     * 获取  关门时间
     *
     * @return  closingTime
     */
    public Date getClosingTime() {
        return closingTime;
    }

    /**
     *
     * 设置  关门时间
     *
     * @param closingTime
     */
    public void setClosingTime(Date closingTime) {
        this.closingTime = closingTime;
    }

    /**
     *
     * 获取  法人
     *
     * @return  legalPerson
     */
    public String getLegalPerson() {
        return legalPerson;
    }

    /**
     *
     * 设置  法人
     *
     * @param legalPerson
     */
    public void setLegalPerson(String legalPerson) {
        this.legalPerson = legalPerson == null ? null : legalPerson.trim();
    }

    /**
     *
     * 获取  法人身份证
     *
     * @return  legalPersonId
     */
    public String getLegalPersonId() {
        return legalPersonId;
    }

    /**
     *
     * 设置  法人身份证
     *
     * @param legalPersonId
     */
    public void setLegalPersonId(String legalPersonId) {
        this.legalPersonId = legalPersonId == null ? null : legalPersonId.trim();
    }

    /**
     *
     * 获取  组织代码证
     *
     * @return  organizationCode
     */
    public String getOrganizationCode() {
        return organizationCode;
    }

    /**
     *
     * 设置  组织代码证
     *
     * @param organizationCode
     */
    public void setOrganizationCode(String organizationCode) {
        this.organizationCode = organizationCode == null ? null : organizationCode.trim();
    }

    /**
     *
     * 获取  店铺地址
     *
     * @return  storeAdress
     */
    public String getStoreAdress() {
        return storeAdress;
    }

    /**
     *
     * 设置  店铺地址
     *
     * @param storeAdress
     */
    public void setStoreAdress(String storeAdress) {
        this.storeAdress = storeAdress == null ? null : storeAdress.trim();
    }

    /**
     *
     * 获取  点赞起始值
     *
     * @return  likingBaseValue
     */
    public Integer getLikingBaseValue() {
        return likingBaseValue;
    }

    /**
     *
     * 设置  点赞起始值
     *
     * @param likingBaseValue
     */
    public void setLikingBaseValue(Integer likingBaseValue) {
        this.likingBaseValue = likingBaseValue;
    }

    /**
     *
     * 获取  缩略图
     *
     * @return  thumbnail
     */
    public String getThumbnail() {
        return thumbnail;
    }

    /**
     *
     * 设置  缩略图
     *
     * @param thumbnail
     */
    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail == null ? null : thumbnail.trim();
    }

    /**
     *
     * 获取  营业执照
     *
     * @return  businessLicense
     */
    public String getBusinessLicense() {
        return businessLicense;
    }

    /**
     *
     * 设置  营业执照
     *
     * @param businessLicense
     */
    public void setBusinessLicense(String businessLicense) {
        this.businessLicense = businessLicense == null ? null : businessLicense.trim();
    }

    /**
     *
     * 获取  简介
     *
     * @return  remark
     */
    public String getRemark() {
        return remark;
    }

    /**
     *
     * 设置  简介
     *
     * @param remark
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    /**
     *
     * 获取  未审核；正在营业；歇业；停业；回收站
     *
     * @return  status
     */
    public String getStatus() {
        return status;
    }

    /**
     *
     * 设置  未审核；正在营业；歇业；停业；回收站
     *
     * @param status
     */
    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }

	public List<CooperationStoreVillage> getCooperationStoreVillage() {
		return cooperationStoreVillage;
	}

	public void setCooperationStoreVillage(
			List<CooperationStoreVillage> cooperationStoreVillage) {
		this.cooperationStoreVillage = cooperationStoreVillage;
	}
    
}