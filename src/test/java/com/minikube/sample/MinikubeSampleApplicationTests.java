package com.minikube.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MinikubeSampleApplicationTests {

    @SuppressWarnings("java:S6813") // Suppress Sonar warning about field injection
    @Autowired
    private ApplicationContext context; // Field injection is acceptable in test classes

    @Test
    public void contextLoads() {
        assertThat(context).isNotNull(); // Ensures context loaded properly
    }
}
