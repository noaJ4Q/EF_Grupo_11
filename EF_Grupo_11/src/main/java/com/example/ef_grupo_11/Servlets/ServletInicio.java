package com.example.ef_grupo_11.Servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ServletInicio", value = "/Inicio")
public class ServletInicio extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
        String action = request.getParameter("action");
        action = (action == null) ? "registrarServicio" : action;
        RequestDispatcher requestDispatcher;
        String idIncidencia;
        HttpSession session = request.getSession();
        switch (action) {
            case "registrarImpresion3D":

                requestDispatcher = request.getRequestDispatcher("RegistrarImpresion.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "registrarCorteLaser":
                requestDispatcher = request.getRequestDispatcher("RegistrarCorteLaser.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "registrarEscaneo3D":
                HttpSession sessionUsuario = request.getSession();
               // request.setAttribute("listaIncidenciasDestacadas", .incidenciasDestXUser("" + user.getIdUsuarios() + ""));
                requestDispatcher = request.getRequestDispatcher("RegistrarEscaneo.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "registrarServicio":
                requestDispatcher = request.getRequestDispatcher("RegistrarServicio.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "ListaServicios":
                requestDispatcher = request.getRequestDispatcher("RegistrarServicio.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "cerrarSesion":
                session.invalidate();
                response.sendRedirect(request.getContextPath());
                /*
                requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
                */
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
