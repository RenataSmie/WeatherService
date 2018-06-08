package domain.client;

import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.core.Response;

import domain.Weather;

//Klient do komunikacji z zasobami REST
public class WeatherClient {
	
	public static final String URL = "http://api.openweathermap.org/data/2.5/weather?q=%name&units=metric&appid=4782e9a0f6af2b0a2dcd89a09ed78b18";
	
	//pobieranie danych po name
	public Weather getByName(String name){
		String customPath = String.format(URL, name);
		Response response = ClientBuilder.newClient().target(customPath).request().get();
		if(response.getStatus()==200)
			return response.readEntity(Weather.class);//->sczytujemy encje tylko jak status to 200
		return null;
		}
	

}
