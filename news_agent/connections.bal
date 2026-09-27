import ballerina/ai;
import ballerina/http;
import ballerinax/ai.openai;

final http:Client hackerNewsClient = check new ("https://hacker-news.firebaseio.com");

configurable string openRouterApiKey = ?;

final ai:ModelProvider newsAgentModel = check new openai:ModelProvider(
    openRouterApiKey, openai:GPT_4O_MINI, serviceUrl = "https://openrouter.ai/api/v1");
