# Spring Boot without the parent POM 这种方式有问题，spring boot打包插件无效

    <dependencyManagement>
    <dependencies>
      <dependency>
        <!-- Import dependency management from Spring Boot -->
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-dependencies</artifactId>
        <version>1.5.8.RELEASE</version>
        <type>pom</type>
        <scope>import</scope>
      </dependency>
    </dependencies>
    </dependencyManagement>


# springboot配置文件取属性值使用 @field@

# springboot测试需使用@SpringBootTest，而非@WebMvcTest(XXXController.class)