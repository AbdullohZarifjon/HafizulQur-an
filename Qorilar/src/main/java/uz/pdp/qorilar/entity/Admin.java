package uz.pdp.qorilar.entity;

import lombok.Data;

@Data
public class Admin {
    private String name;
    private String password;

    public Admin(String name, String password) {
        this.name = name;
        this.password = password;
    }
}