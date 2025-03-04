package com.cinevista.backend.dto;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@JsonInclude(JsonInclude.Include.NON_NULL)
@Builder
public class Response {

    private int status;
    private String message;
    private final LocalDateTime timestamp = LocalDateTime.now();
}
