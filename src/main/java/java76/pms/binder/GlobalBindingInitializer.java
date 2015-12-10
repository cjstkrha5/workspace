package java76.pms.binder;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.InitBinder;

@ControllerAdvice
public class GlobalBindingInitializer {
  private static final Logger logger =
      Logger.getLogger(GlobalBindingInitializer.class); 

  /*
        문자열로 넘어온 요청 파라미터 값을 Date 객체로 바꿔주는 변환기 등록하기
    - @InitBinder 애노테이션을 변환기 등록 메서드에 붙인다.
    - 그러면 프론트 컨트롤러는 요청핸들러를 호출하기 전에 먼저 
      @InitBinder가 붙은 메소드를 호출한다.
    - @InitBinder를 붙일 메서드의 시그너쳐(signature : 메서드의 파라미터 및 리턴 형식)
      void 메서드명(WebDataBinder binder) {}
    - 바인터(binder)?
            특정 타입에 대해 변환기를 연결한다는 의미
  */
  /*
        다음과 같이 각 페이지 컨트롤러에 파라미터 변환기를 등록하는 코드를 넣을 수 있다
        또는 @ControllerAdvice 애노테이션으로 별개의 클래스로 분리하여 저장할 수 있다
        예) examweb/binder/GlobalBindingInitializer
  */
  @InitBinder
  public void initBinder(WebDataBinder binder) {
    logger.debug("initBinder() 호출됨");
    // 변환기 준비 : 문자열(java.lang.String) ----> 날짜 객체(java.util.Date)
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    dateFormat.setLenient(false); // set관대하게()
      
    // 프론트 컨트롤러가 넘겨준 관리대장(WebDataBinder)에 기록한다.
    binder.registerCustomEditor(
      Date.class, // target type - 문자열을 이 타입의 객체로 바꿔야 한다 
      // 변환기(실제 변환 작업을 할 객체, null 허용 여부);
      new CustomDateEditor(dateFormat, false)); 
  }
}
