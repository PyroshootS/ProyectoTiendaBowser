package com.TiendaBowser.controller;

import com.TiendaBowser.domain.Categoria;
import com.TiendaBowser.service.CategoriaService;
import com.TiendaBowser.service.FirebaseStorageService;
import com.TiendaBowser.service.JuegoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/pruebas")
public class PruebasController {

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
        return "/pruebas/listado";
    }

    @GetMapping("/listado/{idCategoria}")
    public String listado(Categoria categoria, Model model) {
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);

        var juegos = categoriaService.getCategoria(categoria).getJuegos();
        model.addAttribute("juegos", juegos);
        model.addAttribute("totalJuegos", juegos.size());
        return "/pruebas/listado";
    }

    @GetMapping("/listado2")
    public String listado2(Model model) {
        var juegos = juegoService.getJuegos(false);
        model.addAttribute("juegos", juegos);
        model.addAttribute("totalJuegos", juegos.size());
        return "/pruebas/listado2";
    }

    @PostMapping("/query1")
    public String consultaQuery1(@RequestParam(value = "precioInf") double precioInf,
            @RequestParam(value = "precioSup") double precioSup, Model model) {
        var juegos = juegoService.buscaJuegosPorPrecioEntre(precioInf, precioSup);
        model.addAttribute("juegos", juegos);
        model.addAttribute("precioInf", precioInf);
        model.addAttribute("precioSup", precioSup);
        model.addAttribute("totalJuegos", juegos.size());
        return "/pruebas/listado2";
    }
    
    @PostMapping("/query2")
    public String consultaQuery2(@RequestParam(value = "precioInf") double precioInf,
            @RequestParam(value = "precioSup") double precioSup, Model model) {
        var juegos = juegoService.consultaJPQL(precioInf, precioSup);
        model.addAttribute("juegos", juegos);
        model.addAttribute("precioInf", precioInf);
        model.addAttribute("precioSup", precioSup);
        model.addAttribute("totalJuegos", juegos.size());
        return "/pruebas/listado2";
    }
    
    @PostMapping("/query3")
    public String consultaQuery3(@RequestParam(value = "precioInf") double precioInf,
            @RequestParam(value = "precioSup") double precioSup, Model model) {
        var juegos = juegoService.consultaSQL(precioInf, precioSup);
        model.addAttribute("juegos", juegos);
        model.addAttribute("precioInf", precioInf);
        model.addAttribute("precioSup", precioSup);
        model.addAttribute("totalJuegos", juegos.size());
        return "/pruebas/listado2";
    }
}
