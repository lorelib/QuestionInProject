package com.lorelib.question.date;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * @author listening
 * @description
 * @date 2017-12-20 16:13
 * @since 1.0
 */
public class DateTest {
  public static void main(String[] args) {
    Calendar calendar = Calendar.getInstance();
    calendar.set(Calendar.YEAR, 2017);
    calendar.set(Calendar.MONTH, 1);
    //calendar.set(Calendar.DAY_OF_MONTH, 31);

    DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    System.out.println(format.format(calendar.getTime()));
    System.out.println(calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
  }
}
