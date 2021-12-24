package com.db;

import java.sql.Date;

public class User {

    private String username = null;
    private String fname = null;
    private String lname = null;
    private Date dob = null;
    private char gender = '\0';
    private String email = null;
    private String password = null;
    private boolean activated = false;

    public User(String username, 
            String fname, 
            String lname,
            Date dob,
            char gender,
            String email,
            String password,
            boolean activated) {
        this.username = username;
        this.fname = fname;
        this.lname = lname;
        this.dob = dob;
        this.gender = gender;
        this.email = email;
        this.password = password;
        this.activated = activated;
    }

    /**
     * @return the username
     */
    public String getUsername() {
        return username;
    }

    /**
     * @return the fname
     */
    public String getFname() {
        return fname;
    }

    /**
     * @return the lname
     */
    public String getLname() {
        return lname;
    }

    /**
     * @return the dob
     */
    public Date getDob() {
        return dob;
    }

    /**
     * @return the gender
     */
    public char getGender() {
        return gender;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }


    /**
     * @return the activated
     */
    public boolean isActivated() {
        return activated;
    }

}
