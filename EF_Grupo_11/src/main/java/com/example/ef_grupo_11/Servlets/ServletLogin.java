package com.example.ef_grupo_11.Servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletLogin", value = "/")
public class ServletLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "iniciarSesion":request.getParameter("action");

        RequestDispatcher vista;

        switch (action){

            case "iniciarSesion":

                vista = request.getRequestDispatcher("login.jsp");
                vista.forward(request, response);

                break;

            case "registrarse":

                vista = request.getRequestDispatcher("registrarse.jsp");
                vista.forward(request, response);

                break;

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
