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
		weeks="礼拜";
		if(week==1)
			weeks+="一";
		else if(week==2)
			weeks+="二";
		else if(week==3)
			weeks+="三";
		else if(week==4)
			weeks+="四";
		else if(week==5)
			weeks+="五";
		else if(week==6)
			weeks+="六";
		else if(week==7)
			weeks+="天";		
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
