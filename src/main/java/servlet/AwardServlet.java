package servlet;

import bean.Award;
import bean.AwardRecord;
import daoImpl.AwardDaoImpl;
import util.JSON;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Description: 奖品管理Servlet
 * @Author: redcomet
 * @Date: 2018-12-23-21:55
 */

public class AwardServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/text; charset=utf-8");

        String opt = request.getParameter("opt");
        String userId = request.getParameter("userid");

        System.out.println("AwardServlet opt:" + opt);
        AwardDaoImpl awardDao = new AwardDaoImpl();

        if (null != opt && "search".equals(opt) ) {
            //查询奖品表的数据
            List<Award> list = awardDao.findAllAwards();
            Map<String, Object> result = new HashMap<>();
            result.put("code", 0);
            result.put("count", 100);
            result.put("data", list);
            response.getWriter().write(JSON.Encode(result));
        }
        else if (null != opt && "updateStock".equals(opt)){
            String stock = request.getParameter("stock");
            String index = request.getParameter("index");

            Award award = awardDao.findAwardByIndex(Integer.parseInt(index));
            award.setStock(Integer.parseInt(stock));
            System.out.println("awardName:" + award.getAwardName() + "stock:"+ stock);
            awardDao.updateAward(award);
        }
        else if (null != opt && "searchRecord".equals(opt)){
            List<AwardRecord> list = awardDao.findAllAwardRecords();
            Map<String, Object> result = new HashMap<>();
            result.put("code", 0);
            result.put("count", 100);
            result.put("data", list);
            response.getWriter().write(JSON.Encode(result));
        }
        else if (null != opt && "updateRecord".equals(opt)){
            String stock = request.getParameter("stock");
            String index = request.getParameter("id");

            AwardRecord record = awardDao.findAwardRecordById(Integer.parseInt(index));
            record.setFinished("1");
            System.out.println("updateRecord:" + "index:"+ index);
            awardDao.updateAwardRecord(record);
           // response.getWriter().write(JSON.Encode(result));
        }
    }
}
