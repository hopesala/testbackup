package com.ht.servlet;

public class TeacherTimeWeek {
    private int day[];
    private int week;
    private String weeks;
	public void setWeek(int week) {
		this.week = week;
	}
	public String getWeeks() {
		weeks=null;
		if(week>=1 && week<=7)
		{
		weeks="���";
		if(week==1)
			weeks+="һ";
		else if(week==2)
			weeks+="��";
		else if(week==3)
			weeks+="��";
		else if(week==4)
			weeks+="��";
		else if(week==5)
			weeks+="��";
		else if(week==6)
			weeks+="��";
		else if(week==7)
			weeks+="��";		
		}
		return weeks;
		
	}

	public TeacherTimeWeek()
    {
    	day=new int [7];
    	for(int i=0;i<7;i++)
    		day[i]=0;
    }
    public void setDay(int num)
    {
    	day[num-1]=1;
    }
    public int getDay(int num)
    {
    	return day[num-1];
    }
    
}
