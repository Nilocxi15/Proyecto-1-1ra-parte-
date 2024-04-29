package model;

public class route {
    
    private String initialAddress, endAddress, stateString;
    private double destinationFee, globalFee;
    private int state, ID;

    public route() {
    }

    public route(String initialAddress, String endAddress, String stateString, double destinationFee, double globalFee, int state, int id) {
        this.initialAddress = initialAddress;
        this.endAddress = endAddress;
        this.stateString = stateString;
        this.destinationFee = destinationFee;
        this.globalFee = globalFee;
        this.state = state;
        this.ID = id;
    }

    public route(String initialAddress, String endAddress, String stateString, double destinationFee, double globalFee, int state) {
        this.initialAddress = initialAddress;
        this.endAddress = endAddress;
        this.stateString = stateString;
        this.destinationFee = destinationFee;
        this.globalFee = globalFee;
        this.state = state;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getInitialAddress() {
        return initialAddress;
    }

    public void setInitialAddress(String initialAddress) {
        this.initialAddress = initialAddress;
    }

    public String getEndAddress() {
        return endAddress;
    }

    public void setEndAddress(String endAddress) {
        this.endAddress = endAddress;
    }

    public String getStateString() {
        return stateString;
    }

    public void setStateString(String stateString) {
        this.stateString = stateString;
    }

    public double getDestinationFee() {
        return destinationFee;
    }

    public void setDestinationFee(double destinationFee) {
        this.destinationFee = destinationFee;
    }

    public double getGlobalFee() {
        return globalFee;
    }

    public void setGlobalFee(double globalFee) {
        this.globalFee = globalFee;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }
   
}
