package pl.rkontowicz.demo.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import pl.rkontowicz.demo.Dto.RateDto;
import pl.rkontowicz.demo.Dto.TableDto;
import pl.rkontowicz.demo.Interfaces.ExchangeRate;

import java.math.BigDecimal;
import java.util.*;

@Service
@Slf4j
public class NbpService implements ExchangeRate {

    private static final String NBP_API_TABLE = "http://api.nbp.pl/api/exchangerates/tables/a/last/1?format=json";

    private final RestTemplate restTemplate = new RestTemplate();

    private final ResponseEntity<TableDto[]> forEntity = restTemplate.getForEntity(NBP_API_TABLE, TableDto[].class);

    private final TableDto[] body = forEntity.getBody();

    @Override
    public Object getDataFromTable() {
        List<RateDto> rateDtoList = new ArrayList<>();

        Arrays.stream(body).map(TableDto::getRates)
                .flatMap(b -> b.stream())
                .forEach(r -> rateDtoList.add(r));

        // If I ever wanted the results to be printed out on the console
//                .forEach(r->log.info("rate: {}", r));

        return rateDtoList;
    }

    public Object getCertainCurrency(String valueName) {
        List<RateDto> certainCurrencyList = new ArrayList<>();

        Arrays.stream(body).map(TableDto::getRates)
                .flatMap(b -> b.stream())
                .filter(c -> c.getCode().equals(valueName))
                .forEach(r -> certainCurrencyList.add(r));

        return certainCurrencyList.get(0);
    }

    public BigDecimal getMid(String valueName) {
        List<RateDto> getMid = new ArrayList<>();

        Arrays.stream(body).map(TableDto::getRates)
                .flatMap(b -> b.stream())
                .filter(c -> c.getCode().equals(valueName))
                .forEach(r -> getMid.add(r));

        return getMid.get(0).getMid();
    }

//    public Object getListOfCodes() {
//        List<RateDto> getListOfCodes = new ArrayList<>();
//
//        Arrays.stream(body).map(TableDto::getRates)
//                .flatMap(b -> b.stream())
//                .forEach(r -> getListOfCodes.add(r));
//
//        return getListOfCodes.get(0).getCode();
//    }


    //Jakby to zwracało mapę klucz ->CODE waluty i VALUE = mid valuty to by siędało obliczyć z tego.
    public Object getListOfCodes() {
        List<String> getListOfCodes = new ArrayList<>();

        Arrays.stream(body).map(TableDto::getRates)
                .flatMap(b -> b.stream())
                .forEach(r -> getListOfCodes.add(r.getCurrency()));

        return getListOfCodes;
    }

    public Object getMapOfCodes(){
        Map<String, Double> getMapOfCodes = new HashMap<String, Double>();
        Arrays.stream(body).map(TableDto::getRates)
                .flatMap(b -> b.stream())
                .forEach(r -> getMapOfCodes.put(r.getCode(),r.getMid().doubleValue()));
        return getMapOfCodes;
    }
}
