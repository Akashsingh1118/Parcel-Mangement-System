package com.entity;

public class Booking {
    private int bookingID;
    private String userID;
    private String senderName;
    private String senderMobileNumber;
    private String receiverName;
    private String receiverAddress;
    private String receiverPin;
    private String receiverMobileNumber;
    private double parcelWeight;
    private String contentsDescription;
    private String deliverySpeed;
    private String status;
    private String dateOfBooking;
    public String getDateOfBooking() {
        return dateOfBooking;
    }
    public void setDateOfBooking(String dateOfBooking) {
        this.dateOfBooking = dateOfBooking;
    }
    public int getBookingID() {
		return bookingID;
	}
	public void setBookingID(int bookingID) {
		this.bookingID = bookingID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderMobileNumber() {
		return senderMobileNumber;
	}
	public void setSenderMobileNumber(String senderMobileNumber) {
		this.senderMobileNumber = senderMobileNumber;
	}
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getReceiverAddress() {
		return receiverAddress;
	}
	public void setReceiverAddress(String receiverAddress) {
		this.receiverAddress = receiverAddress;
	}
	public String getReceiverPin() {
		return receiverPin;
	}
	public void setReceiverPin(String receiverPin) {
		this.receiverPin = receiverPin;
	}
	public String getReceiverMobileNumber() {
		return receiverMobileNumber;
	}
	public void setReceiverMobileNumber(String receiverMobileNumber) {
		this.receiverMobileNumber = receiverMobileNumber;
	}
	public double getParcelWeight() {
		return parcelWeight;
	}
	public void setParcelWeight(double parcelWeight) {
		this.parcelWeight = parcelWeight;
	}
	public String getContentsDescription() {
		return contentsDescription;
	}
	public void setContentsDescription(String contentsDescription) {
		this.contentsDescription = contentsDescription;
	}
	public String getDeliverySpeed() {
		return deliverySpeed;
	}
	public void setDeliverySpeed(String deliverySpeed) {
		this.deliverySpeed = deliverySpeed;
	}
	public String getPackagingPreference() {
		return packagingPreference;
	}
	public void setPackagingPreference(String packagingPreference) {
		this.packagingPreference = packagingPreference;
	}
	public String getPickupTime() {
		return pickupTime;
	}
	public void setPickupTime(String pickupTime) {
		this.pickupTime = pickupTime;
	}
	public String getDropoffTime() {
		return dropoffTime;
	}
	public void setDropoffTime(String dropoffTime) {
		this.dropoffTime = dropoffTime;
	}
	public double getServiceCost() {
		return serviceCost;
	}
	
	public void setServiceCost(double serviceCost) {
		this.serviceCost = serviceCost;
	}
	public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
	private String packagingPreference;
    private String pickupTime;
    private String dropoffTime;
    private double serviceCost;

    // Getters and setters for all fields
    // Constructor and any other methods you may need
}