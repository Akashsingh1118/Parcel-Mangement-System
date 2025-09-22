package com.entity;
public class SenderDetails {
    private String name;
    private String mobile;

    public SenderDetails(String name, String mobile) {
        this.name = name;
        this.mobile = mobile;
    }

    public String getName() {
        return name;
    }

    public String getMobile() {
        return mobile;
    }
}