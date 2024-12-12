package uz.pdp.qorilar.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.qorilar.MyListener;
import uz.pdp.qorilar.entity.Qori;

import javax.servlet.http.Part;

public class QoriRepo extends BaseRepo<Qori> {

    public static Qori getQori(int id) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.find(Qori.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateQori(int qoriId, String name, Part img) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            Qori qori = entityManager.find(Qori.class, qoriId);
            if (name != null && !name.isEmpty()) {
                qori.setName(name);
            }
            if (img != null && img.getSize() > 0) {
                qori.setImage(img.getInputStream().readAllBytes());
            }
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
