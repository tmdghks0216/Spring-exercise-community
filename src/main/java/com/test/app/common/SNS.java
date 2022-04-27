package com.test.app.common;

import java.util.HashMap;


import org.json.simple.JSONObject;

import com.test.app.VO.MemVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;




/**
 * @class ExampleSend
 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
 */
public class SNS {
  public static  int sns(MemVO vo) {
    String api_key = "NCSLBZWRVN5HZBQG";
  String api_secret = "DGMWLFLBFGEOADP26OR7VDAPMRPLB3XQ";
    Message coolsms = new Message(api_key, api_secret);
    int key=(int)(Math.random() * (99999 - 10000 + 1)) + 10000;
    
    // 4 params(to, from, type, text) are mandatory. must be filled
    HashMap<String, String> params = new HashMap<String, String>();
    params.put("to", vo.getPhone());
    params.put("from", "01025556482");
    params.put("type", "SMS");
    params.put("text", "인증번호는 " +key+" 입니다.\r\n"+
    			"정확히 입력해주세요!!");
    params.put("app_version", "test app 1.2"); // application name and version
System.out.println(key);
    try {
      JSONObject obj = (JSONObject) coolsms.send(params);
      System.out.println(obj.toString());
      return key;
    } catch (CoolsmsException e) {
      System.out.println(e.getMessage());
      System.out.println(e.getCode());
      return 1;
    }
  }
}