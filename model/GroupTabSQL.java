package team1.togather.model;

class GroupTabSQL {
	static final String GROUP_LIST = "select * from GROUPTAB order by GSEQ desc";
	static final String GROUP_SELECT = "select * from GROUPTAB where GSEQ=?";
	static final String GROUP_INSERT = "insert into GROUPTAB values(GROUPTAB_SEQ.nextval, ?, ?, ?, ?, ?, SYSDATE,?,?)";
	static final String GROUP_UPDATE = "update GROUPTAB set GLOC=?, GNAME=?, GINTRO=?, LIMIT=? WHERE GSEQ=?";
	static final String GROUP_DELETE = "delete from GROUPTAB where GSEQ=?";
	
	static final String GATHERING_INSERT = "insert into GATHERING values(GATHERING_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?)";
	static final String GATHERING_LIST = "select * from GATHERING where GSEQ=? order by GA_SEQ desc";
	static final String GATHERING_INFO = "select * from GATHERING where GSEQ=? and GA_SEQ=?";	
	static final String GATHERING_DELETE = "delete from GATHERING where GA_SEQ=?";
	static final String GATHERING_GET_UPDATE = "select * from GATHERING where GA_SEQ=?";
	static final String GATHERING_UPDATE = "update GATHERING set GA_NAME=?, GA_PLACE=?, PRICE=?, GA_LIMIT=? where GA_SEQ=?";
	
	static final String GROUP_SELECT_BY_MNUM = "select * from GROUPTAB where MNUM=?";
}
