package servlet;

import bean.AwardRecord;
import daoImpl.AwardDaoImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Description:
 * @Author: redcomet
 * @Date: 2018-12-23-10:37
 */

public class LotteryServlet extends HttpServlet {


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/text; charset=utf-8");
        PrintWriter out = response.getWriter();

        String index = request.getParameter("index");
        String userId = request.getParameter("userid");

        AwardRecord record = new AwardRecord();
        record.setAwardIndex(Integer.parseInt(index));
        record.setUserId(userId);

        //查询奖品表的数量


        //修改奖品表的数量


        //登记获奖信息
        AwardDaoImpl awardDao = new AwardDaoImpl();
        awardDao.addAwardRecord(record);

        out.write("true");
        out.close();

    }
}
