package model;

public class Bid {
    private int bid_ID;
    private int userID;
    private int itemID;
    private double amount;
    private String bid_time;
    private String bid_date;
    private String status;

    public Bid() {
    }

    public Bid(int bid_ID, int userID, int itemID, double amount, String bid_time, String bid_date, String status) {
        this.bid_ID = bid_ID;
        this.userID = userID;
        this.itemID = itemID;
        this.amount = amount;
        this.bid_time = bid_time;
        this.bid_date = bid_date;
        this.status = status;
    }

    public int getBid_ID() {
        return bid_ID;
    }

    public void setBid_ID(int bid_ID) {
        this.bid_ID = bid_ID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getItemID() {
        return itemID;
    }

    public void setItemID(int itemID) {
        this.itemID = itemID;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getBid_time() {
        return bid_time;
    }

    public void setBid_time(String bid_time) {
        this.bid_time = bid_time;
    }

    public String getBid_date() {
        return bid_date;
    }

    public void setBid_date(String bid_date) {
        this.bid_date = bid_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
