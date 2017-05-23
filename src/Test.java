import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Test {
	public static void main(String[] args) {
		ApplicationContext context =
				new FileSystemXmlApplicationContext("/WebContent/WEB-INF/rootContext.xml");
		
	}

}
