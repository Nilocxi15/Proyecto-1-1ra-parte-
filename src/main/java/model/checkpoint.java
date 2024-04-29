package model;

public class checkpoint {
    
    private int  ID, checkpointOrder, route, limitQueue, queuePackages;
    private String address;
    private float operationFee, globalFee;

    public checkpoint() {
    }

    public checkpoint(int ID, int checkpointOrder, int route, int limitQueue, int queuePackages, String address, float operationFee, float globalFee) {
        this.ID = ID;
        this.checkpointOrder = checkpointOrder;
        this.route = route;
        this.limitQueue = limitQueue;
        this.queuePackages = queuePackages;
        this.address = address;
        this.operationFee = operationFee;
        this.globalFee = globalFee;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public int getCheckpointOrder() {
        return checkpointOrder;
    }

    public void setCheckpointOrder(int checkpointOrder) {
        this.checkpointOrder = checkpointOrder;
    }

    public int getRoute() {
        return route;
    }

    public void setRoute(int route) {
        this.route = route;
    }

    public int getLimitQueue() {
        return limitQueue;
    }

    public void setLimitQueue(int limitQueue) {
        this.limitQueue = limitQueue;
    }

    public int getQueuePackages() {
        return queuePackages;
    }

    public void setQueuePackages(int queuePackages) {
        this.queuePackages = queuePackages;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public float getOperationFee() {
        return operationFee;
    }

    public void setOperationFee(float operationFee) {
        this.operationFee = operationFee;
    }

    public float getGlobalFee() {
        return globalFee;
    }

    public void setGlobalFee(float globalFee) {
        this.globalFee = globalFee;
    }
    
}
