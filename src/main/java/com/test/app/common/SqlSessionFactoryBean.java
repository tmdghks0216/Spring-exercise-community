package com.test.app.common;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionFactoryBean {
   private static SqlSessionFactory sessionFactory=null;
   static {
      try {
         if(sessionFactory==null) {
            Reader reader=Resources.getResourceAsReader("sql-map-config.xml");
            // 입력스트림을 통해 설정을 전달받는다.
            sessionFactory=new SqlSessionFactoryBuilder().build(reader);
         }
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
   public static SqlSession getSqlSessionInstance() {
      return sessionFactory.openSession();
   }
}