
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;
import java.util.Date;
import java.lang.String;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author T C Balachanderan
 */
public class Demo2 {
    public static void main(String ar[]){
            String s="30/04/1999";
            Calendar c = Calendar.getInstance();
            int age=0;
            int current_year = c.get(Calendar.YEAR);
            int current_month = c.get(Calendar.MONTH) + 1;
            int current_date = c.get(Calendar.DATE);
            String[] spilt=s.split("/");
            int date=Integer.parseInt(spilt[0]);
            int month=Integer.parseInt(spilt[1]);
            int year=Integer.parseInt(spilt[2]);
            
            if(date<=current_date) {
                if(month<=current_month)
                    age=current_year-year;
                else
                    age=current_year-year-1;
            }
            else
                age=current_year-year-1;
            
            System.out.println("Today Date : "+current_date+"/"+current_month+"/"+current_year);
            System.out.println("DOB : "+s);
            System.out.println("Age : "+age);
            
            //LocalDate l1 = LocalDate.of(year, month, date);
            //LocalDate now1 = LocalDate.now();
            //Period diff1 = Period.between(l1, now1);
            //System.out.println("Year : "+current_year+" Month : "+current_month+" date : "+current_date);
           // System.out.println("age:" + diff1.getYears() + "years");
    }
    
}
