import com.hear.util.MD5Util;
import org.junit.Test;

public class test {

    @Test
    public void test(){
        String s ="hefeng";
        System.out.println(MD5Util.MD5Encode(MD5Util.MD5Encode(s,"utf-8"),"utf-8"));
    }

}
