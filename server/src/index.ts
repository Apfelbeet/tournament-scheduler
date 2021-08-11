import * as config from "./logic/server_config";
import * as server from "./logic/server";
import * as socket from "./network/socket_connection"

console.log("Starting server ...");
console.log("Loading server_config.json ...");
config.refresh().then((_) => {
    console.log("Configuration loaded!");
    console.log("Initializing Tournament-Server ...");
    server.init();
    console.log("Initializing Socket-Server ...");
    socket.init(config.getPort());
});
