package com.dao;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import com.entity.Booking;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.entity.SenderDetails;
import java.util.*;
import com.entity.Booking;
public class ParcelManagementDAO {
    private static final String DB_URL = "jdbc:derby:C:\\Users\\Akash Singh\\MyDB;create=true";

    // Validate Officer Login
    public boolean validateOfficer(String username, String password) //officer login
    {
        String sql = "SELECT * FROM Officers WHERE username = ? AND password = ?";
//    	if(username.equals("officer") && password.equals("Password123!")) {
            return validateUser(sql, username, password);
//    		return true;
//    	}
//    	return false;
    }

    // Validate Customer Login
    public boolean validateCustomer(String username, String password) //customer login
    {
        String sql = "SELECT * FROM Customers WHERE customerUsername = ? AND password = ?";
        return validateUser(sql, username, password);
    }

    // Generic method to validate user
    private boolean validateUser(String sql, String username, String password) {
        boolean isValid = false;

        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement pst = conn.prepareStatement(sql)) {
             
            pst.setString(1, username);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();
            isValid = rs.next(); // If a record is found, username and password are valid
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return isValid;
    }
    public boolean registerCustomer(String customerName, String customerUsername, String password, String email, String mobile, String address) {
        String sql = "INSERT INTO CUSTOMERS (customerName, customerUsername, password, email, mobile, address) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement pst = conn.prepareStatement(sql)) {
             
            pst.setString(1, customerName);
            pst.setString(2, customerUsername);
            pst.setString(3, password);
            pst.setString(4, email);
            pst.setString(5, mobile);
            pst.setString(6, address);
            
            int result = pst.executeUpdate();
            return result > 0; // Return true if registration was successful

        } catch (Exception e) {
            e.printStackTrace();
            return false; // Return false if there was an error
        }
    }
    public SenderDetails fetchSenderDetails(String username) throws SQLException {
        SenderDetails senderDetails = null;

        try (Connection connection = DriverManager.getConnection(DB_URL)) {
            String sqlFetchSenderDetails = "SELECT customerName, mobile FROM Customers WHERE customerUsername = ?";
            try (PreparedStatement statement = connection.prepareStatement(sqlFetchSenderDetails)) {
                statement.setString(1, username);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                        String name = resultSet.getString("customerName");
                        String mobile = resultSet.getString("mobile");
                        senderDetails = new SenderDetails(name, mobile);
                    }
                }
            }
        }
        return senderDetails;
    }

    // Method to insert booking information
    public void insertBooking(Booking booking) throws SQLException {
        try (Connection connection = DriverManager.getConnection(DB_URL)) {
            String sqlInsert = "INSERT INTO bookings (BookingID, UserID, SenderName, SenderMobileNumber, RecName, RecAddress, RecPin, RecMobileNumber, ParWeight, ParContents, ParDelivery, ParPackingPreference, ParPickupTime, ParDropoffTime, ParServiceCost, ParStatus, DateOfBooking) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_DATE)";
            try (PreparedStatement statement = connection.prepareStatement(sqlInsert)) {
                statement.setLong(1, booking.getBookingID());
                statement.setString(2, booking.getUserID());
                statement.setString(3, booking.getSenderName());
                statement.setString(4, booking.getSenderMobileNumber());
                statement.setString(5, booking.getReceiverName());
                statement.setString(6, booking.getReceiverAddress());
                statement.setString(7, booking.getReceiverPin());
                statement.setString(8, booking.getReceiverMobileNumber());
                statement.setDouble(9, booking.getParcelWeight());
                statement.setString(10, booking.getContentsDescription());
                statement.setString(11, booking.getDeliverySpeed());
                statement.setString(12, booking.getPackagingPreference());
                statement.setString(13, booking.getPickupTime());
                statement.setString(14, booking.getDropoffTime());
                statement.setDouble(15, booking.getServiceCost());
                statement.setString(16, "Booked");

                statement.executeUpdate();
            }
        }
    }
    public List<Booking> getBookingHistory(String customerId) {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT BookingID, DateOfBooking, RecName, RecAddress, ParServiceCost, ParStatus " +
                       "FROM bookings WHERE UserID = ? ORDER BY DateOfBooking DESC";

        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, customerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Booking booking = new Booking();
                    booking.setBookingID(rs.getInt("BookingID"));
                    booking.setDateOfBooking(rs.getString("DateOfBooking"));
                    booking.setReceiverName(rs.getString("RecName"));
                    booking.setReceiverAddress(rs.getString("RecAddress"));
                    booking.setServiceCost(rs.getDouble("ParServiceCost"));
                    booking.setStatus(rs.getString("ParStatus"));
                    bookings.add(booking);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions (optional)
        }
        return bookings;
    }
    public List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT BookingID, UserID,SenderName, DateOfBooking, RecName, RecAddress, ParServiceCost, ParStatus " +
                       "FROM bookings ORDER BY DateOfBooking DESC";

        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setBookingID(rs.getInt("BookingID"));
                booking.setUserID(rs.getString("UserID"));
                booking.setSenderName(rs.getString("SenderName"));
                booking.setDateOfBooking(rs.getString("DateOfBooking"));
                booking.setReceiverName(rs.getString("RecName"));
                booking.setReceiverAddress(rs.getString("RecAddress"));
                booking.setServiceCost(rs.getDouble("ParServiceCost"));
                booking.setStatus(rs.getString("ParStatus"));
                bookings.add(booking);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle exceptions (optional)
        }
        return bookings;
    }
    public Booking getTrackingDetails(String bookingID, String userId) throws SQLException {
        Booking booking = null;
        String sql = "SELECT * FROM bookings WHERE BookingID = ? AND UserID = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement pst = conn.prepareStatement(sql)) {
             
            pst.setString(1, bookingID);
            pst.setString(2, userId);
            
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    booking = new Booking();
                    booking.setBookingID(rs.getInt("BookingID"));
                    booking.setUserID(userId);
                    booking.setSenderName(rs.getString("SenderName"));
                    booking.setReceiverName(rs.getString("RecName"));
                    booking.setReceiverAddress(rs.getString("RecAddress"));
                    booking.setDateOfBooking(rs.getString("DateOfBooking"));
                    booking.setStatus(rs.getString("ParStatus"));
                    booking.setServiceCost(rs.getDouble("ParServiceCost"));
                }
            }
        }
        return booking;
    }
    public Booking getTrackingDetailsForOfficer(String bookingID) throws SQLException {
        Booking booking = null;
        String sql = "SELECT BookingID, SenderName, RecName, RecAddress, DateOfBooking, ParStatus, ParServiceCost " +
                     "FROM bookings WHERE BookingID = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement pst = conn.prepareStatement(sql)) {

            pst.setString(1, bookingID);

            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    booking = new Booking();
                    booking.setBookingID(rs.getInt("BookingID"));
                    booking.setSenderName(rs.getString("SenderName"));
                    booking.setReceiverName(rs.getString("RecName"));
                    booking.setReceiverAddress(rs.getString("RecAddress"));
                    booking.setDateOfBooking(rs.getString("DateOfBooking"));
                    booking.setStatus(rs.getString("ParStatus"));
                    booking.setServiceCost(rs.getDouble("ParServiceCost"));
                } else {
                    throw new SQLException("Booking ID not found.");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error fetching tracking details: " + e.getMessage());
            throw e;
        }
        return booking;
    }
    public boolean updatePickupAndDropTime(String bookingID, String pickupTime, String dropTime) {
        String updateQuery = "UPDATE bookings SET ParPickupTime = ?, ParDropoffTime = ? WHERE BookingID = ?";
        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement ps = conn.prepareStatement(updateQuery)) {

            ps.setTimestamp(1, Timestamp.valueOf(pickupTime.replace("T", " ") + ":00"));
            ps.setTimestamp(2, Timestamp.valueOf(dropTime.replace("T", " ") + ":00"));
            ps.setString(3, bookingID);

            int rowsUpdated = ps.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to fetch booking details by Booking ID
    public Booking getPickupDetails(String bookingID) {
        String query = "SELECT * FROM bookings WHERE BookingID = ?";
        Booking booking = null;

        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement ps = conn.prepareStatement(query)) {

            ps.setString(1, bookingID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    booking = new Booking();
                    booking.setBookingID(rs.getInt("BookingID"));
                    booking.setSenderName(rs.getString("SenderName"));
                    booking.setReceiverName(rs.getString("RecName"));
                    booking.setReceiverAddress(rs.getString("RecAddress"));
                    booking.setDateOfBooking(rs.getString("DateOfBooking"));
                    booking.setStatus(rs.getString("ParStatus"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return booking;
    }
 // Method to fetch booking details by booking ID
    public Booking fetchBookingDetails(String bookingID) throws SQLException {
        Booking booking = null;
        String query = "SELECT BookingID, SenderName, RecName, RecAddress, DateOfBooking, ParStatus FROM bookings WHERE BookingID = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, bookingID);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    booking = new Booking();
                    booking.setBookingID(rs.getInt("BookingID"));
                    booking.setSenderName(rs.getString("SenderName"));
                    booking.setReceiverName(rs.getString("RecName"));
                    booking.setReceiverAddress(rs.getString("RecAddress"));
                    booking.setDateOfBooking(rs.getString("DateOfBooking"));
                    booking.setStatus(rs.getString("ParStatus"));
                }
            }
        }
        return booking;
    }

    // Method to update delivery status
    public boolean updateDeliveryStatus(String bookingID, String newStatus) throws SQLException {
        String query = "UPDATE bookings SET ParStatus = ? WHERE BookingID = ?";
        
        try (Connection conn = DriverManager.getConnection(DB_URL);
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, newStatus);
            ps.setString(2, bookingID);

            return ps.executeUpdate() > 0; // Returns true if the status was updated successfully
        }
    }
    //----------------------------//
   

}