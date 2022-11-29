package com.example.ef_grupo_11.Servlets;

import com.example.ef_grupo_11.model.bean.Credenciales;
import com.example.ef_grupo_11.model.bean.Usuario;
import com.example.ef_grupo_11.model.daos.DaoUsuario;
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

        DaoUsuario daoUsuario = new DaoUsuario();

        HttpSession session;

        switch (action){

            case "iniciarSesion":

                String correoI = request.getParameter("correo");
                String password = request.getParameter("password");

                Credenciales credenciales = daoUsuario.validarIniciarSesion(correoI, password);

                if (credenciales != null){

                    Usuario usuario = daoUsuario.buscarUsuario(credenciales.getIdUsuario());

                    session = request.getSession();
                    session.setAttribute("usuarioSession", usuario);
                    response.sendRedirect(request.getContextPath()+"/Inicio");
                }

                break;
            case "registrarse":

                String password1 = request.getParameter("password1");
                String password2 = request.getParameter("password2");
                String correo = request.getParameter("correo");

                if (daoUsuario.validarCorreo(correo)){
                    if (password1.equals(password2)){

                        Usuario u = new Usuario();

                        u.setNombre(request.getParameter("nombre"));
                        u.setApellido(request.getParameter("apellido"));
                        u.setCorreo(correo);

                        int idUsuario = daoUsuario.registrarUsuario(u);
                        u.setIdUsuario(idUsuario);
                        daoUsuario.registrarCredenciales(u, password1);

                        response.sendRedirect(request.getContextPath()+"/Inicio");

                    }else {
                        session = request.getSession();
                        session.setAttribute("msgError", "Las contraseñas deben ser iguales");

                        response.sendRedirect(request.getContextPath()+"/?action=registrarse");
                    }
                }else {
                    session = request.getSession();
                    session.setAttribute("msgError", "El correo ingresado no está disponible");

                    response.sendRedirect(request.getContextPath()+"/?action=registrarse");
                }

                break;
        }

    }
}
