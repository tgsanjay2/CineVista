package com.cinevista.backend.service;

import com.cinevista.backend.dto.LoginRequest;
import com.cinevista.backend.security.JwtService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private AuthenticationManager auth;

    @Autowired
    private JwtService jwtService;

    public String login(LoginRequest request){
        Authentication authentication = auth
                .authenticate(new UsernamePasswordAuthenticationToken(request.getUsername(), request.getPassword()));
        if(authentication.isAuthenticated()) return jwtService.generateToken(request.getUsername());
        else return "Failed";
    }
}
