package com.cinevista.backend.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.util.List;
import java.util.Map;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
@JsonInclude(JsonInclude.Include.NON_NULL)
@JsonIgnoreProperties(ignoreUnknown = true)
public class ScreenDto {
    private UUID screenId;
    private TheaterDto theaterDto;
    private String screenName;
    private int totalSeats;

    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, List<String>> sections;

    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, List<Integer>> seatMatrix;
}
