import ballerina/ai;
import ballerina/http;
import ballerinax/ai.openrouter;

final http:Client hackerNewsClient = check new ("https://hacker-news.firebaseio.com");

configurable string openRouterApiKey = ?;

final ai:ModelProvider newsAgentModel = check new openrouter:ModelProvider(
    openRouterApiKey,
    modelType = "openai/gpt-4o-mini"
);
