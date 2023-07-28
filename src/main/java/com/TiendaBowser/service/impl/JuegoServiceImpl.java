package com.TiendaBowser.service.impl;

import com.TiendaBowser.dao.JuegoDao;
import com.TiendaBowser.domain.Juego;
import com.TiendaBowser.service.JuegoService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class JuegoServiceImpl implements JuegoService {

    //La anotación Autowired crea un único objeto sin hacer new.. y se mantiene
    @Autowired
    private JuegoDao juegoDao;

    @Override
    @Transactional(readOnly = true)
    public List<Juego> getJuegos(boolean activos) {
        var lista = juegoDao.findAll();
        if (activos) {
            lista.removeIf(e -> !e.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Juego getJuego(Juego juego) {
        return juegoDao.findById(juego.getIdJuego()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Juego juego) {
        juegoDao.save(juego);
    }

    @Override
    @Transactional
    public void delete(Juego juego) {
        juegoDao.delete(juego);
    }

    //Se implementa el metodo para recuperar los productos con una consulta ampliada
    @Override
    @Transactional(readOnly = true)
    public List<Juego> buscaJuegosPorPrecioEntre(double precioInf, double precioSup){
        return juegoDao.findByPrecioBetweenOrderByNombre(precioInf, precioSup);
    }

    @Override
    public List<Juego> consultaJPQL(double precioInf, double precioSup) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public List<Juego> consultaSQL(double precioInf, double precioSup) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
    
}
