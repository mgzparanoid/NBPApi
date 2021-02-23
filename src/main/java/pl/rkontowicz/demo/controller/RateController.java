package pl.rkontowicz.demo.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pl.rkontowicz.demo.exchange.ExchangeRate;
import pl.rkontowicz.demo.exchange.NbpService;
import pl.rkontowicz.demo.exchange.RateDto;

import java.util.ArrayList;
import java.util.List;

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
        model.addAttribute("certainCurrencyList", nbpService.getCertainCurrency());
        model.addAttribute("rateDtoList", nbpService.getDataFromTable());
        model.addAttribute("codes", nbpService.getListOfCodes());
        return "counter";
    }

    @PostMapping("/counter")
    public String currencyMid(double amount, Model model){
        model.addAttribute("certainCurrencyList", nbpService.getCertainCurrency());
        model.addAttribute("result", amount * nbpService.getMid().doubleValue());
        model.addAttribute("amount", amount);
        return "counter";
    }

}
