package com.cinevista.backend.entity;

import com.cinevista.backend.enums.UserRole;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.UUID;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID userId;

    @NotBlank(message = "Firstname required")
    private String firstName;

    private String lastName;

    @NotBlank(message = "Password Required")
    private String passwordHash;

    @NotBlank(message = "Email required")
    @Column(unique = true)
    private String email;

    @NotBlank(message = "Phoneno required")
    @Column(unique = true)
    private String phoneNo;

    @Enumerated(EnumType.STRING)
    private UserRole role;
}
