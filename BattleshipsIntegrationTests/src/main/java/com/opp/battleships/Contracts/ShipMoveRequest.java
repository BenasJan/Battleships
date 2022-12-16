package com.opp.battleships.Contracts;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ShipMoveRequest {
    private String shipId;
    private String direction;
}
