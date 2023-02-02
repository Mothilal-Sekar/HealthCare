
import java.util.Random;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author T C Balachanderan
 */
public class Demo {
    public static void main(String ar[]){
        Random r=new Random();
        String BP=null;
        int systolic=0;
        int Diastolic=0;
        String A1c=null;
        int A1c_value=0;
            
            
            /*systolic=r.nextInt(190-70)+70;  //Random generation between 70 - 190
            Diastolic=r.nextInt(100-40)+40; //Random generation between 40 - 100
            if( (systolic>=70) && (Diastolic>=40) ) {
                BP="LOW";
                if( (systolic>=90) && (Diastolic>=60) ) {
                    BP="IDEAL";
                    if( (systolic>=120) && (Diastolic>=80) ) {
                        BP="PREHIGH";
                        if( (systolic>=140) && (Diastolic>=90) ) {
                            BP="HIGH";
                        }
                    }
                }
            }
            
            
        int Choles_Value = r.nextInt(300);
        String Cholesterol;
            if(Choles_Value<200)
                Cholesterol="NORMAL";
            else if(Choles_Value<=239)
                Cholesterol="BORDER";
            else
                Cholesterol="HIGH";
            
            
        int Glucose_Value = r.nextInt(120-20)+20;
        String Glucose;
            if(Glucose_Value<70)
                Glucose="LOW";
            else if(Glucose_Value<=99)
                Glucose="NORMAL";
            else
                Glucose="HIGH";
			
			
			
			System.out.println("Systolic : "+systolic);
            System.out.println("Diastolic : "+Diastolic);
            System.out.println("BP : "+BP);
            
            System.out.println("Cholesterol value : "+Choles_Value);
            System.out.println("Cholesterol : "+Cholesterol);
            
            System.out.println("Glucose value : "+Glucose_Value);
            System.out.println("Glucose : "+Glucose);
			
			
			if(	BP.equals("HIGH") || Cholesterol.equals("HIGH") || Glucose.equals("HIGH") ) {
				System.out.print("Status : Emergency");
			}
                        else
                            System.out.print("Status : NORMAL");
       String table[]=new String[3];
       table[0]="cardio";
       table[1]="diabetics";
       table[2]="patient";
       for(int i=0;i<3;i++){
           System.out.println(table[i]);
       }
            systolic=r.nextInt(190-70)+70;  //Random generation between 70 - 190
            Diastolic=r.nextInt(140-40)+40; //Random generation between 40 - 100
            if(systolic<120 && Diastolic<80)
                BP="NORMAL";
            else if(systolic<=129 && Diastolic<80)
                BP="IDEAL";
            else if(systolic<=139 || Diastolic<=89) {
                BP="HIGH STAGE 1";
                if(systolic>139 && systolic<=180)
                    BP="HIGH STAGE 2";
                else if(systolic>180)
                    BP="HIGH";
                if(Diastolic>89 && Diastolic<=120)
                    BP="HIGH STAGE 2";
                else if(Diastolic>120)
                    BP="HIGH";
            }
            else if(systolic<180 || Diastolic<120) {
                BP="HIGH STAGE 2";
                if(systolic>=180)
                    BP="HIGH";
                if(Diastolic>=120)
                    BP="HIGH";
            }
            else
                BP="HIGH";
            
            
            System.out.println("Systolic : "+systolic);
            System.out.println("Diastolic : "+Diastolic);
            System.out.println("BP : "+BP);*/
            
           /* //Simulation of A1c
            A1c_value=r.nextInt(100);
            if(A1c_value<56)
                A1c="HEALTHY";
            else if(A1c_value<=64)
                A1c="PREDIABETICS";
            else
                A1c="T2DIADETICS";
            
            
            System.out.println("A1c Value : "+A1c_value);
            System.out.println("A1c : "+A1c);*/
           
           
           float a=(float) 10.5;
           if(a>=9.5)
               System.out.println("HIGH");
           else
               System.out.println("LOW");
}               
}
