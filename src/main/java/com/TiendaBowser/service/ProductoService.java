package com.TiendaBowser.service;

import com.TiendaBowser.domain.Producto;
import java.util.List;

public interface ProductoService {

    //El siguiente método retorna una lista con las productos
    //Que están en la tabla producto, todas o sólo los activas
    public List<Producto> getProductos(boolean activos);
    
    //Acá siguen los métodos para hacer un CRUD de la tabla producto
   // Se obtiene un Producto, a partir del id de un producto
    public Producto getProducto(Producto producto);
    
    // Se inserta un nuevo producto si el id del producto esta vacío
    // Se actualiza un producto si el id del producto NO esta vacío
    public void save(Producto producto);
    
    // Se elimina el producto que tiene el id pasado por parámetro
    public void delete(Producto producto);
    
    // Se enuncia un metodo para recuperar los productos con una consulta ampliada
    public List<Producto> buscaProductosPorPrecioEntre(double precioInf, double precioSup);
    
        // Se enuncia un metodo para recuperar los productos con una consulta JPQL
    public List<Producto> consultaJPQL(double precioInf, double precioSup);
    
            // Se enuncia un metodo para recuperar los productos con una consulta SQL
    public List<Producto> consultaSQL(double precioInf, double precioSup);
}