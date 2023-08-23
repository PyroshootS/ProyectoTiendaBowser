package com.TiendaBowser.dao;

import com.TiendaBowser.domain.Juego;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface JuegoDao extends JpaRepository<Juego, Long>{
    //Ejemplo de metodo utilizando       CONSULTAS AMPLIADAS
    
    public List <Juego> findByPrecioBetweenOrderByNombre(double precioInf, double precioSup);
    //se refiere a la tabla de domain
    @Query(value="SELECT a FROM Juego a WHERE a.precio BETWEEN :precioInf AND :precioSup ORDER BY a.nombre ASC")
    public List<Juego> consultaJPQL(double precioInf,double precioSup); 
    
    @Query(nativeQuery=true, value="SELECT * FROM juego a WHERE a.precio BETWEEN :precioInf AND :precioSup ORDER BY a.nombre ASC")
    public List<Juego> consultaSQL(double precioInf,double precioSup); 
}
