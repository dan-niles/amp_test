import ballerina/ai;

# Fetches the latest top headlines from Hacker News.
# + count - the number of top headlines to fetch
# + return - a list of headlines with id, title, url and score, or an error
@ai:AgentTool
isolated function getTopHeadlines(int count) returns Headline[]|error {
    int[] topStoryIds = check hackerNewsClient->get("/v0/topstories.json");
    int fetchCount = count < topStoryIds.length() ? count : topStoryIds.length();
    Headline[] headlines = [];
    foreach int i in 0 ..< fetchCount {
        int storyId = topStoryIds[i];
        HackerNewsItem item = check hackerNewsClient->get(string `/v0/item/${storyId}.json`);
        string? itemTitle = item?.title;
        string title = itemTitle is string ? itemTitle : "";
        headlines.push({id: item.id, title: title, url: item?.url, score: item?.score});
    }
    return headlines;
}

# Fetches the full details of a Hacker News article by its id, including its
# title, url and text content, so that it can be summarized.
# + articleId - the id of the Hacker News article/story
# + return - the article details, or an error if the article could not be fetched
@ai:AgentTool
isolated function getArticleDetails(int articleId) returns HackerNewsItem|error {
    HackerNewsItem item = check hackerNewsClient->get(string `/v0/item/${articleId}.json`);
    return item;
}
