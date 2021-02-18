package pl.rkontowicz.demo.exchange;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@Slf4j
public class NbpService implements ExchangeRate{

    private static final String NBP_API_TABLE = "http://api.nbp.pl/api/exchangerates/tables/a/last/3?format=json";

    @Override
    public Object getDataFromTable() {
        RestTemplate restTemplate = new RestTemplate();

        ResponseEntity<TableDto[]> forEntity = restTemplate.getForEntity(NBP_API_TABLE, TableDto[].class);

        TableDto[] body = forEntity.getBody();

        List<RateDto> rateDtoList = new ArrayList<>();

        Arrays.stream(body).map(TableDto::getRates)
                .flatMap(b->b.stream())
                .forEach(r->rateDtoList.add(r));

        // Tutaj jakbym chciał zrobić loga w konsoli
//                .forEach(r->log.info("rate: {}", r));
        // Tutaj będziemy printowali, muszę zmienić, żeby to było przekazywane do homecontrollera i później foreachowane
//                .forEach(r-> System.out.println(r.toString()));


        return rateDtoList;
    }
}
