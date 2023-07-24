package com.TiendaBowser.dao;

import com.tienda.domain.Producto;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface ProductoDao extends JpaRepository<Producto, Long>{
    //Ejemplo de metodo utilizando       CONSULTAS AMPLIADAS
    
    public List <Producto> findByPrecioBetweenOrderByDescripcion(double precioInf, double precioSup);
    //se refiere a la tabla de domain
    @Query(value="SELECT a FROM Producto a WHERE a.precio BETWEEN :precioInf AND :precioSup ORDER BY a.descripcion ASC")
    public List<Producto> consultaJPQL(double precioInf,double precioSup); 
    
    @Query(nativeQuery=true, value="SELECT * FROM producto a WHERE a.precio BETWEEN :precioInf AND :precioSup ORDER BY a.descripcion ASC")
    public List<Producto> consultaSQL(double precioInf,double precioSup); 
}
