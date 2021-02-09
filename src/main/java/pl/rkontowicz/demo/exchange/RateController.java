package pl.rkontowicz.demo.exchange;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@AllArgsConstructor
public class RateController {

    private final ExchangeRate exchangeRate;

    @RequestMapping("/")
    @ResponseBody
    public String getConcurencyTable(){
        exchangeRate.getDataFromTable();
        return "coś tam coś";
    }

}
