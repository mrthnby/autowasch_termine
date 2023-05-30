package com.LottoCrew.AutowaschTermine.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.Id;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class termin {
    @Id
    private String id;
    private Date terminDate = new Date();
    private String name;
    private String phoneNumber;
    private String plateNumber;
    private String autoWaschId;
}
