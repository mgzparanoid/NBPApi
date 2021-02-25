package pl.rkontowicz.demo.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.rkontowicz.demo.Interfaces.ExchangeRate;
import pl.rkontowicz.demo.service.NbpService;


@Controller
@EnableAutoConfiguration
@ComponentScan()
public class RateController {

    private final NbpService nbpService;
    private final ExchangeRate exchangeRate;
//    List<RateDto> rateDtoList = new ArrayList<>();

    public RateController(NbpService nbpService, ExchangeRate exchangeRate) {
        this.nbpService = nbpService;
        this.exchangeRate = exchangeRate;
    }

    @RequestMapping("/")
    public String getConcurrencyTable() {
        exchangeRate.getDataFromTable();
        return "index";
    }

    @RequestMapping("/all")
    public String allCurrencies(Model model) {
        model.addAttribute("rateDtoList", nbpService.getDataFromTable());

        return "all";
    }

    @RequestMapping("/counter")
    public String currencyCounter(Model model){
        //         Placeholder żeby mi jakąś walutę liczyło
//        model.addAttribute("certainCurrencyList", nbpService.getCertainCurrency());
        model.addAttribute("rateDtoList", nbpService.getDataFromTable());
        model.addAttribute("getListOfCodes", nbpService.getListOfCodes());
        model.addAttribute("codes", nbpService.getListOfCodes());
        model.addAttribute("getMapOfCodes", nbpService.getMapOfCodes());
        return "counter";
    }

    @PostMapping("/counter")
    public String currencyMid(double amount, Model model){
        model.addAttribute("certainCurrencyList", nbpService.getCertainCurrency());
        model.addAttribute("getListOfCodes", nbpService.getListOfCodes());
        model.addAttribute("result", amount * nbpService.getMid().doubleValue());
        model.addAttribute("amount", amount);
        model.addAttribute("getMapOfCodes", nbpService.getMapOfCodes());
        model.addAttribute("radio");
        return "counter";
    }

}
