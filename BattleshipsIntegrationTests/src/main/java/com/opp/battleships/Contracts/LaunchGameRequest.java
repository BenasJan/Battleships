package com.opp.battleships.Contracts;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LaunchGameRequest {
    private String gameSessionId;
    private Boolean rematch;
}
