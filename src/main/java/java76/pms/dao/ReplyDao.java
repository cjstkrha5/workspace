package java76.pms.dao;

import java.util.List;
import java.util.Map;

import java76.pms.domain.Reply;

public interface ReplyDao {

  List<Reply> selectList(String name);

  int insert(Map<String, Object> paramMap);

  int delete(int no);

  int update(Reply reply);
}
