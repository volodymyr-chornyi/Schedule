package com.softserveacademy.jsonService;

import com.google.gson.Gson;
import com.softserveacademy.model.Event;
import com.softserveacademy.service.Schedule;

import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class GsonService {

    public Gson gson = new Gson();

    public void writeEventListToFile (File file, Set<Event> eventList){
        try {
            if (!file.exists())
                file.createNewFile();
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            String stringData = gson.toJson(eventList);
            byte [] dataBytesdata = stringData.getBytes();
            fileOutputStream.write(dataBytesdata, 0, dataBytesdata.length);
        }catch (IOException e) {
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
        }catch (IllegalArgumentException e) {
            e.printStackTrace();
        }
    }
}