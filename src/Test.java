import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import dao.IBoardDao;
import model.Board;

public class Test {
	public static void main(String[] args) {
/*		ApplicationContext context =
				new FileSystemXmlApplicationContext("/WebContent/WEB-INF/rootContext.xml");
		
		IBoardDao boardDao = context.getBean("mapperBoard", IBoardDao.class);
		
		for (int i = 0; i < 200; i++) {
			Board board = new Board();
			board.setContent(i+"글내용");
			board.setId_index(1);
			board.setTitle(i+" : 번째 글제목입니다");
			board.setWriter("asdf");
			boardDao.insertBoard(board);
		}
		*/
		
	}

}
