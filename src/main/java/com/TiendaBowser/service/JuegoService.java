package com.TiendaBowser.service;

import com.TiendaBowser.domain.Juego;
import java.util.List;

public interface JuegoService {
    
    //El siguiente metodo retorna una lista con las juegos
    //Que estan es la tabla juego, todas o solo las activas
    public List<Juego> getJuegos(boolean avtivos);
    
    //Aca siguen los metodos para hacer un CRUD de la tabla juego
     // Se obtiene un Juego, a partir del id de un juego
    public Juego getJuego(Juego juego);
    
    // Se inserta un nuevo juego si el id del juego esta vacío
    // Se actualiza un juego si el id del juego NO esta vacío
    public void save(Juego juego);
    
    // Se elimina el juego que tiene el id pasado por parámetro
    public void delete(Juego juego);
    
    //Se enuncia un metodo para recuperar los juegos con una consulta ampliada
    public List<Juego>buscaJuegosPorPrecioEntre(double precioInf, double precioSup);
    
     //Se enuncia un metodo para recuperar los juegos con una consulta JPQL
    public List<Juego>consultaJPQL(double precioInf, double precioSup);
    
     //Se enuncia un metodo para recuperar los juegos con una consulta JPQL
    public List<Juego>consultaSQL(double precioInf, double precioSup);
}
