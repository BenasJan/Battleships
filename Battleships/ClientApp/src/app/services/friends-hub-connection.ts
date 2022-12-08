import { HubConnection, HubConnectionBuilder, LogLevel } from "@microsoft/signalr";

export class FriendsHubConnection {
    private static connection: HubConnection;

    public static getInstance(): HubConnection {
        if (FriendsHubConnection.connection) {
            return FriendsHubConnection.connection;
        }

        FriendsHubConnection.connection = new HubConnectionBuilder()
            .withUrl('/friendsHub')
            .configureLogging(LogLevel.Information)
            .withAutomaticReconnect()
            .build();

        return FriendsHubConnection.connection;
    }
}