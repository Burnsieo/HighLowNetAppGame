package controllers;

import java.io.IOException;
import java.text.NumberFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Die;

/**
 * Servlet implementation class DiceServlet
 */
@WebServlet(		description = "Servlet which controls the behavior of rolling and betting", 
urlPatterns = { 
		"/DiceServlet", 
		"/doCalculate"
})
public class DiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//maybe move the majority of this code to another model class, where this method would
		//call the constructor of that class with bet passed as a parameter, which would then 
		//call the Die.java constructor
		NumberFormat f = NumberFormat.getNumberInstance();
		f.setMaximumFractionDigits(2);
		Die die1 = new Die();
		Die die2 = new Die();
		int die1Value = die1.getValue();
		int die2Value = die2.getValue();
		double balance = Double.parseDouble(request.getParameter("balance"));
		f.format(balance);
		int count = Integer.parseInt(request.getParameter("count"));
		count ++;
		
		int sum = die1Value + die2Value;
		double betAmount = Double.parseDouble(request.getParameter("betAmount"));
		String bet = request.getParameter("bet");
		String url = "";
		double winAmount;
		f.format(betAmount);
		
		if(bet.equals("Low") && sum >= 2 && sum <= 6) {
			url = "/Win.jsp";
			winAmount = betAmount;
			f.format(winAmount);
			balance = balance + winAmount;
		}
		else if(bet.equals("High") && sum > 7) {
			url = "/Win.jsp";
			winAmount = betAmount;
			f.format(winAmount);
			balance = balance + winAmount;
		}
		else if(bet.equals("Seven") && sum == 7) {
			url = "/Win.jsp";
			winAmount = betAmount * 2;
			f.format(winAmount);
			balance = balance + winAmount;
		}
		else {
			url = "/Lose.jsp";
			winAmount = -1 * betAmount;
			f.format(winAmount);
			balance = balance + winAmount;
		}
		//String html = "Sum is: " + sum + " user picked: " + bet + " You won/lost $" + winAmount + " This is your " + count + " roll";
		//request.setAttribute("html", html);
		request.setAttribute("die1Value", die1Value);
		request.setAttribute("die2Value", die2Value);
		request.setAttribute("balance", balance);
		request.setAttribute("count", count);
		request.setAttribute("winAmount", winAmount);
		request.setAttribute("betAmount", betAmount);
		request.setAttribute("bet", bet);
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
	}

}
