package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.LuceneWrapper;
import model.Result;

public class LuceneServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response){
		processRequest(request, response);
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		processRequest(request, response);
	}
	
	public void processRequest(HttpServletRequest request, HttpServletResponse response){
		try {
			LuceneWrapper lw = new LuceneWrapper();
			ArrayList<Result> results = (ArrayList<Result>) lw.search(request.getParameter("queryTxt"));
			
			request.setAttribute("results", results);
			
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ServletException e) {
			e.printStackTrace();
		}
	}

}
