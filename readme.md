# Tournament Scheduler
This schedulers allows to plan and manage tournaments. The logic itself will run on a nodejs backend server and can be controlled via the flutter app client. There is no limitation for other client as long as they they address the server correctly via websockets. Thus, other types of interaction are planed, like a simple webview.

**This is a hobby project to learn various aspects of delevopment, the server and client will almost certainly have major security and scaling flaws (and many other kinds of flaws). You should run this software only in a controlled environment!**

## Server
### Installation
The nodejs server is started the usual way:

0. install nodejs and npm or yarn.
1. clone the repository or download the source code.
2. `cd server`
3. `npm install`

Now you can start the server with `npm start`.

### Configuration
The server.config file specifies some settings:
- port: specifies the port the socket is listening/sending on.
- logTags: specifies the kind of log messages are printed out. You can toggle "info", "warning", "error", "network".
Messages of type "network" are all messages send or received by the socket. This can get quite messy, so you should enable it only if you want to monitor the messages.
Most of the other tags are currently useless.
- modes: The scheduler has modes, that determine how the game tree is generated. modes is a list of object that specify basic properties of a mode: 
    ```json
        {
            "id": number, //unique
            "title": string,
            "description": string,
            "init": string //path to module "./generation_modules/my_module"
        }
    ```
    the init-path has to show to a file with a default exported class that inherits the Module-Class.
### Structure and Behaviour
***The program is not fully thought out and at an early stage. Much will change as there are obvious deficiencies in usability and efficiency.***

#### **Server Level**
If you start a new instance of the server, you`re basically on the server level. A server can host multiple tournaments, to which a client can subscribe and unsubscribe.

#### **Tournament Level**
If you observe an tournament itself, you`re on the tournament level. 

A client, is able to send commands and data to the tournament, such as new teams or results, that the tournament will process. If the structure and data changes the tournament will notify all subscribed clients, with the changed data. 

A tournament can be started or stopped. In the stopped-State it is possible to change mode, teams. In the start-State this is not longer possible, but the game tree will be generated and results can be set. The tournament will reset all games and results when changing back to the stop-State.

## Client
The client is a flutter app designed for mobile use. But it could also be build for web and other platfroms flutter supports.
### Instalation 
You have to build the flutter app yourself.

### Usage
#### **Main Layer**
You have to connect to a running server instance, you can add a server by clicking on the '+'-button and enter the corresponding address (you may need to specity the port, too).
#### **Server Layer**
This corresponds to the serverside *Server Level* you can create a new tournament and/or subscribe to tournaments. That will open the *Tournament Layer*
#### **Tournament Layer**
This corresponds to the serverside *Tournament Level*: Now you can manage the tournament.
