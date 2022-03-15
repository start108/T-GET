package com.tget.web.community;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.json.simple.parser.JSONParser;

import com.tget.service.community.domain.Weather;

public class GetSearchWeather {

	public static Weather getSearchweather(Weather weather)throws Exception{
		
		//List<String> lon = new ArrayList<String>();
		
		String lon = "127.027567";  //�浵 , 
        String lat = "37.497985";	//37.498424 126.867240
		//HttpClient httpClient = new DefaultHttpClient();
		//weather.getLat() weather.getLon()
		String urlstr = "http://api.openweathermap.org/data/2.5/weather?"
                + "lat="+lat+"&lon="+lon
                +"&appid=84ac436b251ba211b816950cd0b486d8";
		
		//HttpGet httpGet = new HttpGet(urlstr);
		
		//httpGet.setHeader("Accept", "application/json");
		//httpGet.setHeader("Content-Type" , "application/json");
		
        try{
            //��ô ��Ÿ��� ������ �浵
               //���� 
            //HttpResponse httpResponse = httpClient.execute(httpGet);
            //HttpEntity httpEntity = httpResponse.getEntity();
            //OpenAPI URL
            
            URL url = new URL(urlstr);
            BufferedReader bf;
            String line;
            String result="";

            //���� ������ �޾ƿ´�
            //InputStream is = httpEntity.getContent();
            bf = new BufferedReader(new InputStreamReader(url.openStream()));

            //���ۿ� �ִ� ������ ���ڿ��� ��ȯ�Ѵ�
            while((line=bf.readLine())!=null){
                result=result.concat(line);
                //System.out.println(line);
            }

            //���ڿ��� JSON���� �Ľ�
            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObj = (JSONObject) jsonParser.parse(result);

            //���� ���
            System.out.println("���� : " + jsonObj.get("name"));
            
            //���� ���
            JSONArray weatherArray = (JSONArray) jsonObj.get("weather");
            JSONObject obj = (JSONObject) weatherArray.get(0);
            System.out.println("���� : "+obj.get("main"));

            //�µ� ���(����µ��� ��ȯ �ʿ�)
            JSONObject mainArray = (JSONObject) jsonObj.get("main");
            double ktemp = Double.parseDouble(mainArray.get("temp").toString());
            double temp = ktemp-273.15;
            System.out.printf("�µ� : %.2f\n",temp);
            
            //ǳ�� ���
            JSONObject speedArray = (JSONObject) jsonObj.get("wind");
            double wind = Double.parseDouble(speedArray.get("speed").toString());
            System.out.println("ǳ�� : "+ wind);
            
            
            //�帲 %
            JSONObject cloudArray = (JSONObject) jsonObj.get("clouds");
            double cloud = Double.parseDouble(cloudArray.get("all").toString());
            System.out.println("�帲 : "+ cloud+" %");
            
            weather.setLat(lat);
            weather.setLon(lon);
            weather.setWeather((String)obj.get("main"));
            weather.setTemp(String.format("%.2f\n", temp));
            weather.setWind(String.format("%.2f\n", wind));
            weather.setClouds(String.format("%.2f\n", cloud));
            
            bf.close();

            
//            //���� 3�ð� ���� ���� ��, mm
//            JSONObject rainArray = (JSONObject) jsonObj.get("rain");
//            System.out.println(rainArray);
//            double rain = Double.parseDouble(rainArray.get("3h").toString());
//            System.out.println("���� 3�ð� ���� ���� ��"+ rain+"mm");
//            
//            //���� 3�ð� ���� ���� ��, mm
//            JSONObject snowArray = (JSONObject) jsonObj.get("snow");
//            System.out.println(snowArray);
//            double snow = Double.parseDouble(snowArray.get("3h").toString());
//            System.out.println("���� 3�ð� ���� ���� ��"+ snow+"mm");
            
        }catch(Exception e){
            System.out.println(e.getMessage());
        }
        return weather;
    }
	
	
}