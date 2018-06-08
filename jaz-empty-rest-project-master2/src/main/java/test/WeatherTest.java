package test;

import org.junit.Test;

import domain.client.WeatherClient;

public class WeatherTest {
	
    @Test
    public void czyDziala() {
        WeatherClient testPogodowy = new WeatherClient(); // MyClass is tested

        // assert statements
        testPogodowy.getByName("Warszawa");
    }

}
