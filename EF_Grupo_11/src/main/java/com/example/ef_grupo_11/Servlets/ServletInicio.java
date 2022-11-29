package com.example.ef_grupo_11.Servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

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
            case "ListaServicios":
                requestDispatcher = request.getRequestDispatcher("ListaServicios.jsp");
                requestDispatcher.forward(request, response);
                break;

            case "registrarCorteLaser":
                requestDispatcher = request.getRequestDispatcher("RegistrarCorte.jsp");
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
        String action = request.getParameter("action");
        switch (action) {
            case "guardarImpresion":
                InputStream inputStream; // input stream of the upload file
                String idusuario = request.getParameter("id");
                String nombre = request.getParameter("nombre");
                String descripcion = request.getParameter("descripcion");
                String tipo = request.getParameter("tipo");
                String nivel = request.getParameter("nivel");
                String zona = request.getParameter("zona");
                Part filePart = request.getPart("foto1");
                inputStream = filePart.getInputStream();
                if (filePart != null) {
                    // prints out some information for debugging
                    System.out.println(filePart.getContentType());

                    // obtains input stream of the upload file
                    inputStream = filePart.getInputStream();
                }
                /*
                usuario = daoUsuarios.buscarPorId(idusuario);
                incidencias.setUsuario(usuario);
                incidencias.setNombre(nombre);
                incidencias.setDescripcion(descripcion);
                incidencias.setDestacado(1);
                incidencias.setTipo(tipo);
                incidencias.setUrgencia(nivel);
                zonaPucp = daoZonaPucp.obtenerXId(zona);
                incidencias.setZonaPucp(zonaPucp);
                LocalDateTime myDateObj = LocalDateTime.now();
                DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                String formattedDate = myDateObj.format(myFormatObj);
                incidencias.setDatetime(formattedDate);
                incidencias.setAnonimo(0);
                incidencias.setEstadoIncidencia("Registrado");
                daoIncidencias.guardarIncidencias(incidencias, inputStream);
                */
                response.sendRedirect(request.getContextPath() + "/Inicio?action=misIncidencias");
                break;
        }

    }
}
