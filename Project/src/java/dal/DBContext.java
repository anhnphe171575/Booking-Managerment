/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import Model.Booking;
import Model.Room;
import Model.RoomType;
import Model.User;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author msi
 */
public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, userID, password);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private final String serverName = "localhost";
    private final String dbName = "Hotel_Managerment";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";

    public ArrayList<Room> getRooms() {
        ArrayList<Room> rooms = new ArrayList<>();
        try {
            String sql = "Select r.RoomNumber, r.Status, rt.Image, rt.TypeID, rt.Name, rt.Description, rt.PricePerNight from Room r inner join RoomType rt on r.TypeID = rt.TypeID ";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Room r = new Room();
                r.setRoomnumber(rs.getString("RoomNumber"));

                r.setStatus(rs.getBoolean("Status"));
                RoomType rt = new RoomType();
                rt.setTypeid(rs.getInt("TypeID"));
                rt.setImage(rs.getString("Image"));
                rt.setTypename(rs.getString("Name"));
                rt.setDescription(rs.getString("Description"));
                rt.setPricePerNight(rs.getBigDecimal("PricePerNight"));
                r.setType(rt);
                rooms.add(r);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return rooms;
    }

    public ArrayList<RoomType> getRoomType() {
        ArrayList<RoomType> roomtype = new ArrayList<>();
        try {
            String sql = "select * from RoomType";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                RoomType rt = new RoomType();
                rt.setTypeid(rs.getInt("TypeID"));
                rt.setImage(rs.getString("Image"));
                rt.setTypename(rs.getString("Name"));
                rt.setDescription(rs.getString("Description"));
                rt.setPricePerNight(rs.getBigDecimal("PricePerNight"));
                roomtype.add(rt);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roomtype;
    }

    public ArrayList<User> getInfoUser() {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "select * from Users";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                User u = new User();
                u.setUserid(rs.getInt("UserID"));
                u.setFname(rs.getString("FirstName"));
                u.setLname(rs.getString("LastName"));
                u.setDob(rs.getDate("DateOfBirth"));
                u.setAddress(rs.getString("Address"));
                u.setPhone(rs.getString("Phone"));
                u.setEmail(rs.getString("Email"));
                u.setUsername(rs.getString("UserName"));
                u.setPassword(rs.getString("Password"));
                u.setPermission(rs.getBoolean("Permission"));
                users.add(u);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }
     public ArrayList<Booking> getBookings() {
        ArrayList<Booking> booking = new ArrayList<>();
        try {
            String sql = "SELECT \n"
                    + "    b.BookingID, \n"
                    + "    b.CheckinDate, \n"
                    + "    b.CheckoutDate, \n"
                    + "    b.RoomNumber, \n"
                    + "    b.TotalPrice,\n"
                    + "    b.UserID, \n"
                    + "    b.BookingStatus, \n"
                    + "    r.Status, \n"
                    + "    r.TypeID,\n"
                    + "    rt.Name,\n"
                    + "    u.FirstName,\n"
                    + "    u.LastName,\n"
                    + "    u.Email,\n"
                    + "    u.DateOfBirth,\n"
                    + "    u.Address,\n"
                    + "    u.Password,\n"
                    + "    u.UserName,\n"
                    + "    u.Phone,\n"
                    + "    u.Permission \n"
                    + "FROM \n"
                    + "    Booking b \n"
                    + "LEFT JOIN \n"
                    + "    Room r ON b.RoomNumber = r.RoomNumber \n"
                    + "LEFT JOIN \n"
                    + "    RoomType rt ON r.TypeID = rt.TypeID\n"
                    + "LEFT JOIN \n"
                    + "    Users u ON b.UserID = u.UserID;\n"
                    + "";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Booking b = new Booking();
                b.setBookingid(rs.getInt("BookingID"));
                b.setCheckin(rs.getDate("CheckinDate"));
                b.setCheckout(rs.getDate("CheckoutDate"));
                b.setAmount(rs.getBigDecimal("TotalPrice"));
                b.setStatus(rs.getString("BookingStatus"));
                Room r = new Room();
                r.setRoomnumber(rs.getString("RoomNumber"));
                r.setStatus(rs.getBoolean("Status"));
                RoomType rt = new RoomType();
                rt.setTypeid(rs.getInt("TypeID"));
                rt.setTypename("typename");
                r.setType(rt);
                b.setRoom(r);
                User u = new User();
                u.setUserid(rs.getInt("UserID"));
                u.setFname(rs.getString("FirstName"));
                u.setLname(rs.getString("LastName"));
                u.setDob(rs.getDate("DateOfBirth"));
                u.setAddress(rs.getString("Address"));
                u.setPhone(rs.getString("Phone"));
                u.setEmail(rs.getString("Email"));
                u.setUsername(rs.getString("UserName"));
                u.setPassword(rs.getString("Password"));
                u.setPermission(rs.getBoolean("Permission"));
                b.setUser(u);
                booking.add(b);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return booking;
    }
   

    public void DeleteBookingByBookingId(int ID) {
        String sql = "DELETE FROM [dbo].[Booking]\n"
                + "      WHERE BookingID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void DeleteBookingByUserId(int ID) {
        String sql = "DELETE FROM [dbo].[Booking]\n"
                + "      WHERE UserID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void DeleteBookingByRoomNumber(String ID) {
        String sql = "DELETE FROM [dbo].[Booking]\n"
                + "      WHERE RoomNumber=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void DeleteUser(int ID) {
        String sql = "DELETE FROM [dbo].[Users]\n"
                + "      WHERE UserID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void DeleteRoomType(int ID) {
        String sql = "DELETE FROM [dbo].[RoomType]\n"
                + "      WHERE TypeID=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void DeleteRoom(String ID) {
        String sql = "DELETE FROM [dbo].[Room]\n"
                + "      WHERE RoomNumber=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, ID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void InserBooking(int ID, String roomnum, String checkin, String checkout, BigDecimal totalprice, String status) {
        String sql = "INSERT INTO [dbo].[Booking]\n"
                + "           ([UserID]\n"
                + "           ,[RoomNumber]\n"
                + "           ,[CheckinDate]\n"
                + "           ,[CheckoutDate]\n"
                + "           ,[TotalPrice]\n"
                + "           ,[BookingStatus])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, ID);
            st.setString(2, roomnum);
            Date sqlDate = Date.valueOf(checkin);
            st.setDate(3, sqlDate);
            Date sqlDate1 = Date.valueOf(checkout);
            st.setDate(4, sqlDate1);
            st.setBigDecimal(5, totalprice);
            st.setString(6, status);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void InsertRoomType(String name, String image, String description, String price) {
        String sql = "INSERT INTO [dbo].[RoomType]\n"
                + "           ([Name]\n"
                + "           ,[Image]\n"
                + "           ,[Description]\n"
                + "           ,[PricePerNight])\n"
                + "     VALUES\n"
                + "           (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, description);
            st.setBigDecimal(4, BigDecimal.valueOf(Integer.parseInt(price)));
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void InsertRoom(String id, int typeid, String status) {
        String sql = "INSERT INTO [dbo].[Room]\n"
                + "       ([RoomNumber]\n"
                + "           ,[TypeID]\n"
                + "           ,[Status])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            st.setInt(2, typeid);
            boolean b1 = Boolean.parseBoolean(status);
            st.setBoolean(3, b1);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
     public void InsertUsers( String fname, String lname, String dob, String address, String Phone, String email, String user, String pass, String permission) {
        String sql = "INSERT INTO [dbo].[Users]\n"
                + "           ([FirstName]\n"
                + "           ,[LastName]\n"
                + "           ,[DateOfBirth]\n"
                + "           ,[Address]\n"
                + "           ,[Phone]\n"
                + "           ,[Email]\n"
                + "           ,[UserName]\n"
                + "           ,[Password]\n"
                + "           ,[Permission])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?,?,?)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
           
            st.setString(1, fname);
            st.setString(2, lname);
            Date sqlDate = Date.valueOf(dob);
            st.setDate(3, sqlDate);
            st.setString(4, address);
            st.setString(5, Phone);
            st.setString(6, email);
            st.setString(7, user);
            st.setString(8, pass);
            boolean b1 = Boolean.parseBoolean(permission);
            st.setBoolean(9, b1);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }
   

    public void UpdateRoomType(int id, String name, String image, String description, double price) {
        String sql = "UPDATE [dbo].[RoomType]\n"
                + "   SET [Name] = ?\n"
                + "      ,[Image] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[PricePerNight] = ?\n"
                + " WHERE TypeID= ?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, image);
            st.setString(3, description);
            st.setBigDecimal(4, BigDecimal.valueOf(price));
            st.setInt(5, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void UpdateRoom(String number, String status, int typeid) {
        String sql = "UPDATE [dbo].[Room]\n"
                + "   SET [TypeID] = ?\n"
                + "      ,[Status] = ?\n"
                + " WHERE RoomNumber= ?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, typeid);
            boolean b1 = Boolean.parseBoolean(status);
            st.setBoolean(2, b1);
            st.setString(3, number);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void UpdateStatusBooking(int id, String status) {
        String sql = "UPDATE [dbo].[Booking]\n"
                + "   SET [BookingStatus] = ?\n"
                + " WHERE BookingID= ?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void UpdateStatusRoom(String id, boolean b) {
        String sql = "UPDATE [dbo].[Room]\n"
                + "   SET [Status] = ?\n"
                + " WHERE RoomNumber= ?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setBoolean(1, b);
            st.setString(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }

    public void UpdateInfoByID(int id, String fname, String lname, String dob, String address, String Phone, String email, String user, String pass) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [FirstName] = ?\n"
                + "      ,[LastName] = ?\n"
                + "      ,[DateOfBirth] = ?\n"
                + "      ,[Address] = ?\n"
                + "      ,[Phone] = ?\n"
                + "      ,[Email] = ?\n"
                + "      ,[UserName] = ?\n"
                + "      ,[Password] = ?\n"
                + " WHERE UserID= ?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, fname);
            st.setString(2, lname);
            Date sqlDate = Date.valueOf(dob);
            st.setDate(3, sqlDate);
            st.setString(4, address);
            st.setString(5, Phone);
            st.setString(6, email);
            st.setString(7, user);
            st.setString(8, pass);
            st.setInt(9, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }
     public void UpdateRoleByID(int id, Boolean role) {
        String sql = "UPDATE [dbo].[Users]\n"
                + "   SET [Permission] = ?\n"
                + " WHERE UserID= ?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
      
            st.setBoolean(1, role); 
                  st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }
     public void UpdateCheckinCheckOutByBID(int id,String checkin, String checkout) {
        String sql = "UPDATE [dbo].[Booking]\n"
                + "   SET [CheckinDate] = ?\n"
                + "    ,[CheckoutDate] = ?\n"
                + " WHERE BookingID= ?\n";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
      
           Date sqlDate = Date.valueOf(checkin);
            st.setDate(1, sqlDate);
            Date sqlDate1 = Date.valueOf(checkout);
            st.setDate(2, sqlDate1);
            st.setInt(3, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);

        }
    }
    public static void main(String[] args) {
        DBContext db = new DBContext();
        db.DeleteBookingByBookingId(20);
    } 
}
