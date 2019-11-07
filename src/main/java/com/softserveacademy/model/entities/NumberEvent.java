package com.softserveacademy.model.entities;

import java.time.DateTimeException;

public enum NumberEvent {
    FIRST, SECOND, THIRD, FOURTH, FIFTH, SIXTH, SEVENTH, EIGHTH;

    private static final NumberEvent[] ENUMS = NumberEvent.values();

    public static NumberEvent of(int numberEvent) {
        if (numberEvent < 1 || numberEvent > 8) {
            throw new DateTimeException("Invalid value for NumberEvent: " + numberEvent);
        }
        return ENUMS[numberEvent - 1];
    }

    public int getValue() {
        return ordinal() + 1;
    }
}