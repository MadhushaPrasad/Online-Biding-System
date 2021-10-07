package model;

public class User {

    private int userID;
    private String userName;
    private String f_Name;
    private String l_Name;
    private String email;
    private String telephone;
    private String address;
    private String password;
    private String img;
    private String type;
    private String status;

    public User() {
    }

    public User(int userID, String userName, String f_Name, String l_Name, String email, String telephone,
                String address, String password, String img, String type, String status) {
        this.userID = userID;
        this.userName = userName;
        this.f_Name = f_Name;
        this.l_Name = l_Name;
        this.email = email;
        this.telephone = telephone;
        this.address = address;
        this.password = password;
        this.img = img;
        this.type = type;
        this.status = status;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getF_Name() {
        return f_Name;
    }

    public void setF_Name(String f_Name) {
        this.f_Name = f_Name;
    }

    public String getL_Name() {
        return l_Name;
    }

    public void setL_Name(String l_Name) {
        this.l_Name = l_Name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
