package com.TiendaBowser.dao;

import com.TiendaBowser.domain.Categoria;
import org.springframework.data.jpa.repository.JpaRepository;


public interface CategoriaDao extends JpaRepository<Categoria, Long>{
    
}
