package com.shakalyan.vk_test_2023.security;

import com.shakalyan.vk_test_2023.repository.EmployeeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class WebConfig {

    private final EmployeeRepository employeeRepository;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeHttpRequests()
                .requestMatchers("/login/**").permitAll()
//                .requestMatchers("/encode/**").permitAll()
//                .requestMatchers("/style/**").permitAll()
//                .requestMatchers("/scripts/**").permitAll()
                .anyRequest().authenticated()
            .and()
                .formLogin()
//                .loginPage("/login")
                .defaultSuccessUrl("/")
                .permitAll()
            .and()
                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/login?logout")
                .invalidateHttpSession(true);
        return http.build();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        return new UserDetailsServiceImpl(employeeRepository);
    }

}
