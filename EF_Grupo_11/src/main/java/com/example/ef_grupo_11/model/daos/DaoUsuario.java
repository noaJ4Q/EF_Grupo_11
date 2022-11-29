package com.example.ef_grupo_11.model.daos;

import com.example.ef_grupo_11.model.bean.Credenciales;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DaoUsuario extends DaoBase{

    public Credenciales validarIniciarSesion(String correo, String password){

        Credenciales credenciales = null;
        String sql = "select * from credenciales where correo = and hashedPassword = sha2(?, 512)";

        try(Connection conn = this.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql)){

            pstmt.setString(1, correo);
            pstmt.setString(2, password);

            try(ResultSet rs = pstmt.executeQuery()){
                if (rs.next()){

                    credenciales = new Credenciales();
                    credenciales.setIdUsuario(rs.getInt(1));
                    credenciales.setCorreo(rs.getString(2));
                    credenciales.setHashedPassword(rs.getString(3));

                }
            }

        }catch (SQLException e){
            e.getStackTrace();
        }
        return credenciales;
    }

}
