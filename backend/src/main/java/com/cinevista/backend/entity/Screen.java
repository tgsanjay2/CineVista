package com.cinevista.backend.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.Type;
import org.hibernate.type.SqlTypes;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "screens")
public class Screen {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID screenId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "theater_id")
    private Theater theater;

    private String screenName;

    @NotBlank(message = "Total Seats is Required")
    private int totalSeats;

    @Column(name = "sections", columnDefinition = "json")
    @NotBlank(message = "Sections are required")
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, List<String>> sections;

    @Column(name = "seat_matrix", columnDefinition = "json")
    @JsonProperty("seat_matrix")
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, List<Integer>> seatMatrix;
}
