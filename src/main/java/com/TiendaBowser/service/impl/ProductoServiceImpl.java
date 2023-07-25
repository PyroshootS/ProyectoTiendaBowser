package com.TiendaBowser.service.impl;

import com.TiendaBowser.dao.ProductoDao;
import com.TiendaBowser.domain.Producto;
import com.TiendaBowser.service.ProductoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductoServiceImpl implements ProductoService {

    //La anotación Autowired crea un único objeto sin hacer new.. y se mantiene
    @Autowired
    private ProductoDao productoDao;

    @Override
    @Transactional(readOnly = true)
    public List<Producto> getProductos(boolean activos) {
        var lista = productoDao.findAll();
        if (activos) {
            lista.removeIf(e -> !e.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Producto getProducto(Producto producto) {
        return productoDao.findById(producto.getIdProducto()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Producto producto) {
        productoDao.save(producto);
    }

    @Override
    @Transactional
    public void delete(Producto producto) {
        productoDao.delete(producto);
    }

    //Se implementa el metodo para recuperar los productos con una consulta ampliada
    @Override
    @Transactional(readOnly = true)
    public List<Producto> buscaProductosPorPrecioEntre(double precioInf, double precioSup){
        return productoDao.findByPrecioBetweenOrderByDescripcion(precioInf, precioSup);
    }
    
     //Se implementa el metodo para recuperar los productos con una consulta JPQL
    @Override
    @Transactional(readOnly = true)
    public List<Producto>consultaJPQL(double precioInf, double precioSup){
        return productoDao.consultaJPQL(precioInf, precioSup);
    }
    
    @Override
    @Transactional(readOnly = true)
    public List<Producto>consultaSQL(double precioInf, double precioSup){
        return productoDao.consultaSQL(precioInf, precioSup);
    }
}
