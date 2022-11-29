package com.example.ef_grupo_11.Servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SessionServlet", value = "/")
public class SessionServlet extends HttpServlet {
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

        String action = request.getParameter("action") == null? "iniciarSesion":request.getParameter("action");

        switch (action){

            case "iniciarSesion":

                String correoI = request.getParameter("correo");
                String password = request.getParameter("password");

                //Validar correo y contraseña en base de datos

                break;
            case "registrarse":

                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String correoR = request.getParameter("correo");
                String password1 = request.getParameter("password1");
                String password2 = request.getParameter("password2");

                if (!password1.equals(password2)){

                }

                break;
        }

    }
}
