package pl.rkontowicz.demo.Interfaces;

import org.json.JSONObject;
import org.springframework.stereotype.Service;
import pl.rkontowicz.demo.model.Currency;

import java.util.List;

@Service("currencyDataFromJson")
public class CurrencyDataFromJSON {

    public List<Currency> currencyList(){
        JSONObject jsonObject = new JSONObject(readJs)

    }

}
