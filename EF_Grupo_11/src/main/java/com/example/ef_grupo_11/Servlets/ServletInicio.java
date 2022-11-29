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
        action = (action == null) ? "listar" : action;
        RequestDispatcher requestDispatcher;
        String idIncidencia;
        HttpSession session = request.getSession();
        switch (action) {
            case "registrarImpresion3D":
                requestDispatcher = request.getRequestDispatcher("UsuarioInicio.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "registrarCorteLaser":
                requestDispatcher = request.getRequestDispatcher("UsuarioEditarPerfil.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "registrarEscaneo3D":
                HttpSession sessionUsuario = request.getSession();
                Usuarios user = (Usuarios) sessionUsuario.getAttribute("usuarioSession");
                request.setAttribute("listaIncidenciasDestacadas", daoIncidencias.incidenciasDestXUser("" + user.getIdUsuarios() + ""));
                requestDispatcher = request.getRequestDispatcher("UsuarioMisIncidencias.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "registrarIncidencia":
                requestDispatcher = request.getRequestDispatcher("registrarServicio.jsp");
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
            case "verIncidencia":

                idIncidencia = request.getParameter("id");
                incidencia = daoIncidencias.buscarPorId(idIncidencia);
                HttpSession sessionUsuario2 = request.getSession();
                Usuarios user2 = (Usuarios) sessionUsuario2.getAttribute("usuarioSession");
                comentario = daoComentarios.buscarporIdIncidencia_y_idUsuarioQueCreo(idIncidencia, String.valueOf(user2.getIdUsuarios()));


                if (incidencia != null) { //abro el form para editar
                    request.setAttribute("comentario2", comentario);
                    request.setAttribute("incidencia_send_jsp", incidencia);
                    requestDispatcher = request.getRequestDispatcher("UsuarioVerIncidencia.jsp");
                    requestDispatcher.forward(request, response);
                } else { //id no encontrado
                    response.sendRedirect(request.getContextPath() + "/Inicio?action=listar");
                }
                break;

            case "page":
                idPage = Integer.parseInt(request.getParameter("id"));
                setListaPaginada(daoIncidencias.paginarIncidencias(idPage));
                request.setAttribute("listaIncidenciasPermanente", getListaPermanente());
                request.setAttribute("listaIncidenciasPaginada", getListaPaginada());

                requestDispatcher = request.getRequestDispatcher("UsuarioInicio.jsp");
                requestDispatcher.forward(request, response);

                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
