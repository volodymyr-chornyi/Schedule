package com.softserveacademy.service.util;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class SessionUtil {

    private Session session;
    private Transaction transaction;

    public Session getSession(){
        return session;
    }

    public Transaction getTransaction(){
        return transaction;
    }

    public Session openSession(){
        return HibernateUtil.getSessionFactory().openSession();
    }

    public Session getTrSe(){
        session = openSession();
        transaction = session.getTransaction();
        return session;
    }

    public void closeSession(){
        session.close();
    }

    public void closeTrSe(){
        transaction.commit();
        session.close();
    }
}
