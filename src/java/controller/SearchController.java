/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryData;
import model.ProductData;
import model.Products;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author linhphan
 */
@Controller
public class SearchController {
    @RequestMapping(value="/search", method = RequestMethod.POST)
    public String search(HttpServletRequest request, HttpServletResponse response, ModelMap mm) throws IOException {
        
        request.setCharacterEncoding("utf-8");
        if(request.getParameter("text").equals(""))
            response.sendRedirect(request.getContextPath() +"/home");
        try {
            
            String text = request.getParameter("text");
            ArrayList<Products> pList = ProductData.getProductSearch(text) ;
            mm.put("productList", pList) ;
            int num = pList.size() ;
            String kq="" ;
            if(num==0)
                kq = "Không tìm thấy kết quả nào!" ;
            else
                kq = "Có " +num+ " kết quả tìm kiếm" ;
            
            mm.put("resultPage", kq ) ;
            mm.put("categoryList", CategoryData.getCategoryList()) ;
            
        }
        catch(Exception e) {
            response.sendRedirect(request.getContextPath() +"/home");
        }
        
        return "jsp/index" ;
    }
    
    @RequestMapping(value="/search-ajax")
    public void searchAjax(HttpServletRequest request, HttpServletResponse response, ModelMap mm) throws IOException {
        
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String output ="" ;
        try {
            String keyword = request.getParameter("key");
            ArrayList<Products> pList = ProductData.getProductSearch(keyword) ;
            
            PrintWriter out = response.getWriter() ;

            
            if(pList.size()==0) {
                out.println("<li>Không tìm thấy kết quả nào!<li>");
            }
            else if(keyword.equals("")) {
                
            }
            else {
                for(Products pro : pList) {
                    out.println("<li> <a href='"+request.getContextPath()+"/product/detail?productId="+pro.getPID()+"'>"+pro.getPName()+"</a> <img src='"+request.getContextPath()+"/resources/images/"+pro.getImg()+"' width=\"35\" /> </li>") ;    
                }
            }
           
        }
        catch(Exception e) {
            response.sendRedirect(request.getContextPath()+"/home");
        }
        
    }
}
