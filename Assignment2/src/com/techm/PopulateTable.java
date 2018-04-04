package com.techm;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;


@WebServlet("/PopulateTable")
public class PopulateTable extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public PopulateTable() {
        
    }
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<Long,Product> country=new HashMap<Long,Product>();
		HttpSession session=request.getSession();
		if(session.getAttribute("products")!=null) {
			System.out.println("if block");
			country=(Map<Long, Product>) session.getAttribute("products");	
		}else {
			System.out.println("else block");
			//country=FetchData.getAllCountries();
			session.setAttribute("products",country);
		}
		Gson gson = new Gson();
		JsonElement element = gson.toJsonTree(country.values(), new TypeToken<List<Product>>() {}.getType());

		JsonArray jsonArray = element.getAsJsonArray();
		response.setContentType("application/json");
		response.getWriter().print(jsonArray);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
