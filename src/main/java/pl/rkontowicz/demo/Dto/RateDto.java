package pl.rkontowicz.demo.Dto;

import lombok.*;

import java.math.BigDecimal;

@Data
@ToString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class RateDto {
    private String currency;
    private String code;
    private BigDecimal mid;

}
