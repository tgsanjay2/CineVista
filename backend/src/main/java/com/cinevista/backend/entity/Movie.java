package com.cinevista.backend.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.UUID;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "movies")
public class Movie {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID movieId;

    @NotBlank(message = "Movie Name required")
    private String movieName;

    @NotBlank(message = "Language required")
    private String language;

    private String genre;

    @NotBlank(message = "Duration required")
    private Integer duration;

    private Date releaseDate;
}
