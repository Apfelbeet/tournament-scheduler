import * as config from "./logic/server_config";
import * as server from "./logic/server";
import * as socket from "./network/socket_connection"
import * as logger from "./util/logger";

logger.always("Starting server ...")
logger.log("Loading server_config.json ...");
config.refresh().then((_) => {
    logger.success("Configuration loaded!");
    logger.load()
    logger.log("Initializing Tournament-Server ...");
    server.init();
    logger.log("Initializing Socket-Server ...");
    socket.init(config.getPort());
});
