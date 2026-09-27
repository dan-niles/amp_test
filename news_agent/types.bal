# Represents a Hacker News item (story, job, comment, poll, etc.)
# as returned by the official Hacker News Firebase API.
public type HackerNewsItem record {
    int id;
    string? title?;
    string? url?;
    string? text?;
    string? 'by?;
    int? time?;
    int? score?;
    int[]? kids?;
    string? 'type?;
    int? descendants?;
};

# A concise representation of a headline used when listing latest stories.
public type Headline record {
    int id;
    string title;
    string? url;
    int? score;
};
