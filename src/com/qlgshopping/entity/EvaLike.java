package com.qlgshopping.entity;
/**
 * 评论点赞的实体类
 * @author Administrator
 *
 */
public class EvaLike {
private int likeId;
private int likeFrom;
private int likeFor;
private UserInfo user;
private Evalute evalute;

public Evalute getEvalute() {
	return evalute;
}
public void setEvalute(Evalute evalute) {
	this.evalute = evalute;
}
public UserInfo getUser() {
	return user;
}
public void setUser(UserInfo user) {
	this.user = user;
}
public int getLikeId() {
	return likeId;
}
public void setLikeId(int likeId) {
	this.likeId = likeId;
}
public int getLikeFrom() {
	return likeFrom;
}
public void setLikeFrom(int likeFrom) {
	this.likeFrom = likeFrom;
}
public int getLikeFor() {
	return likeFor;
}
public void setLikeFor(int likeFor) {
	this.likeFor = likeFor;
}
@Override
public String toString() {
	return "EvaLike [likeId=" + likeId + ", likeFrom=" + likeFrom
			+ ", likeFor=" + likeFor + "]";
}

}
