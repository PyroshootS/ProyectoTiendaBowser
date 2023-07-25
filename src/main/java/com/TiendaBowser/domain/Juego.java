package com.TiendaBowser.domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "juego")
public class Juego implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_juego")
    private long id_juego;
    private String nombre;
    private String consola;
    private double precio;
    private int existencias;
    private String ruta_imagen;
    private boolean activo;

    @ManyToOne
    @JoinColumn(name = "id_categoria")
    Categoria categoria;

    public Juego() {
    }

    public Juego(String nombre, boolean activo) {
        this.nombre = nombre;
        this.activo = activo;
    }
}
