package com.opp.battleships.Contracts;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CreateGameSessionRequest {
    private String icon;
    private String name;
    private GameSessionSettingsRequest settingsDto;
}
