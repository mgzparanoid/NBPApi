package pl.rkontowicz.demo.controller;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
