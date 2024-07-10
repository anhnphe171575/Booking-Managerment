/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.DBContext;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author msi
 */
public class User {
    int userid;
    String fname;
    String lname;
    Date dob;
    String address;
    String phone;
    String email;
    String username;
    String password;
    Boolean permission;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Boolean getPermission() {
        return permission;
    }

    public void setPermission(Boolean permission) {
        this.permission = permission;
    }
   public User GetUserById(int id){
       DBContext db = new DBContext();
       for(User u: db.getInfoUser()){
           if(u.getUserid() == id){
               return u;
           }
       }
        return null;
   }
   public ArrayList<User> GetUserByUserName(String id){
       DBContext db = new DBContext();
       ArrayList<User> users = new ArrayList<>();
       for(User u: db.getInfoUser()){
           if(u.getFname().concat(u.getLname()).toLowerCase().contains(id)){
               users.add(u);
           }
       }
        return users;
   }
    
}
