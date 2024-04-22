package com.boot.music.util;

public class WFormater {
	public String format(String st) {
		if(st.length()>=18) {
			st=st.substring(0, 16);
		st+="..";
		}
		if(st.length()<18) {
			for(int i=0;i<18-st.length();i++) {
				st+=" ";
			}
		
		}
		return st;
	}
}
