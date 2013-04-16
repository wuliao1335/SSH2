package com.test.util;

import java.util.Date;
import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonUtil {
  private static final JsonConfig config = initConfig();
  public static synchronized JsonConfig config(){
    return config;
  }
  private static JsonConfig initConfig(){
    JsonConfig config = new JsonConfig();
    JsonDateProcessor p1 = new JsonDateProcessor();
    config.registerJsonValueProcessor(java.sql.Date.class, p1);
    config.registerJsonValueProcessor(java.util.Date.class, p1);
    return config;
  }
  public static class JsonDateProcessor implements JsonValueProcessor {

    public Object processArrayValue(Object obj,JsonConfig config) {
      Date date = null;
      if(obj instanceof java.sql.Date){
        date = new Date(((java.sql.Date)obj).getTime());
      }else{
        date = (Date)obj;
      }
      return DateUtil.format(date.getTime(), "yyyy-MM-dd");
    }
    public Object processObjectValue(String key, Object obj,JsonConfig config) {
      return processArrayValue(obj,config);
    }
  }
}
