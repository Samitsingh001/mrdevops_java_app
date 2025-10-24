package com.minikube.sample.rest.controller;

import com.minikube.sample.properties.PropertiesConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author Gorantla, Eresh
 * @created 06-12-2018
 */
@RestController
@RequestMapping("/home")
public class HomeResource {

    private final PropertiesConfig config;

    @Autowired
    public HomeResource(PropertiesConfig config) {
        this.config = config;
    }

    @GetMapping("/data")
    public ResponseEntity<ResponseData> getData() {
        ResponseData responseData = new ResponseData();
        responseData.setId(1);
        responseData.setName(config.getName());
        responseData.setPlace("Hyderabad");
        responseData.setValue(config.getTest());
        return new ResponseEntity<>(responseData, HttpStatus.OK);
    }

    public static class ResponseData {
        private String name;
        private Integer id;
        private String place;
        private String value;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public Integer getId() {
            return id;
        }

        public void setId(Integer id) {
            this.id = id;
        }

        public String getPlace() {
            return place;
        }

        public void setPlace(String place) {
            this.place = place;
        }

        public String getValue() {
            return value;
        }

        public void setValue(String value) {
            this.value = value;
        }
    }
}
