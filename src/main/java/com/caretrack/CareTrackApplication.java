package com.caretrack;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class CareTrackApplication {

    public static void main(String[] args) {
        SpringApplication.run(CareTrackApplication.class, args);
        System.out.println("==================================================");
        System.out.println(" CareTrack - Hospital Care System Started Successfully!");
        System.out.println(" URL: http://localhost:8080");
        System.out.println("==================================================");
    }
}
