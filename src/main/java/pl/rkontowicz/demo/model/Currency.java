package pl.rkontowicz.demo.model;

//I could just add @NoArgsConstructor @AllArgsConstructor @Getters @Setters and @toString from Lombok

public class Currency {
    protected int id;
    protected String name;
    protected double rate;
    protected String code;

    public Currency() {
    }

    public Currency(int id, String name, double rate, String code) {
        this.id = id;
        this.name = name;
        this.rate = rate;
        this.code = code;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public double getRate() {
        return rate;
    }

    public String getCode() {
        return code;
    }

    @Override
    public String toString() {
        return "Currency{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", rate=" + rate +
                ", code='" + code + '\'' +
                '}';
    }
}
