import pl.rkontowicz.demo.service.NbpService;

public class main {
    public static void main(String[] args) {
        NbpService nbpService = new NbpService();
        System.out.println(nbpService.getCertainCurrency("CHF"));
    }
}
