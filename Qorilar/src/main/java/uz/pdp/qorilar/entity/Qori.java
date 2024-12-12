package uz.pdp.qorilar.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
public class Qori extends BaseEntity{
    private String name;
    private byte[] image;

    public Qori(String name, byte[] image) {
        this.name = name;
        this.image = image;
    }
}
