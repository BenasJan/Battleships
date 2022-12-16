package com.opp.battleships;

import com.auth0.jwt.JWT;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.opp.battleships.Contracts.*;
import com.opp.battleships.Models.Player;
import org.junit.jupiter.api.*;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.*;
import org.springframework.util.Assert;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.*;
import static org.hamcrest.Matchers.emptyOrNullString;

@SpringBootTest
@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class FullIntegrationTests {

    private static Player player1 = new Player();
    private static Player player2 = new Player();
    private static String gameSessionId;
    private static final Integer colCount = 12;
    private static final Integer rowCount = 12;
    private static JsonObject inGameSession;
    private static final Integer[] movedShipCell = new Integer[2];
    private static String movedShipId;

    public static final String BASE_URL = "http://localhost:5000/api";

    @BeforeAll
    public static void generatePlayers() {
        generatePlayer(player1);
        generatePlayer(player2);
    }

    @Test
    @Order(1)
    public void stage1_registerUser1Test() {
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<AuthRequest> request = new HttpEntity<>(new AuthRequest(player1.getEmailAddress(), player1.getPassword()));

        var response = restTemplate.exchange(BASE_URL + "/Authentication/register",
                HttpMethod.POST, request, AuthRequest.class);

        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
    }

    @Test
    @Order(2)
    public void stage2_registerUser2Test() {
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<AuthRequest> request = new HttpEntity<>(new AuthRequest(player2.getEmailAddress(), player2.getPassword()));

        var response = restTemplate.exchange(BASE_URL + "/Authentication/register",
                HttpMethod.POST, request, AuthRequest.class);

        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
    }

    @Test
    @Order(3)
    public void stage3_loginUser1Test() {
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<AuthRequest> request = new HttpEntity<>(new AuthRequest(player1.getEmailAddress(), player1.getPassword()));

        var response = restTemplate.exchange(BASE_URL + "/Authentication/login",
                HttpMethod.POST, request, String.class);

        JsonObject jsonObject = new JsonParser().parse(response.getBody()).getAsJsonObject();

        Assert.isTrue(jsonObject.isJsonObject());
        DecodedJWT jwt = JWT.decode(jsonObject.get("token").getAsString());

        assertThat(jwt.getToken().length(), not(0));
        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
        player1.setAccessToken(jwt.getToken());
    }

    @Test
    @Order(4)
    public void stage4_loginUser2Test() {
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<AuthRequest> request = new HttpEntity<>(new AuthRequest(player2.getEmailAddress(), player2.getPassword()));

        var response = restTemplate.exchange(BASE_URL + "/Authentication/login",
                HttpMethod.POST, request, String.class);

        JsonObject jsonObject = new JsonParser().parse(response.getBody()).getAsJsonObject();

        Assert.isTrue(jsonObject.isJsonObject());
        DecodedJWT jwt = JWT.decode(jsonObject.get("token").getAsString());

        assertThat(jwt.getToken().length(), not(0));
        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
        player2.setAccessToken(jwt.getToken());
    }

    @Test
    @Order(5)
    public void stage5_createGameSessionTest() {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + player1.getAccessToken());
        HttpEntity<CreateGameSessionRequest> request = new HttpEntity<>(
                new CreateGameSessionRequest(
                        "icon", "New game",
                        new GameSessionSettingsRequest(rowCount, colCount, 1)
                ),
                headers
        );

        var response = restTemplate.exchange(BASE_URL + "/GameSession/createSession",
                HttpMethod.POST, request, UUID.class);

        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
        assertThat(response.getBody(), equalTo(UUID.fromString(response.getBody().toString())));

        gameSessionId = response.getBody().toString();
    }

    @Test
    @Order(6)
    public void stage6_getPlayer2IdTest() {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + player1.getAccessToken());
        Map<String, String> params = new HashMap<>();
        params.put("email", player2.getEmailAddress());


        var response = restTemplate.getForEntity(BASE_URL + "/Authentication/getUserByEmail?email=" + player2.getEmailAddress() ,
                String.class);

        var id = new JsonParser().parse(response.getBody()).getAsJsonObject().get("result").getAsString();
        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
        assertThat(id, not(emptyOrNullString()));

        player2.setUserId(id);
    }

    @Test
    @Order(7)
    public void stage7_invitePlayer2ToGameTest() {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + player1.getAccessToken());
        HttpEntity<UserInviteRequest> request = new HttpEntity<>(
            new UserInviteRequest(player2.getUserId())
        );

        var response = restTemplate
                .exchange(BASE_URL + "/GameSession/invite/" + gameSessionId,
                HttpMethod.POST, request, UserInviteRequest.class);

        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
    }

    @Test
    @Order(8)
    public void stage8_LaunchGameTest() {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + player1.getAccessToken());
        HttpEntity<LaunchGameRequest> request = new HttpEntity<>(
                new LaunchGameRequest(gameSessionId, false),
                headers
        );

        var response = restTemplate
                .exchange(BASE_URL + "/GameSession/launch-game/" + gameSessionId,
                        HttpMethod.POST, request, UserInviteRequest.class);

        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
    }

    @Test
    @Order(9)
    public void stage9_GetInGameSessionPreActionTest() {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + player1.getAccessToken());
        HttpEntity<Void> requestEntity = new HttpEntity<>(headers);

        var response = restTemplate.exchange(
                BASE_URL + "/GameSession/in-game/" + gameSessionId,
                HttpMethod.GET, requestEntity, String.class);

        var session = new JsonParser().parse(response.getBody()).getAsJsonObject();
        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
        assertThat(session.toString(), not(emptyOrNullString()));

        inGameSession = session;
        shipMovementSetup();
    }

    @Test
    @Order(10)
    public void stage10_moveShipTest() {
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Bearer " + player1.getAccessToken());
        HttpEntity<ShipMoveRequest> request = new HttpEntity<>(
                new ShipMoveRequest(movedShipId, "Up"),
                headers
        );

        var response = restTemplate.exchange(BASE_URL + "/GameSession/move-ship/" + gameSessionId,
                HttpMethod.POST, request, String.class);

        var session = new JsonParser().parse(response.getBody()).getAsJsonObject();
        assertThat(response.getStatusCode(), equalTo(HttpStatus.OK));
        assertThat(session.toString(), not(emptyOrNullString()));
        assertThat(session.toString(), not(inGameSession.toString()));
    }

    private void shipMovementSetup() {
        JsonArray tiles = inGameSession.getAsJsonArray("ownTiles");
        for(var x : tiles) {
            JsonObject tile = x.getAsJsonObject();
            if(tile.get("isShip").getAsBoolean()) {
                movedShipId = tile.get("shipId").getAsString();
                movedShipCell[0] = tile.get("columnCoordinate").getAsInt();
                movedShipCell[1] = tile.get("rowCoordinate").getAsInt();
                break;
            }
        }
    }

    private static void generatePlayer(Player player) {
        String email = "";
        String alphabet = "abcdefghijklmnopqrstuvwxyz";
        while (email.length() < 5) {
            int character = (int) (Math.random() * 26);
            email += alphabet.substring(character, character + 1);
            email += Integer.valueOf((int) (Math.random() * 99)).toString();
            email += "@gmail.com";
        }
        player.setEmailAddress(email);
        player.setPassword("123");
    }
}
