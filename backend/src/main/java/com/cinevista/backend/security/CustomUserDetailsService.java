package com.cinevista.backend.security;

import com.cinevista.backend.entity.User;
import com.cinevista.backend.exception.NotFoundException;
import com.cinevista.backend.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmailOrPhoneNo(username, username)
                .orElseThrow(()->new NotFoundException("Email/Phone Unregistered"));

        return new AuthUser(user);
    }
}
