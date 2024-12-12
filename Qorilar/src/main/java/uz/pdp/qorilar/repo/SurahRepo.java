package uz.pdp.qorilar.repo;

import jakarta.persistence.EntityManager;
import uz.pdp.qorilar.MyListener;
import uz.pdp.qorilar.entity.Qori;
import uz.pdp.qorilar.entity.Surah;

import java.util.List;

public class SurahRepo extends BaseRepo<Surah>{

    public static Surah getSurah(int id) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.find(Surah.class, id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteSurah(int i) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            entityManager.createQuery("DELETE FROM Surah a WHERE a.id = :id")
                    .setParameter("id", i).executeUpdate();
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void updateNameById(int i, String name) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            entityManager.getTransaction().begin();
            Surah attachmentSurah = entityManager.find(Surah.class, i);
            attachmentSurah.setName(name);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static List<Surah> getSurahByQori(int qoriId) {
        try (EntityManager entityManager = MyListener.EMF.createEntityManager()) {
            return entityManager.createQuery("from Surah s where s.qori.id = :qoriId", Surah.class)
                    .setParameter("qoriId", qoriId)
                    .getResultList();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
