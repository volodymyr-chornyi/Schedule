package com.softserveacademy.jsonService;

import com.softserveacademy.model.Event;

import java.io.File;
import java.io.IOException;
import java.util.Set;

public class ThreadExample implements Runnable{

    File testThreadFile = new File("E:\\SoftServe\\Schedule\\src\\main\\java\\com\\softserveacademy\\jsonService\\testThread.json");
    Set<Event> events;

    public ThreadExample(Set<Event> events) {
        this.events = events;
    }

    @Override
    public void run() {
        if(!testThreadFile.exists()) {
            try {
                testThreadFile.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        GsonService gsonService = new GsonService();
        gsonService.writeEventListToFile(testThreadFile, events);
    }
}
