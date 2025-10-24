package com.minikube.sample;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.junit4.SpringRunner;

import static org.assertj.core.api.Assertions.assertThat;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MinikubeSampleApplicationTests {

    private final ApplicationContext context;

    public MinikubeSampleApplicationTests(ApplicationContext context) {
        this.context = context;
    }

    @Test
    public void contextLoads() {
        assertThat(context).isNotNull(); // Ensures context loaded properly
    }
}
