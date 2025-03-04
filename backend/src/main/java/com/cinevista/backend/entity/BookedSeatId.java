package com.cinevista.backend.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Objects;
import java.util.UUID;

@Embeddable
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BookedSeatId implements Serializable {
    @Column(name = "booking_id")
    private UUID bookingId;

    @Column(name = "seat_id")
    private UUID seatId;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        BookedSeatId that = (BookedSeatId) o;
        return Objects.equals(bookingId, that.bookingId) &&
                Objects.equals(seatId, that.seatId);
    }

    // Explicit hashCode() for composite key
    @Override
    public int hashCode() {
        return Objects.hash(bookingId, seatId);
    }
}
