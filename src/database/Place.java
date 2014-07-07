package database;

import java.awt.geom.Point2D;

public class Place {
    private String name, placeID, formattedAddress, phoneNumber, URL, API,
            ratingImage, snippetText;
    private int priceLevel;
    private double rating;
    private boolean openNow;
    private Point2D coordinates = new Point2D.Double();

    public Place() {}

    public Place(String name, String placeID, String formattedAddress,
                 int priceLevel, double rating, boolean openNow) {
        this.name = name;
        this.placeID = placeID;
        this.formattedAddress = formattedAddress;
        this.priceLevel = priceLevel;
        this.rating = rating;
        this.openNow = openNow;
    }

    public String getName() {
        return name;
    }
    public String getPlaceID() {
        return placeID;
    }
    public String getFormattedAddress() {
        return formattedAddress;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }
    public String getURL() {
        return this.URL;
    }
    public String getAPI() {
        return this.API;
    }
    public String getRatingImage() {
        return this.ratingImage;
    }
    public String getSnippet() {
        return this.snippetText;
    }
    public int getPriceLevel() {
        return priceLevel;
    }
    public double getRating() {
        return rating;
    }
    public boolean isOpenNow() {
        return openNow;
    }
    public Point2D getCoordinates() {
        return coordinates;
    }

    public void setPlaceID(String placeID) {
        this.placeID = placeID;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setURL(String URL) {
        this.URL = URL;
    }
    public void setAPI(String API) {
        this.API = API;
    }
    public void setRatingImage(String image) {
        this.ratingImage = image;
    }
    public void setSnippetText(String snippet) {
        this.snippetText = snippet;
    }
    public void setFormattedAddress(String formattedAddress) {
        this.formattedAddress = formattedAddress;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
    public void setPriceLevel(int priceLevel) {
        this.priceLevel = priceLevel;
    }
    public void setRating(double rating) {
        this.rating = rating;
    }
    public void setOpenNow(boolean openNow) {
        this.openNow = openNow;
    }
    public void setCoordinates(Point2D coordinates) {
        this.coordinates = coordinates;
    }
}