package com.TiendaBowser.controller;

import com.TiendaBowser.service.ReporteService;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/reportes")
public class ReporteController {

    @Autowired
    ReporteService reporteService;

    @GetMapping("/principal")
    public String principal(Model model) {
        return "/reportes/principal";
    }
    @GetMapping("/juegos")
    public ResponseEntity<Resource> juegos(@RequestParam String tipo) throws IOException {
        var reporte = "juegos";
        return reporteService.generaReporte(reporte, null, tipo);
    }
    @GetMapping("/ventas")
    public ResponseEntity<Resource> ventas(@RequestParam String tipo) throws IOException {
        var reporte = "ventas";
        return reporteService.generaReporte(reporte, null, tipo);
    }
}
