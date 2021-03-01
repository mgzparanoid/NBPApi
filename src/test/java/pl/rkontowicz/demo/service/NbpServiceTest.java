package pl.rkontowicz.demo.service;

import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;
import pl.rkontowicz.demo.Dto.RateDto;
import pl.rkontowicz.demo.Dto.TableDto;
import pl.rkontowicz.demo.model.Currency;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;

@TestInstance(TestInstance.Lifecycle.PER_CLASS)
@ExtendWith(MockitoExtension.class)
class NbpServiceTest {
    public NbpService nbpService = new NbpService();

//    @Test
//    void getMid() {
//        //given
//        Currency currency = new Currency(1, "frank szwajcarski", 4.1205, "CHF");
//        BigDecimal currencyMid = nbpService.getMid("CHF");
//        //when
//        //then
//        assertThat(currencyMid.equals(currency.getRate()));
//    }

    @Test
    @BeforeAll
    void getCertainCurrency() {
        //given
        RateDto rateDto = new RateDto("frank szwajcarski", "CHF", new BigDecimal(4.1211));
        String valueName = "CHF";
        RateDto serviceDto = nbpService.getCertainCurrency(valueName);
        //when

        //then
        assertEquals(serviceDto.getCurrency(), rateDto.getCurrency());
        assertEquals(serviceDto.getCode(), rateDto.getCode());
//        assertEquals(serviceDto.getMid(), rateDto.getMid().setScale(4, RoundingMode.FLOOR));
        //In order to compare MIDS you have to change it daily.
    }

    @Test
    void getMapOfCodes() {
        //given
        Map<String, Double> mapOfCodes = new HashMap<>();
        mapOfCodes.put("CHF", 4.1211);
        //when
        Map<String, Double> serviceMap = nbpService.getMapOfCodes();
        //then
        assertEquals(serviceMap.get("CHF"), mapOfCodes.get("CHF"));
        //To make this test pass, you have to update the Mid value.
    }
}