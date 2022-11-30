package com.opp.battleships.Contracts;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class GameSessionSettingsRequest {
    private Integer rowCount;
    private Integer columnCount;
    private Integer gameType;
}
