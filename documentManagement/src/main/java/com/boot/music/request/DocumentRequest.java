package com.boot.music.request;

import com.boot.music.entity.User;
import com.boot.music.entity.Version;

import java.util.ArrayList;
import java.util.Date;

public class DocumentRequest {
    private String title;
    private String sumary;
    private String dateStart;
    private String dateEnd;

    public DocumentRequest(String title, String sumary, String dateStart, String dateEnd) {
        super();
        this.title = title;
        this.sumary = sumary;
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSumary() {
        return sumary;
    }

    public void setSumary(String sumary) {
        this.sumary = sumary;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }
}
