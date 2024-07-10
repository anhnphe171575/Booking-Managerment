/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import dal.DBContext;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author msi
 */
public class Room {

    String roomnumber;
    RoomType type;
    Boolean status;

    public String getRoomnumber() {
        return roomnumber;
    }

    public void setRoomnumber(String roomnumber) {
        this.roomnumber = roomnumber;
    }

   

    public RoomType getType() {
        return type;
    }

    public void setType(RoomType type) {
        this.type = type;
    }

    public Boolean getStatus() {
        return status;
    }

    public void setStatus(Boolean status) {
        this.status = status;
    }

    public HashMap<String, Integer> CountRoomForType() {
        DBContext db = new DBContext();
        ArrayList<Room> rooms = db.getRooms();
        HashMap<String, Integer> RoomType = new HashMap<String, Integer>();;
        for (Room r : rooms) {
            if (r.getStatus() == true) {
                if (RoomType.containsKey(r.getType().typename)) {
                    int count = RoomType.get(r.getType().getTypename()); // Get the current count
                    RoomType.put(r.getType().getTypename(), count + 1); // Increment the count and put it back
                } else {
                    RoomType.put(r.getType().getTypename(), 1); // If book is not in the map, add it with count 1
                }
            }
        }
        return RoomType;
    }
     public Room info(String id){
        DBContext db = new DBContext();
         for (Room r : db.getRooms()) {
            if (r.getRoomnumber().equals(id)) {
                return r;
            }
        }
        return null;
    }
      public ArrayList<Room> GetListRoom(String id){
        DBContext db = new DBContext();
      ArrayList<Room> room = new ArrayList<>();
         for (Room r : db.getRooms()) {
            if (r.getRoomnumber().toLowerCase().contains(id.toLowerCase())) {
                room.add(r);
            }
        }
        return room;
    }
      
     public ArrayList<Room> InfoByRoomType(int id){
        DBContext db = new DBContext();
        ArrayList<Room> room = new ArrayList<>();
         for (Room r : db.getRooms()) {
            if ((r.getType().getTypeid() == id) && r.status == true) {
                room.add(r);
            }
        }
        return room;
    }
    public static void main(String[] args) {
        Room r = new Room();
        System.out.println(r.CountRoomForType());
    }
}
