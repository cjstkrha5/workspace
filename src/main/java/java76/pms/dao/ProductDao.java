package java76.pms.dao;

import java.util.List;
import java.util.Map;

import java76.pms.domain.Product;

public interface ProductDao {

  List<Product> selectList(Map<String, Object> paramMap);

  int insert(Product product);

  int delete(int no);

  int update(Product product);

  List<Product> search(Map<String, Object> paramMap);
  
  Product selectOne(int no);
  
  int rent(Map<String, Object> paramMap);
  
  int returnProduct(Map<String, Object> paramMap);
  
  int reply(Map<String, Object> paramMap);

  
}
