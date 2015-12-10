package java76.pms.dao;

import java.util.HashMap;
import java.util.List;

import java76.pms.domain.Board;
import java76.pms.domain.Project;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ProjectDao {
  @Autowired
  SqlSessionFactory sqlSessionFactory;
  
  public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
    this.sqlSessionFactory = sqlSessionFactory;
  }
  
  public ProjectDao() {}

  public Project selectOne(int no) {
    SqlSession sqlSession = sqlSessionFactory.openSession(true);
    
    try {
      return sqlSession.selectOne("java76.pms.dao.ProjectDao.selectOne", no);
    } finally {
      try {sqlSession.close();} catch(Exception e) {}
    }
  }
  
  
  public List<Project> selectList(int pageNo, int pageSize, String keyword, String align) {
    SqlSession sqlSession = sqlSessionFactory.openSession();

    try {
      HashMap<String, Object> map = new HashMap<>();
      map.put("startIndex", (pageNo - 1) * pageSize);
      map.put("size", pageSize);
      map.put("keyword", keyword);
      map.put("align", align);
      return sqlSession.selectList("java76.pms.dao.ProjectDao.selectList", map);
    } finally {
      try {sqlSession.close();} catch (Exception e) {}
    }
  }

  public int insert(Project project) {
    SqlSession sqlSession = sqlSessionFactory.openSession(true);
    try {
      return sqlSession.insert("java76.pms.dao.ProjectDao.insert", project);
    } finally {
      try {sqlSession.close();} catch (Exception e) {}
    }
  }

  public int delete(int no) {
    SqlSession sqlSession = sqlSessionFactory.openSession(true);
    try {
      return sqlSession.delete("java76.pms.dao.ProjectDao.delete", no);
    } finally {
      try {sqlSession.close();} catch (Exception e) {}
    }
  }
  
  public int update(Project project) {
    SqlSession sqlSession = sqlSessionFactory.openSession(true);
    try {
      return sqlSession.update("java76.pms.dao.ProjectDao.update", project);
    } finally {
      try {sqlSession.close();} catch (Exception e) {}
    }
  }
}
