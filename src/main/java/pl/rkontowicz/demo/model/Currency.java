package pl.rkontowicz.demo.model;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Currency {
    protected int id;
    protected String name;
    protected double rate;
    protected String code;
}
