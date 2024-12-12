package uz.pdp.qorilar.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Counter extends BaseEntity{
    public static int counter;
}
