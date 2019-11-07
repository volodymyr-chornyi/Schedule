package com.softserveacademy.service.jsonService;

import com.google.gson.Gson;
import com.softserveacademy.model.entities.Event;
import com.softserveacademy.service.IncorrectScheduleExcepttion;
import com.softserveacademy.service.Schedule;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class GsonService {

    public Gson gson = new Gson();

    public void writeEventListToFile (File file, Set<Event> eventList) {
        try(FileWriter fileWriter = new FileWriter(file);) {
            gson.toJson(eventList, fileWriter);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public Set<Event> readEventsFromFile (File file){
        Set<Event> set = null;
        try {
            if (file.exists()) {
                Event[] eventsArray = gson.fromJson(new FileReader(file), Event[].class);
                set = new HashSet<>(Arrays.asList(eventsArray));
            }
        }catch (IOException e) {
            e.printStackTrace();
        }
        return set;
    }

    public void addEventsFromFileToEventList (File file, Schedule schedule){
        try {
            if (file.exists())
                schedule.addEvent(readEventsFromFile(file));
        }catch (IncorrectScheduleExcepttion e) {
            e.printStackTrace();
        }
    }
}