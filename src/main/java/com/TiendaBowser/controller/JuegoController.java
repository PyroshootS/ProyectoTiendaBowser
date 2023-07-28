package com.TiendaBowser.controller;

import com.TiendaBowser.domain.Juego;
import com.TiendaBowser.service.CategoriaService;
import com.TiendaBowser.service.JuegoService;
import com.TiendaBowser.service.FirebaseStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/juego")
public class JuegoController {

    @Autowired
    private JuegoService juegoService;
    
    @Autowired
    private CategoriaService categoriaService;

    @GetMapping("/listado")
    public String listado(Model model) {
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);
        
        var juegos = juegoService.getJuegos(false);
        model.addAttribute("juegos", juegos);
        model.addAttribute("totalJuegos", juegos.size());
        return "/juego/listado";
    }
    @GetMapping("/nuevo")
    public String juegoNuevo(Juego juego) {
        return "/juego/modifica";
    }

    @Autowired
    private FirebaseStorageService firebaseStorageService;
    
    @PostMapping("/guardar")
    public String juegoGuardar(Juego juego,
            @RequestParam("imagenFile") MultipartFile imagenFile) {        
        if (!imagenFile.isEmpty()) {
            juegoService.save(juego);
            juego.setRuta_imagen(
                    firebaseStorageService.cargaImagen(
                            imagenFile, 
                            "juego", 
                            juego.getIdJuego()));
        }
        juegoService.save(juego);
        return "redirect:/juego/listado";
    }

    @GetMapping("/eliminar/{idJuego}")
    public String juegoEliminar(Juego juego) {
        juegoService.delete(juego);
        return "redirect:/juego/listado";
    }

    @GetMapping("/modificar/{idJuego}")
    public String juegoModificar(Juego juego, Model model) {
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);
        
        juego = juegoService.getJuego(juego);
        model.addAttribute("juego", juego);
        return "/juego/modifica";
    }
}