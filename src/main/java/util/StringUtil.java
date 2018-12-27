package util;



import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.text.DecimalFormat;
import java.util.Arrays;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

public class StringUtil {


    /**
     * 左边补足0
     * @param s 字符串
     * @return 补足0后的字符串
     */
    public static String addZeroLeft(String s, int count) {
        if (s.length() >= count) {
            return s;
        }
        String format = "%0" + count + "d";
        String result = String.format(format, Long.valueOf(s));
        return result;
    }

    public static boolean isEmpty(String s) {
        if (s == null || "".equals(s.trim())) {
            return true;
        } else {
            return false;
        }
    }

    /**
     * 右边边补足0
     * @param s 字符串
     * @return 补足0后的字符串
     */
    public static String addZeroRight(String s, int count) {
        if (s.length() >= count) {
            return s;
        }
        String format = "%0" + (count - s.length()) + "d";
        String result = String.format(format, 0);
        return s + result;
    }



    /**
     * 把金额变换为小数点取两位
     * @param s 对象
     * @return 字符串
     */
    public static String getDecimalString(BigDecimal s) {
        DecimalFormat df = new DecimalFormat("0.00");
        String value = df.format(s).toString();
        return value;
    }

    /**
     * 获取UUID
     * @return
     */
    public static String getStringSeq() {
        UUID uuid = UUID.randomUUID();
        return uuid.toString().replaceAll("-", "").toUpperCase();
    }






}
