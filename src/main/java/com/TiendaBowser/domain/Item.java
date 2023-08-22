package com.TiendaBowser.domain;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Item extends Juego {
    private int cantidad; //Almacenar la cantidad de items de un juego

    public Item() {
    }

    public Item(Juego juego) {
        super.setIdJuego(juego.getIdJuego());
        super.setCategoria(juego.getCategoria());
        super.setNombre(juego.getNombre());
        super.setConsola(juego.getConsola());
        super.setPrecio(juego.getPrecio());
        super.setExistencias(juego.getExistencias());
        super.setActivo(juego.isActivo());
        super.setRuta_imagen(juego.getRuta_imagen());
        this.cantidad = 0;
    }
}