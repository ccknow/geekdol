package com.wooxun.geekdol.system.vo;


/**
 * @Title
 * @Description
 * @version 1.0.0
 * @Author YK	
 * @CreateDate 2016年7月18日 
 * @param 
 * @see 
 * @modified 修改履历
 *==========================================================
 * No    修改人员			修改日期  	   			描述
 * 1. 	 YK	2016年7月18日  上午11:39:03 		创建
 *==========================================================
 * 
 */
public class VillageVo extends BaseVo {

	/** 小区主键id */
    private Long villageId;
	
	/** 关联省主键 */
    private Long provinceId;

    /** 市主键id */
    private Long cityId;

    /** 区主键id */
    private Long countyId;
    
	/** 社区主键id */
    private Long communityId;

    /** 社区名称 */
    private String communityName;
    
    /** 社区编码 */
    private String communityCode;
    
    /** 推荐显示顺序 */
    private Long ordering;

    /** 状态:禁用;启用 */
    private String status;
    
    private String provinceName;
    
    private String cityName;
    
    private String countyName;
    
    private String villageName;
    
    private String villageAddress;
    
    private String villageLongitude;
    private String villageLatitude;
  
    /**当前用户id*/
    private Long userId;
    /**用户区域级别*/
    private String areaLevel;
    /** 是否开店 */
    private String kaidian;
    /** 小区类型：2:常驻;1:关注*/
    private String villageType;
    
    /**当前那用户的经度*/
    private String curLongitude;
    /**当前那用户的纬度*/
    private String curLatitude;
    

	public Long getCommunityId() {
		return communityId;
	}

	public void setCommunityId(Long communityId) {
		this.communityId = communityId;
	}

	public Long getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Long provinceId) {
		this.provinceId = provinceId;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public Long getCountyId() {
		return countyId;
	}

	public void setCountyId(Long countyId) {
		this.countyId = countyId;
	}

	public String getCommunityName() {
		return communityName;
	}

	public void setCommunityName(String communityName) {
		this.communityName = communityName;
	}

	public String getCommunityCode() {
		return communityCode;
	}

	public void setCommunityCode(String communityCode) {
		this.communityCode = communityCode;
	}

	public Long getOrdering() {
		return ordering;
	}

	public void setOrdering(Long ordering) {
		this.ordering = ordering;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getProvinceName() {
		return provinceName;
	}

	public void setProvinceName(String provinceName) {
		this.provinceName = provinceName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCountyName() {
		return countyName;
	}

	public void setCountyName(String countyName) {
		this.countyName = countyName;
	}

	public String getVillageName() {
		return villageName;
	}

	public void setVillageName(String villageName) {
		this.villageName = villageName;
	}

	public String getVillageAddress() {
		return villageAddress;
	}

	public void setVillageAddress(String villageAddress) {
		this.villageAddress = villageAddress;
	}

	public String getVillageLongitude() {
		return villageLongitude;
	}

	public void setVillageLongitude(String villageLongitude) {
		this.villageLongitude = villageLongitude;
	}

	public String getVillageLatitude() {
		return villageLatitude;
	}

	public void setVillageLatitude(String villageLatitude) {
		this.villageLatitude = villageLatitude;
	}

	public Long getVillageId() {
		return villageId;
	}

	public void setVillageId(Long villageId) {
		this.villageId = villageId;
	}

	public String getKaidian() {
		return kaidian;
	}

	public void setKaidian(String kaidian) {
		this.kaidian = kaidian;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getAreaLevel() {
		return areaLevel;
	}

	public void setAreaLevel(String areaLevel) {
		this.areaLevel = areaLevel;
	}

	public String getVillageType() {
		return villageType;
	}

	public void setVillageType(String villageType) {
		this.villageType = villageType;
	}

    public String getCurLongitude() {
        return curLongitude;
    }

    public void setCurLongitude(String curLongitude) {
        this.curLongitude = curLongitude;
    }

    public String getCurLatitude() {
        return curLatitude;
    }

    public void setCurLatitude(String curLatitude) {
        this.curLatitude = curLatitude;
    }
}
