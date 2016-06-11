package com.jxufe.sport_news.Common;

import java.util.UUID;

/**
 * Created by Administrator on 2016/3/9.
 */
public class UUIDGeneratorUtils {

    public static String uuid32(){return UUID.randomUUID().toString().replace("-","");}
}
