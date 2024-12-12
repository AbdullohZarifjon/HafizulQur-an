package uz.pdp.qorilar.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.ManyToOne;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
public class Surah extends BaseEntity{

    private String name;
    private byte[] content;
    @ManyToOne
    Qori qori;

    public Surah(String name, byte[] bytes, Qori qori) {
        this.name = name;
        this.content = bytes;
        this.qori = qori;
    }
}
