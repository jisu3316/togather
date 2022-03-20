package team1.togather.model;

public class MemberSQL {
	final static String JOIN = "insert into MEMBER values(MEMBER_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?,?, default)";
	final static String LOGIN = "select * from MEMBER where phone= ?";
	final static String KAKAOLOGINCHECK = "select * from MEMBER where EMAIL= ?";
	final static String SELECT = "select * from MEMBER where phone= ?";
}
