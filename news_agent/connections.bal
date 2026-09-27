import ballerina/ai;
import ballerina/http;

final http:Client hackerNewsClient = check new ("https://hacker-news.firebaseio.com");

final ai:Wso2ModelProvider newsAgentModel = check ai:getDefaultModelProvider();
