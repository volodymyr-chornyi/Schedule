package com.softserveacademy.service.jsonService;

import com.google.gson.Gson;
import com.softserveacademy.model.Event;
import com.softserveacademy.service.Schedule;
import com.softserveacademy.service.exception.IncorrectAddingException;
import org.apache.log4j.Logger;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

public class GsonService {

    private static Logger logger = Logger.getLogger(GsonService.class);

    public Gson gson = new Gson();

    public void writeEventListToFile (File file, Set<Event> eventList) {
        try(FileWriter fileWriter = new FileWriter(file);) {
            gson.toJson(eventList, fileWriter);
        } catch (IOException e) {
            logger.error(e.getMessage(), e);
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
            logger.error(e.getMessage(), e);
        }
        return set;
    }

    public void addEventsFromFileToEventList (File file, Schedule schedule) throws IncorrectAddingException {
        if (file.exists())
            schedule.addEvent(readEventsFromFile(file));
    }
}