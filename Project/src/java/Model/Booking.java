/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.DBContext;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author msi
 */
public class Booking {
    int bookingid;
    Date checkin;
    Date checkout;
    Room room;
    User user;
    BigDecimal amount;
    String status; 

    public int getBookingid() {
        return bookingid;
    }

    public void setBookingid(int bookingid) {
        this.bookingid = bookingid;
    }

    public Date getCheckin() {
        return checkin;
    }

    public void setCheckin(Date checkin) {
        this.checkin = checkin;
    }

    public Date getCheckout() {
        return checkout;
    }

    public void setCheckout(Date checkout) {
        this.checkout = checkout;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String GetRoomNumber(int id){
        DBContext db = new DBContext();
        for(Booking b: db.getBookings()){
            if(b.getBookingid() == id){
                return b.getRoom().getRoomnumber();
            }
        }
        return null;
    } 
    
     public ArrayList<Booking> GetBookingByRoomNumber(String RoomNumber){
        DBContext db = new DBContext();
        ArrayList<Booking> booking = new ArrayList<>();
        for(Booking b: db.getBookings()){
            if(b.getRoom().getRoomnumber().equals(RoomNumber) && ( b.getStatus().equals("accept"))){
               booking.add(b);
            }
        }
        return booking;
    }
      public ArrayList<Booking> GetBookingByRoomNumber2(String RoomNumber){
        DBContext db = new DBContext();
        ArrayList<Booking> booking = new ArrayList<>();
        for(Booking b: db.getBookings()){
            if(b.getRoom().getRoomnumber().equals(RoomNumber) && b.getStatus().equals("pending")){
               booking.add(b);
            }
        }
        return booking;
    }
     public ArrayList<Booking> GetBookingByRoomNumber1(String RoomNumber){
        DBContext db = new DBContext();
        ArrayList<Booking> booking = new ArrayList<>();
        for(Booking b: db.getBookings()){
            if(b.getRoom().getRoomnumber().toLowerCase().contains(RoomNumber.toLowerCase())){
               booking.add(b);
            }
        }
        return booking;
    }
     public  ArrayList<Booking> GetBookingByUserId(int id){
        DBContext db = new DBContext();
        ArrayList<Booking> booking = new ArrayList<>();
        for(Booking b: db.getBookings()){
            if(b.getUser().getUserid() == id){
                booking.add(b);
            }
        }
        return  booking;
    } 
     public  Booking GetBookingByBookingId(int id){
        DBContext db = new DBContext();       
        for(Booking b: db.getBookings()){
            if(b.getBookingid() == id){
                return b;
            }
        }
        return  null;
    } 
      public  ArrayList<Booking> GetBookingByUserName(String id){
        DBContext db = new DBContext();
        ArrayList<Booking> booking = new ArrayList<>();
        for(Booking b: db.getBookings()){
            if(b.getUser().getFname().concat(b.getUser().getLname()).toLowerCase().contains(id.toLowerCase())){
                booking.add(b);
            }
        }
        return  booking;
    } 
}
