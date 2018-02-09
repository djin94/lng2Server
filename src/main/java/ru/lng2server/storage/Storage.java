package ru.lng2server.storage;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

import java.util.List;

public abstract class Storage<T extends Storage> {
    public abstract int getId();
    protected final SessionFactory factory;
    public Storage() {
        Configuration configuration = new Configuration();
       //configuration.configure(new File("src/main/resources/hibernate.cfg.xml"));
        configuration.configure();
        ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(
                configuration.getProperties()).build();
        factory = configuration.buildSessionFactory(serviceRegistry);
    }

    public abstract List<T> values();

    public int add(final T var){
        final Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.save(var);
            return var.getId();
        } finally {
            tx.commit();
            session.close();
        }
    }

    public void edit(final T var){
        final Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(var);
        } finally {
            tx.commit();
            session.close();
        }
    }

    public void delete(final int id){
        final Session session = factory.openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.delete(get(id));
        } finally {
            tx.commit();
            session.close();
        }
    }

    public abstract T get(final int id);

    public abstract int generateId();

    public abstract void close();
}
