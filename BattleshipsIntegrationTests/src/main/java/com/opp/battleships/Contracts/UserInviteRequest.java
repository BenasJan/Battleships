package com.opp.battleships.Contracts;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserInviteRequest {
    private String userId;
}
