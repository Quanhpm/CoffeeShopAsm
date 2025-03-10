/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author Admin
 */
public class DescriptionDTO {
    private String title;
    private String text;

    // Constructor
    public DescriptionDTO(String title, String text) {
        this.title = title;
        this.text = text;
    }

    // Getters and Setters
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

@Override
public String toString() {
    return title + ": " + text;
}

}

