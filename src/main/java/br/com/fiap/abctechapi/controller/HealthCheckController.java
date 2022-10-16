package br.com.fiap.abctechapi.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * @author marcos
 */
@RestController
@RequestMapping("/")
public class HealthCheckController {
    @GetMapping("version")
    public ResponseEntity<String> status() throws IOException {
        Properties props = new Properties();
        InputStream inputStream = getClass().getClassLoader().getResourceAsStream("application.yaml");
        props.load(inputStream);
        return ResponseEntity.ok(
                props.getProperty("build.name")
                + " - "
                + props.getProperty("build.version")
        );
    }
}
