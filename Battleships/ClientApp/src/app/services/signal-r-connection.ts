import { HubConnection, HubConnectionBuilder, LogLevel } from "@microsoft/signalr";

export class SignalRConnection {
    private static connection: HubConnection;

    public static getInstance(): HubConnection {
        if (SignalRConnection.connection) {
            return SignalRConnection.connection;
        }

        SignalRConnection.connection = new HubConnectionBuilder()
            .withUrl('/battleshipsHub')
            .configureLogging(LogLevel.Information)
            .withAutomaticReconnect()
            .build();

        return SignalRConnection.connection;
    }
}