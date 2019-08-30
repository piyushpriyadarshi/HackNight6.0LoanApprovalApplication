package com.syndhacathon.awsomecoders.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "agent")
public class Agent {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "agent_id")
    private int id;
    private String name;
    private String email;

    @Column(name="credit", columnDefinition="Decimal(10,2) default '0.00'")
    private Double credit;

    @Column(name="referal", columnDefinition="INT(10) default '0'")
    private int referal;

    @Column(name="clicks", columnDefinition="INT(10) default '0'")
    private int clicks;
    @OneToMany(mappedBy = "agent",cascade= CascadeType.ALL,fetch = FetchType.EAGER ,targetEntity = AppUser.class)
    @JsonIgnore
    private List<AppUser> appUserList;
    public Agent() {
    }

    public Agent(String name, String email, Double credit, int referal, int clicks, List<AppUser> appUserList) {
        this.name = name;
        this.email = email;
        this.credit = credit;
        this.referal = referal;
        this.clicks = clicks;
        this.appUserList = appUserList;
    }

    public Agent(int id, String name, String email, Double credit, int referal, int clicks) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.credit = credit;
        this.referal = referal;
        this.clicks = clicks;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Double getCredit() {
        return credit;
    }

    public void setCredit(Double credit) {
        this.credit = credit;
    }

    public int getReferal() {
        return referal;
    }

    public void setReferal(int referal) {
        this.referal = referal;
    }

    public int getClicks() {
        return clicks;
    }

    public void setClicks(int clicks) {
        this.clicks = clicks;
    }

    @Override
    public String toString() {
        return "Agent{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", credit=" + credit +
                ", referal=" + referal +
                ", clicks=" + clicks +
                '}';
    }

    public List<AppUser> getAppUserList() {
        return appUserList;
    }

    public void setAppUserList(List<AppUser> appUserList) {
        this.appUserList = appUserList;
    }
}
