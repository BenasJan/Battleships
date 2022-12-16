package com.opp.battleships.Models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Player {
    private String userId;
    private String emailAddress;
    private String password;
    private String accessToken;
}
