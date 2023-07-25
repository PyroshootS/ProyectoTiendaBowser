package com.TiendaBowser.service.impl;

import com.TiendaBowser.dao.CategoriaDao;
import com.TiendaBowser.domain.Categoria;
import com.TiendaBowser.service.CategoriaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service
public class CategoriaServiceImpl implements CategoriaService{
    
    //La anotación Autowired crea un único objeto sin hacer new.. y se mantiene
    @Autowired
    private CategoriaDao categoriaDao;

   @Override
    @Transactional(readOnly = true)
    public List<Categoria> getCategorias(boolean activos) {
        var lista = categoriaDao.findAll();
        if (activos) {
            lista.removeIf(e -> !e.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Categoria getCategoria(Categoria categoria) {
        return categoriaDao.findById(categoria.getIdCategoria()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Categoria categoria) {
        categoriaDao.save(categoria);
    }

    @Override
    @Transactional
    public void delete(Categoria categoria) {
        categoriaDao.delete(categoria);
    }

}