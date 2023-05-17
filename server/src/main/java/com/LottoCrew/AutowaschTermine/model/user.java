package com.LottoCrew.AutowaschTermine.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class user {
    @Id
    private String id;
    private Date createDate = new Date();
    private String name;
    private String email;
    private String openingHours;
    private String price;
    private String phoneNumber;
    private String address;
    private String password;
    private Integer image_id;

}
