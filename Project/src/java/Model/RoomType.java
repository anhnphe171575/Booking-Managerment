/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.DBContext;
import java.math.BigDecimal;
import java.util.ArrayList;

/**
 *
 * @author msi
 */
public class RoomType {
    int typeid;
    String Image;
    String typename;
    String Description;
    BigDecimal PricePerNight;

    public int getTypeid() {
        return typeid;
    }

    public void setTypeid(int typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public BigDecimal getPricePerNight() {
        return PricePerNight;
    }

    public void setPricePerNight(BigDecimal PricePerNight) {
        this.PricePerNight = PricePerNight;
    }  

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }
        public RoomType info(int id){
        DBContext db = new DBContext();
         for (RoomType r : db.getRoomType()) {
            if (r.getTypeid() == id) {
                return r;
            }
        }
        return null;
    }
        public ArrayList<RoomType> infoByName(String id){
        DBContext db = new DBContext();
         ArrayList<RoomType> roomtype = new ArrayList<>();
         for (RoomType r : db.getRoomType()) {
            if (r.getTypename().toLowerCase().contains(id.toLowerCase())) {
               roomtype.add(r);
            }
        }
        return roomtype;
    }
    public static void main(String[] args) {
        RoomType r = new RoomType();
        System.out.println(r.info(1).typename);
    }
}
