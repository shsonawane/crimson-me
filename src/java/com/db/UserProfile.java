/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.db;

/**
 *
 * @author Shubham
 */
public class UserProfile {

    private String picture;
    private String aboutMe;
    private String phone;
    private String interest;
    private String instagram;
    private String snapchat;
    private String twitter;
    private String linkedIn;

    public UserProfile(String picture, String aboutMe, String phone, String interest,
            String instagram, String snapchat, String twitter, String linkedIn) {
        this.picture = picture;
        this.aboutMe = aboutMe;
        this.phone = phone;
        this.interest = interest;
        this.instagram = instagram;
        this.snapchat = snapchat;
        this.twitter = twitter;
        this.linkedIn = linkedIn;
    }

    /**
     * @return the picture
     */
    public String getPicture() {
        return picture;
    }

    /**
     * @param picture the picture to set
     */
    public void setPicture(String picture) {
        this.picture = picture;
    }

    /**
     * @return the aboutMe
     */
    public String getAboutMe() {
        return aboutMe;
    }

    /**
     * @param aboutMe the aboutMe to set
     */
    public void setAboutMe(String aboutMe) {
        this.aboutMe = aboutMe;
    }

    /**
     * @return the phone
     */
    public String getPhone() {
        return phone;
    }

    /**
     * @param phone the phone to set
     */
    public void setPhone(String phone) {
        this.phone = phone;
    }

    /**
     * @return the interest
     */
    public String getInterest() {
        return interest;
    }

    /**
     * @param interest the interest to set
     */
    public void setInterest(String interest) {
        this.interest = interest;
    }

    /**
     * @return the instagram
     */
    public String getInstagram() {
        return instagram;
    }

    /**
     * @param instagram the instagram to set
     */
    public void setInstagram(String instagram) {
        this.instagram = instagram;
    }

    /**
     * @return the snapchat
     */
    public String getSnapchat() {
        return snapchat;
    }

    /**
     * @param snapchat the snapchat to set
     */
    public void setSnapchat(String snapchat) {
        this.snapchat = snapchat;
    }

    /**
     * @return the twitter
     */
    public String getTwitter() {
        return twitter;
    }

    /**
     * @param twitter the twitter to set
     */
    public void setTwitter(String twitter) {
        this.twitter = twitter;
    }

    /**
     * @return the linkedIn
     */
    public String getLinkedIn() {
        return linkedIn;
    }

    /**
     * @param linkedIn the linkedIn to set
     */
    public void setLinkedIn(String linkedIn) {
        this.linkedIn = linkedIn;
    }

}
