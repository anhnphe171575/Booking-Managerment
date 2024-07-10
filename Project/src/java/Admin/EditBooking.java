/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Admin;
import Model.Booking;
import Model.RoomType;
import dal.DBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author msi
 */
public class EditBooking extends HttpServlet {

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
            out.println("<title>Servlet EditBooking</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditBooking at " + request.getContextPath() + "</h1>");
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
        String BookingId = request.getParameter("id");
        Booking b = new Booking();
        int id = 0;
        try{
         id = Integer.parseInt(BookingId);
        }
        catch(Exception e){
              request.getRequestDispatcher("Booking").forward(request, response);
        }
       Booking b1 = b.GetBookingByBookingId(id);
       DBContext db = new DBContext();
       request.setAttribute("roomtype", db.getRoomType());
       request.setAttribute("booking", b1);
       request.getRequestDispatcher("EditBooking.jsp").forward(request, response);
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
        int BookingId = 0;
        try{
      BookingId = Integer.parseInt(request.getParameter("id"));
        }
        catch(Exception e){
            request.getRequestDispatcher("Booking").forward(request, response);
        }
     String check_in = request.getParameter("checkin");
     String check_out = request.getParameter("checkout");
     String roomnumber = request.getParameter("room");
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
          boolean check = true;
       Booking booking = new Booking();
       DBContext db = new DBContext();
         for(Booking b: booking.GetBookingByRoomNumber(roomnumber)){ 
          if (((checkInDate.compareTo(b.getCheckin()) >= 0 && checkOutDate.compareTo(b.getCheckout()) <= 0) 
                    || (checkInDate.compareTo(b.getCheckin()) <= 0 && checkOutDate.compareTo(b.getCheckout()) >= 0) 
                    || (checkInDate.compareTo(b.getCheckin()) >= 0 && checkInDate.compareTo(b.getCheckout()) <= 0 && checkOutDate.compareTo(b.getCheckout()) >= 0)
                    || (checkOutDate.compareTo(b.getCheckin()) >= 0 && checkOutDate.compareTo(b.getCheckout()) <= 0 && checkInDate.compareTo(b.getCheckin()) <= 0)) && BookingId != b.getBookingid()) {             
                 check=false;
                request.setAttribute("checkin", b.getCheckin());
                request.setAttribute("checkout", b.getCheckout());
                request.setAttribute("room", roomnumber);
                doGet(request, response);
                break; 
            }
         }
           if(check){
         db.UpdateCheckinCheckOutByBID(BookingId, check_in, check_out);
         request.setAttribute("status", "Successfully");
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
