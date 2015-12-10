package java76.pms.dao;

import java.util.List;
import java.util.Map;

import java76.pms.domain.Member;

public interface MemberDao {

  List<Member> selectList(Map<String, Object> paramMap);

  int insert(Member member);

  int delete(Map<String, Object> paramMap);

  int update(Member member);

  Member selectOne(String id);
  
  Member login(Map<String, Object> paramMap);
  
  int rent(Map<String, Object> paramMap);
  
  int returnProduct(Map<String, Object> paramMap);
  
  List<Member> search(String name);

  int updateRecord(Map<String, Object> paramMap);
}
