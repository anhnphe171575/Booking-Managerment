/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Guest;

import Model.Booking;
import Model.Room;
import Model.RoomType;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Date;

/**
 *
 * @author msi
 */
public class BookingGuest extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BookingGuest</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BookingGuest at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {           
        int id_raw=0;
        try{        
        String id = request.getParameter("id");      
        id_raw = Integer.parseInt(id);
        }
        catch(Exception e){
              request.getRequestDispatcher("home").forward(request, response);
        }
        Room r = new Room();
        RoomType rt = new RoomType();
        request.setAttribute("roomtype", rt.info(id_raw ).getTypename());
        request.setAttribute("room", r.InfoByRoomType(id_raw));
        request.getRequestDispatcher("BookingRoom.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String roomtype = request.getParameter("room_type");
        String roomnumber = request.getParameter("roomnumber");
        String check_in = request.getParameter("check_in");
        String check_out = request.getParameter("check_out");
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
          Date checkInDate =null;
          Date checkOutDate =null ;
        try {
            // Chuyển chuỗi thành đối tượng Date
             checkInDate = dateFormat.parse(check_in);
             checkOutDate = dateFormat.parse(check_out);
        }
        catch(ParseException e){
             e.printStackTrace();
        }
         HttpSession session = request.getSession();
        int userid = (int) session.getAttribute("userid");
        LocalDate startDate = LocalDate.parse(check_in);
        LocalDate endDate = LocalDate.parse(check_out);
        long numberOfDays = ChronoUnit.DAYS.between(startDate, endDate);
        RoomType rt = new RoomType();
        Room r = new Room();
        BigDecimal price =  r.info(roomnumber).getType().getPricePerNight();
        long amount1 = price.longValue() * numberOfDays;
        BigDecimal amount = BigDecimal.valueOf(amount1);
        String status = "pending";
        boolean check = true;
        Booking booking = new Booking();
         DBContext db = new DBContext();
         for(Booking b: booking.GetBookingByRoomNumber(roomnumber)){             
          if ((checkInDate.compareTo(b.getCheckin()) >= 0 && checkOutDate.compareTo(b.getCheckout()) <= 0) 
                    || (checkInDate.compareTo(b.getCheckin()) <= 0 && checkOutDate.compareTo(b.getCheckout()) >= 0) 
                    || (checkInDate.compareTo(b.getCheckin()) >= 0 && checkInDate.compareTo(b.getCheckout()) <= 0 && checkOutDate.compareTo(b.getCheckout()) >= 0)
                    || (checkOutDate.compareTo(b.getCheckin()) >= 0 && checkOutDate.compareTo(b.getCheckout()) <= 0 && checkInDate.compareTo(b.getCheckin()) <= 0)) {             
                check=false;
                request.setAttribute("checkin", b.getCheckin());
                request.setAttribute("checkout", b.getCheckout());
                request.setAttribute("roomnumber", roomnumber);               
                doGet(request, response);
                break; 
            }
         }
         if(check){
         request.setAttribute("status", "Booking Successfully");
        db.InserBooking(userid, roomnumber, check_in, check_out, amount,status);
        doGet(request, response);
         }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
