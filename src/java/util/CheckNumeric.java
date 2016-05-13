/*
 * Copyright (C) 2016 Lartsev
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
package util;

import java.text.NumberFormat;
import java.text.ParsePosition;

/**
 *
 * @author http://stackoverflow.com/questions/1102891/how-to-check-if-a-string-is-numeric-in-java
 */
public class CheckNumeric {
    
    /**
     * use Java's built-in java.text.NumberFormat object to see if, 
     * after parsing the string the parser position is at the end of the string. 
     * If it is, we can assume the entire string is numeric:
     * 
     * @param str
     * @return 
     */
    public static boolean isNumeric(String str){
        NumberFormat formatter = NumberFormat.getInstance();
        ParsePosition pos = new ParsePosition(0);
        formatter.parse(str, pos);
        return str.length() == pos.getIndex();
    }
    
    /**
     * 
     * @param str
     * @return 
     */
    public static boolean isDoubleOrFloat(String str){  
        try {  
          double d = Double.parseDouble(str);  
        }  
        catch(NumberFormatException nfe) {  
          return false;  
        }  
        return true;  
    }
    
}
