package com.hacknight.awsomecoders.entity;

import javax.persistence.*;

@Entity
@Table(name = "app_config")
public class AppConfig {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "datakey")
    private String key;
    @Column(name = "datavalue")
    private String value;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    @Override
    public String toString() {
        return "AppConfig{" +
                "id=" + id +
                ", key='" + key + '\'' +
                ", value='" + value + '\'' +
                '}';
    }

    public AppConfig(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public AppConfig() {
    }
}
