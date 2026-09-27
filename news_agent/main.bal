import ballerina/ai;
import ballerina/http;

listener ai:Listener newsAgentListener = new (listenOn = check http:getDefaultListener());

service /news\-agent on newsAgentListener {
    resource function post chat(@http:Payload ai:ChatReqMessage request) returns ai:ChatRespMessage|error {
        string stringResult = check newsAgent.run(request.message, request.sessionId);
        return {message: stringResult};
    }
}
