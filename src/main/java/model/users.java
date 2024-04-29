package model;

public class users {

    private String DPI, name, lastName, rol, stateString;
    private int state;

    public users() {
    }

    public users(String DPI, String name, String lastName, String rol, int state, String stateString) {
        this.DPI = DPI;
        this.name = name;
        this.lastName = lastName;
        this.rol = rol;
        this.state = state;
        this.stateString = stateString;
    }

    public String getStateString() {
        return stateString;
    }

    public void setStateString(String stateString) {
        this.stateString = stateString;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getDPI() {
        return DPI;
    }

    public void setDPI(String DPI) {
        this.DPI = DPI;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

}
