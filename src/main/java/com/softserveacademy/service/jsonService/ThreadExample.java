package com.softserveacademy.service.jsonService;

import com.softserveacademy.model.entities.Event;

import java.io.File;
import java.util.Set;

public class ThreadExample implements Runnable{

    File testThreadFile = new File("output.json");
    Set<Event> events;

    public ThreadExample(Set<Event> events) {
        this.events = events;
    }

    @Override
    public void run() {
        GsonService gsonService = new GsonService();
        gsonService.writeEventListToFile(testThreadFile, events);
    }
}
