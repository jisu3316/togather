package team1.togather.model;

public class BoardSQL {
	final static String SELECT="select * from (select aa.*, rownum rnum from (select * from BOARD order by bnum desc) aa) where rnum > ? and rnum <= ? ";
	final static String SELECTWHOLE="select * from (select aa.*, rownum rnum from (select * from BOARD order by bnum desc) aa)";
}
