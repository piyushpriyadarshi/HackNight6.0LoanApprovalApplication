package com.syndhacathon.awsomecoders.model;

public class Email {
    private String subject;
    private String to;
    private String from;
    private boolean status;
    private String title;
    private String link;
    private String body;

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public Email() {
    }

    public Email(String subject, String to, String from, boolean status, String title, String link, String body) {
        this.subject = subject;
        this.to = to;
        this.from = from;
        this.status = status;
        this.title = title;
        this.link = link;
        this.body = body;
    }
}
